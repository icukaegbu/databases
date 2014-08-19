/*TWITTER DATABASE*/
CREATE DATABASE Twitter;

USE Twitter;

CREATE TABLE User(
	id int not null auto_increment,
	username varchar(40) not null,
	password varchar(50) not null,
	email varchar(50) not null,
	firstname varchar(30) not null,
	lastname varchar(30),
	gender enum('MALE', 'FEMALE') not null,

	PRIMARY KEY (id),
	UNIQUE(username, email, password)
);

CREATE TABLE User_profile(
	id int not null  auto_increment,
	user_id int not null,
	date_registered date,
	location varchar(100),
	photo text,

	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE Tweets(
	id int not null auto_increment,
	user_id int not null,
	tweets char(140) not null,
	tweet_date date,

	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE Following(
	id int not null auto_increment,
	user_id int not null,
	following_id int not null,

	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES User(id),
	FOREIGN KEY (following_id) REFERENCES User(id)
);

CREATE TABLE Followers(
	id int not null auto_increment,
	user_id int not null,
	follower_id int not null,

	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES User(id),
	FOREIGN KEY (follower_id) REFERENCES User(id)
);




