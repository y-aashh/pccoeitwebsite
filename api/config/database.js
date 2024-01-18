const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Yash123%',
    database: 'faculty_interaction'
});

// Make it globally available
module.exports.connection = connection;