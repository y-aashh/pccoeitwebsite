const express = require('express');
const jsonwebtoken = require('jsonwebtoken');
const database = require('../../config/database');
const common = require('../../config/common');

var router = express.Router();

//Params :- userid,password
router.post('/year', (request, response) => {
	console.log('HIT /services/report/year');
	jsonwebtoken.verify(request.body.token, common.SECRET, function(error,data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			const sql = `SELECT YEAR(start_date) AS date,
							COUNT(start_date) AS count
						FROM
							faculty_data
						GROUP BY
							YEAR(start_date)`
			database.connection.query(sql, function(error,result) {
				if(error) {
					// Query failed
					console.log(error);
					response.sendStatus(500);
				} else {
					// Success
					var obj = {
						year : [],
						count :[]
					};
					for(var i=0;i<result.length;i++) {
						obj.year.push(result[i].date);
						obj.count.push(result[i].count);
					}
					response.json(obj);
				}
			});
		}
	});
});

router.post('/table_year', (request, response) => {
	console.log('HIT /services/report/table_year');
	jsonwebtoken.verify(request.body.token, common.SECRET, function(error,data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			const sql = `SELECT YEAR(start_date) AS date,
							COUNT(start_date) AS count
						FROM
							faculty_data
						GROUP BY
							YEAR(start_date)`
			database.connection.query(sql, function(error,result) {
				if(error) {
					// Query failed
					console.log(error);
					response.sendStatus(500);
				} else {
					// Success
					response.json(result);
				}
			});
		}
	});
});

router.post('/type', (request, response) => {
	console.log('HIT /services/report/type');
	jsonwebtoken.verify(request.body.token, common.SECRET, function(error,data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			const sql = `SELECT interaction_type AS type,
							COUNT(interaction_type) AS count
						FROM
							faculty_data
						GROUP BY
							interaction_type`
			database.connection.query(sql, function(error,result) {
				if(error) {
					// Query failed
					console.log(error);
					response.sendStatus(500);
				} else {
					// Success
					var obj = {
						inter_type : [],
						count : []
					};
					for(var i=0;i<result.length;i++) {
						obj.inter_type.push(result[i].type);
						obj.count.push(result[i].count);
					}
					response.json(obj);
				}
			});
		}
	});
});

router.post('/table_type', (request, response) => {
	console.log('HIT /services/report/table_type');
	jsonwebtoken.verify(request.body.token, common.SECRET, function(error,data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			const sql = `SELECT interaction_type AS type,
							COUNT(interaction_type) AS count
						FROM
							faculty_data
						GROUP BY
							interaction_type`
			database.connection.query(sql, function(error,result) {
				if(error) {
					// Query failed
					console.log(error);
					response.sendStatus(500);
				} else {
					// Success
					response.json(result);
				}
			});
		}
	});
});

router.post('/duration', (request, response) => {
	console.log('HIT /services/report/duration');
	jsonwebtoken.verify(request.body.token, common.SECRET, function(error,data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			const sql = `SELECT duration,
							COUNT(duration) AS count
						FROM
							faculty_data
						GROUP BY
							duration`
			database.connection.query(sql, function(error,result) {
				if(error) {
					// Query failed
					console.log(error);
					response.sendStatus(500);
				} else {
					// Success
					var obj = {
						duration : [],
						count : []
					};
					for(var i=0;i<result.length;i++) {
						obj.duration.push(result[i].duration);
						obj.count.push(result[i].count);
					}
					response.json(obj);
				}
			});
		}
	});
});

router.post('/table_duration', (request, response) => {
	console.log('HIT /services/report/table_duration');
	jsonwebtoken.verify(request.body.token, common.SECRET, function(error,data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			const sql = `SELECT duration,
							COUNT(duration) AS count
						FROM
							faculty_data
						GROUP BY
							duration`
			database.connection.query(sql, function(error,result) {
				if(error) {
					// Query failed
					console.log(error);
					response.sendStatus(500);
				} else {
					// Success
					response.json(result);
				}
			});
		}
	});
});

module.exports.router = router;