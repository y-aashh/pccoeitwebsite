const express = require('express');
const jsonwebtoken = require('jsonwebtoken');
const database = require('../../config/database');
const common = require('../../config/common');

var router = express.Router();

router.post('/attended', (request, response) => {
	console.log('HIT /services/view/attended');
	jsonwebtoken.verify(request.body.token, common.SECRET, function (error, data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			console.log('Token verified');
			const sql = `SELECT *
						FROM
							faculty_data`;
			database.connection.query(sql, function(error,result) {
				if(error) {
					// Query failed
					response.sendStatus(500);
				}
				else {
					// success
					response.json(result);
				}
			});
		}
	});
});

router.post('/organized', (request, response) => {
	console.log('HIT /services/view/organized');
	jsonwebtoken.verify(request.body.token, common.SECRET, function (error, data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			console.log('Token verified');
			const sql = `SELECT *
						FROM
							workshop_organized_view`;
			database.connection.query(sql, function(error,result) {
				if(error) {
					// Query failed
					response.sendStatus(500);
				}
				else {
					// success
					response.json(result);
				}
			});
		}
	});
});

module.exports.router = router;