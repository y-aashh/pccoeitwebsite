const express = require('express');
const bcrypt = require('bcryptjs');
const jsonwebtoken = require('jsonwebtoken');
const database = require('../../config/database');
const common = require('../../config/common');

var router = express.Router();

//Params :- userid,password
router.post('/teacher', (request, response) => {
	console.log('HIT /Login/teacher');
	const sql = `SELECT *
                FROM 
                    fi_login 
				WHERE
					username = '${request.body.userid}'`;
	database.connection.query(sql, function (error, result) {
		if (error) {
			// Query execution failed
			console.log(error);
			response.sendStatus(500);
		} else if(result.length === 0){
			//User does not exists
			console.log('user not exist')
			response.sendStatus(400);
		} else {
			// Success
			console.log('Success');
			bcrypt.compare(request.body.password,result[0].password,function(error,verify) {
				if(error){
					//comparison error
					console.log(error);
					response.sendStatus(500);
				}
				else if(verify === false) {
					//Authentication failed
					response.sendStatus(401);
				}
				else {
					//valid faculty
					//Token preparation
					const faculty = {
						id : result[0].unique_id,
						admin: false
					};
					const name = result[0].faculty_name;
					jsonwebtoken.sign( {faculty}, common.SECRET, function(error,token) {
						if(error) {
							console.log(error);
							response.sendStatus(500);
						} else {
							console.log('token',token);
							response.json({
								token: token,
								name: name
							})
						}
					});
				}
			});
		}
	});
});

router.post('/admin', (request, response) => {
	console.log('HIT /Login/admin');
	const sql = `SELECT *
                FROM
                    admin_login
				WHERE
					username = '${request.body.userid}'`;
	database.connection.query(sql, function (error, result) {
		if (error) {
			// Query execution failed
			console.log(error);
			response.sendStatus(500);
		} else if(result.length === 0){
			//User does not exists
			console.log('user not exist')
			response.sendStatus(400);
		} else {
			// Success
			console.log('Success');
			bcrypt.compare(request.body.password,result[0].password,function(error,verify) {
				if(error){
					//comparison error
					console.log(error);
					response.sendStatus(500);
				}
				else if(verify === false) {
					//Authentication failed
					response.sendStatus(401);
				}
				else {
					//valid faculty
					//Token preparation
					const faculty = {
						id : result[0].unique_id,
						admin: true
					};
					const name = 'Admin';
					jsonwebtoken.sign( {faculty}, common.SECRET, function(error,token) {
						if(error) {
							console.log(error);
							response.sendStatus(500);
						} else {
							console.log('token',token);
							response.json({
								token: token,
								name: name
							})
						}
					});
				}
			});
		}
	});
});

module.exports.router = router;