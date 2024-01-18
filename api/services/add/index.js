const express = require('express');
const jsonwebtoken = require('jsonwebtoken');
const database = require('../../config/database');
const common = require('../../config/common');

var router = express.Router();

router.post('/attended', (request, response) => {
	console.log('HIT /services/add/attended');
	jsonwebtoken.verify(request.body.token, common.SECRET, function (error, data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if (data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			console.log('Token verified');
			const sql = `INSERT INTO
							faculty_interaction_info
							(
							faculty_number,
							workshop_name,
							interaction_type,
							duration,
							start_date,
							organized_by
							)
						VALUES
							(
							${data.faculty.id},
							'${request.body.workshop_name}',
							'${request.body.interaction_type}',
							${request.body.duration},
							'${request.body.start_date}',
							'${request.body.organized_by}'
							)`;
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
	console.log('HIT /services/add/organized');
	jsonwebtoken.verify(request.body.token, common.SECRET, function (error, data) {
		if (error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			console.log('Token verified');
			const sql = `INSERT INTO
							workshop_organized
							(
							faculty_number,
							workshop_name,
							venue,
							year_conducted
							)
						VALUES
							(
							${data.faculty.id},
							'${request.body.workshop_name}',
							'${request.body.venue}',
							'${request.body.date}'
							)`;
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