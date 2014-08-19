/*DROP DATABASE chat;*/
CREATE DATABASE chat;

USE chat;

/* Create other tables and define schemas for them here! */
CREATE TABLE Rooms(
	id int not null auto_increment,
	name varchar(20) not null,

	PRIMARY KEY(id),
	UNIQUE(name)
);

CREATE TABLE Users(
	id int not null auto_increment,
	username varchar(20) not null,
	password varchar(20),

	PRIMARY KEY(id),
	UNIQUE(username)
);


CREATE TABLE Messages(
	id int not null auto_increment,
	message varchar(255) not null,
	user_id int not null,
	room_id int,

	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES Users(id),
	FOREIGN KEY (room_id) REFERENCES Rooms(id)
);


CREATE VIEW user_messages AS SELECT Users.username, Messages.message, Rooms.name FROM Users, Messages, Rooms
WHERE Messages.user_id = Users.user_id AND Messages.room_id = Rooms.id;

/*  Execute this file from the command line by typing:
 *    mysql < schema.sql
 *  to create the database and the tables.*/




