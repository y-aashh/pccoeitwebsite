const express = require('express');
const bcrypt = require('bcryptjs');
const jsonwebtoken = require('jsonwebtoken');
const database = require('../../config/database');
const common = require('../../config/common');

var router = express.Router();

router.post('/faculty_names', (request, response) => {
	console.log('HIT /services/admin/faculty_names');
	jsonwebtoken.verify(request.body.token, common.SECRET, function (error, data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(!data.faculty.admin) {
			// Not accessible for teachers
			response.sendStatus(401);
		} else {
			console.log('Token verified');
			const sql = `SELECT
							unique_id,
							faculty_name
						FROM
							fi_login;`
			database.connection.query(sql, function(error, result) {
				if(error) {
					console.log(error);	
					response.sendStatus(500);
				} else {
					//success
					response.json(result);
				}
			});
		}
	});
});

router.post('/delete', (request, response) => {
	console.log('HIT /services/admin/delete');
	jsonwebtoken.verify(request.body.token, common.SECRET, function (error, data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(!data.faculty.admin) {
			// Not accessible for teachers
			response.sendStatus(401);
		} else {
			console.log('Token verified');
			const sql = `DELETE
						FROM
							fi_login
						WHERE
							unique_id = ${request.body.id}`
			database.connection.query(sql, function(error,result) {
				if(error) {
					console.log(error);
					response.sendStatus(500);
				} else {
					//success
					const sql1 = `SELECT
									unique_id,
									faculty_name
								FROM
									fi_login;`
					database.connection.query(sql, function(error, result1) {
						if(error) {
							console.log(error);
							response.sendStatus(500);
						} else {
							//success
							response.json(result1);
						}
					});
				}
			});
		}
	});
});

router.post('/add', (request, response) => {
	console.log('HIT /services/admin/add');
	jsonwebtoken.verify(request.body.token, common.SECRET, function (error, data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(!data.faculty.admin) {
			// Not accessible for teachers
			response.sendStatus(401);
		} else {
			console.log('Token verified');
			var salt = bcrypt.genSaltSync(10);
			var username = request.body.password;
			var hash = bcrypt.hashSync(username, salt);
			const sql = `INSERT INTO
							fi_login (
							username,
							password,
							faculty_name
							)
						VALUES (
							'${request.body.username}',
							'${hash}',
							'${request.body.name}'
							)
							`
			database.connection.query(sql, function (error,result) {
				if(error) {
					// Query execution failed
					console.log(error);
					response.sendStatus(500);
				} else {
					// Successfully inserted
					response.json(result);
				}
			});
		}
	});
});

router.post('/get_deleted', (request, response) => {
	console.log('HIT /services/admin/get_deleted');
	jsonwebtoken.verify(request.body.token, common.SECRET, function (error, data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(!data.faculty.admin) {
			// Not accessible for teachers
			response.sendStatus(401);
		} else {
			const sql = `SELECT *
						FROM
							fi_login_backup`
			database.connection.query(sql, function (error, result) {
				if(error) {
					// Query execution failed
					response.sendStatus(500);
				} else {
					// Succes
					response.json(result);
				}
			});
		}
	});
});

router.post('/restore', (request, response) => {
	console.log('HIT /services/admin/restore');
	jsonwebtoken.verify(request.body.token, common.SECRET, function (error, data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(!data.faculty.admin) {
			// Not accessible for teachers
			response.sendStatus(401);
		} else {
			const sql_attended = `CALL restore_faculty_data(${request.body.id})`
			database.connection.query(sql_attended, function(error, result) {
				if(error) {
					console.log(error);
					response.sendStatus(500);
				} else {
					const sql_organized = `CALL restore_faculty_data_organized(${request.body.id})`
					database.connection.query(sql_organized, function(error, result) {
						if(error) {
							console.log(error);
							response.sendStatus(500);
						} else {
							const sql_login = `CALL restore_faculty_login(${request.body.id})`
							database.connection.query(sql_login, function(error, result) {
								if (error) {
									console.log(error);
									response.sendStatus(500);
								} else {
									response.sendStatus(200);
								}
							});
						}
					});
				}
			});
		}
	});
});

module.exports.router = router;