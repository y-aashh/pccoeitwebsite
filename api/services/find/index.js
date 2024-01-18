const express = require('express');
const jsonwebtoken = require('jsonwebtoken');
const database = require('../../config/database');
const common = require('../../config/common');
const Excel = require('exceljs');
const fs = require('fs');
const util = require('util');
const workbook = new Excel.Workbook();
const tempfile = require('tempfile');
var common_result;

var router = express.Router();

router.post('/get_data', (request, response) => {
	console.log('HIT /services/find/get_data');
	jsonwebtoken.verify(request.body.token, common.SECRET, function (error, data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			console.log('Token verified');
			const login_sql = `SELECT
									faculty_name
								FROM
									fi_login;`
			database.connection.query(login_sql, function(error, login_result) {
				if(error) {
					console.log(error);
					response.sendStatus(500);
				} else {
					//success
					var obj = {
						faculty_name :[],
						year: []
					};
					for(var i=0;i<login_result.length;i++) {
						obj.faculty_name.push(login_result[i].faculty_name);
					}
					const years_sql = `	SELECT
											YEAR(start_date) AS date
										FROM
											faculty_interaction_info
										GROUP BY
											YEAR(start_date)`
					database.connection.query(years_sql, function(error,years_result) {
						if(error) {
							console.log(error);
							response.sendStatus(500);
						} else {
							for(var i=0;i<years_result.length;i++) {
								obj.year.push(years_result[i].date);
							}
							response.json(obj);
						}
					});
				}
			});
		}
	});
});

router.post('/filter', (request, response) => {
	console.log('HIT /services/find/filter');
	console.log(request.body);
	jsonwebtoken.verify(request.body.token, common.SECRET, function (error, data) {
		if(error) {
			console.log(error);
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			faculty = '(';
			temp = request.body.faculties.split(',');
			for(let i=0;i<temp.length;i++) {
				if(i != temp.length-1) {
					faculty += '\'' + temp[i] + '\',';
				} else {
					faculty += '\'' + temp[i] + '\'';
				}
			}
			faculty += ')'
			console.log(faculty);
			temp = request.body.semester.split(',');
			semester = [];
			for(let i=0;i<temp.length;i++) {
				if(temp[i] == 1) {
					semester.push(7,8,9,10,11,12);
				} else if(temp[i] == 2) {
					semester.push(1,2,3,4,5,6);
				}
			}
			const sql = `SELECT
							faculty_name,
							workshop_id,
							workshop_name,
							interaction_type,
							duration,
							DATE_FORMAT(start_date, "%Y-%c-%d") AS start_date,
							organized_by
						FROM
							faculty_data
						WHERE
							faculty_name IN ${faculty}
						AND
							YEAR(start_date) IN (${request.body.years})
						AND
							MONTH(start_date) IN (${semester})`
			database.connection.query(sql, function(error, result) {
				if(error) {
					console.log(error);
				} else {
					for(let i=0;i<result.length;i++) {
						result[i].start_date = result[i].start_date.split('T')[0];
					}
					common_result = result;
					response.json(result);
				}
			});
		}
	});
});

router.post('/print', (request, response) => {
	console.log('HIT /services/find/print');
	console.log(request.body);
	jsonwebtoken.verify(request.body.token, common.SECRET, function (error, data) {
		if(error) {
			console.log(error);
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			let sheet = workbook.getWorksheet('Teacher');
			if(sheet !== undefined) {
				console.log(sheet.id);
				workbook.removeWorksheet(sheet.id);
			}
			const worksheet = workbook.addWorksheet('Teacher');
			worksheet.columns = [
				{header: 'Faculty Name', key: 'faculty_name', width: 30, bold: true},
				{header: 'Workshop Name', key: 'workshop_name', width: 40}, 
				{header: 'Interaction Type', key: 'interaction_type', width: 20},
				{header: 'Duration', key: 'duration', width: 15},
				{header: 'Start Date', key: 'start_date', width: 20},
				{header: 'Organized By', key: 'organized_by', width: 40}
			];
			worksheet.getCell('A1').font = {
				underline: true,
				bold: true
			};
			worksheet.getCell('B1').font = {
				underline: true,
				bold: true
			};
			worksheet.getCell('C1').font = {
				underline: true,
				bold: true
			};
			worksheet.getCell('D1').font = {
				underline: true,
				bold: true
			};
			worksheet.getCell('E1').font = {
				underline: true,
				bold: true
			};
			worksheet.getCell('F1').font = {
				underline: true,
				bold: true
			};
			for(let i=0;i<common_result.length;i++) {
				worksheet.addRow({faculty_name: common_result[i].faculty_name,
								workshop_name: common_result[i].workshop_name,
								interaction_type: common_result[i].interaction_type,
								duration: common_result[i].duration,
								start_date: common_result[i].start_date,
								organized_by: common_result[i].organized_by
				});
			}
			workbook.xlsx.writeFile('Data.xlsx');
			setTimeout(function() {
				response.download('Data.xlsx');
			},750);
			setTimeout(function() {
				fs.unlink('Data.xlsx', function(error) {
					if(error) {
						// Couldn't remove
						console.log(error);
					} else {
						console.log('Deleted successfully');
					}
				});
			},1000);
		}
	});
});

module.exports.router = router;