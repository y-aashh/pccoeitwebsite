const express = require('express');
const jsonwebtoken = require('jsonwebtoken');
const database = require('../../config/database');
const common = require('../../config/common');

var router = express.Router();


router.post('/attended', (request, response) => {
	console.log('HIT /services/edit/attended');
	jsonwebtoken.verify(request.body.token, common.SECRET, function(error,data) {
		if(error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			const sql = `SELECT 
							a.workshop_id,
							a.workshop_name,
							a.interaction_type,
							a.duration,
							DATE_FORMAT(a.start_date, "%Y-%c-%d") AS start_date,
							a.organized_by
						FROM
							faculty_interaction_info a
						INNER JOIN
							fi_login b
						ON
							b.unique_id = a.faculty_number
						WHERE
							a.faculty_number = ${data.faculty.id};`
			database.connection.query(sql, function(error,result) {
				if(error) {
					// Query failed
					console.log(error);
					response.sendStatus(500);
				} else {
					// Success
					//console.log(result);
					response.json(result);
				}
			});
		}
	});
});

router.post('/attended_update', (request, response) => {
	console.log('HIT /services/edit/att_update');
	jsonwebtoken.verify(request.body.token, common.SECRET, function(error,data) {
		if(error) {
			// Token verification failed
			response.sendStatus(401);
		} else if (data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			const sql0 = `UPDATE
							faculty_interaction_info
						SET
							workshop_name = '${request.body.workshop_name}',
							interaction_type = '${request.body.interaction_type}',
							duration = ${request.body.duration},
							start_date = '${request.body.start_date}',
							organized_by = '${request.body.organized_by}'
						WHERE
							workshop_id = ${request.body.workshop_id}`
			database.connection.query(sql0, function(error,result) {
				if(error) {
					// Query failed
					console.log(error);
					response.sendStatus(500);
				} else {
					// Success
						const sql = `SELECT 
									a.workshop_id,
									a.workshop_name,
									a.interaction_type,
									a.duration,
									DATE_FORMAT(a.start_date, "%Y-%c-%d") AS start_date,
									a.organized_by
								FROM
									faculty_interaction_info a
								INNER JOIN
									fi_login b
								ON
									b.unique_id = a.faculty_number
								WHERE
									a.faculty_number = ${data.faculty.id};`
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
		}
	});
});

router.post('/attended_delete', (request, response) => {
	console.log('HIT /services/edit/attended_delete');
	jsonwebtoken.verify(request.body.token, common.SECRET, function(error,data) {
		if(error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			const sql0 = `DELETE
						FROM
							faculty_interaction_info
						WHERE
							workshop_id = ${request.body.workshop_id}`
			database.connection.query(sql0, function(error,result) {
				if(error) {
					// Query failed
					console.log(error);
					response.sendStatus(500);
				} else {
					// Success
						const sql = `SELECT 
									a.workshop_id,
									a.workshop_name,
									a.interaction_type,
									a.duration,
									DATE_FORMAT(a.start_date, "%Y-%c-%d") AS start_date,
									a.organized_by
								FROM
									faculty_interaction_info a
								INNER JOIN
									fi_login b
								ON
									b.unique_id = a.faculty_number
								WHERE
									a.faculty_number = ${data.faculty.id};`
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
		}
	});
});

router.post('/organized', (request, response) => {
	console.log('HIT /services/edit/organized');
	jsonwebtoken.verify(request.body.token, common.SECRET, function(error,data) {
		if(error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			const sql = `SELECT
							a.workshop_id,
							a.workshop_name,
							a.venue,
							a.year_conducted
						FROM
							workshop_organized a
						INNER JOIN
							fi_login b
						ON
							b.unique_id = a.faculty_number
						WHERE
							a.faculty_number = ${data.faculty.id};`
			database.connection.query(sql, function(error,result) {
				if(error) {
					// Query failed
					console.log(error);
					response.sendStatus(500);
				} else {
					// Success
					//console.log(result);
					response.json(result);
				}
			});
		}
	});
});

router.post('/organized_update', (request, response) => {
	console.log('HIT /services/edit/organized_update');
	jsonwebtoken.verify(request.body.token, common.SECRET, function(error,data) {
		if(error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			const sql0 = `UPDATE
							workshop_organized
						SET
							workshop_name = '${request.body.name}',
							venue = '${request.body.venue}',
							year_conducted = '${request.body.date}'
						WHERE
							workshop_id = ${request.body.id}`
			database.connection.query(sql0, function(error,result) {
				if(error) {
					// Query failed
					console.log(error);
					response.sendStatus(500);
				} else {
					// Success
						const sql = `SELECT
										a.workshop_id,
										a.workshop_name,
										a.venue,
										a.year_conducted
									FROM
										workshop_organized a
									INNER JOIN
										fi_login b
									ON
										b.unique_id = a.faculty_number
									WHERE
										a.faculty_number = ${data.faculty.id};`
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
		}
	});
});

router.post('/organized_delete', (request, response) => {
	console.log('HIT /services/edit/organized_delete');
	jsonwebtoken.verify(request.body.token, common.SECRET, function(error,data) {
		if(error) {
			// Token verification failed
			response.sendStatus(401);
		} else if(data.faculty.admin) {
			// Not accessible to admin
			response.sendStatus(401);
		} else {
			const sql0 = `DELETE
						FROM
							workshop_organized
						WHERE
							workshop_id = ${request.body.id}`
			database.connection.query(sql0, function(error,result) {
				if(error) {
					// Query failed
					console.log(error);
					response.sendStatus(500);
				} else {
					// Success
						const sql = `SELECT
										a.workshop_id,
										a.workshop_name,
										a.venue,
										a.year_conducted
									FROM
										workshop_organized a
									INNER JOIN
										fi_login b
									ON
										b.unique_id = a.faculty_number
									WHERE
										a.faculty_number = ${data.faculty.id};`
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
		}
	});
});

module.exports.router = router;