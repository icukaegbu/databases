var mysql = require('mysql');
var mysql = require('mysql');
/* If the node mysql module is not found on your system, you may
 * need to do an "sudo npm install -g mysql". */

/* You'll need to fill the following out with your mysql username and password.
 * database: "chat" specifies that we're using the database called
 * "chat", which we created by running schema.sql.*/
var dbConnection = mysql.createConnection({
  user: "root",
  password: "",
  database: "chat"
});

dbConnection.connect();
/* Now you can make queries to the Mysql database using the
 * dbConnection.query() method.
 * See https://github.com/felixge/node-mysql for more details about
 * using this module.*/




exports.findAllMessages = function(cb){
	//select all message
	var querystring = 'SELECT * FROM user_messages';

	dbConnection.query(querystring, [], function(err, rows, fields){
		cb(err, rows);
	});

	//dbConnection.end();
};

exports.findUser = function(username, cb){
	//find a specific user in the DB
	var querystring = 'SELECT * FROM Users SET ?';

	dbConnection.query(querystring, [username], function(err, rows, fields){
		cb(err, rows);
	});

	//dbConnection.end();
};

exports.saveUser = function(username, cb){
	var querystring = 'INSERT INTO Users SET ?';

	dbConnection.query(querystring, [username], function(err, rows, fields){
		cb(err, rows);
	});

	//dbConnection.end();
};

exports.saveMessage = function(message, userid, roomname, cb){
	var querystring = 'INSERT INTO Messages SET ?';

	dbConnection.query(query, [message, userid, roomname], function(err, rows, fields){
		cb(err, rows);
	});
};
