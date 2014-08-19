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







/*PUBLIC LIBRARY DATABASE*/
CREATE DATABASE Library;

USE Library;

CREATE TABLE Books(
	id int not null auto_increment,
	title varchar(255) not null,
	author varchar(150) not null,
	pubdate date not null,
	pub_company varchar(255),
	edition int,
	isbn varchar(50) not null,
	number_of_pages int(4),
	category_id int not null,

	PRIMARY KEY (id),
	FOREIGN KEY (category_id) REFERENCES BookCategory(id)
);

CREATE TABLE ArchivedBooks(
	id int not null auto_increment,
	book_id int not null,

	PRIMARY KEY (id),
	FOREIGN KEY (book_id) REFERENCES Book(id)
);

CREATE TABLE BookCategory(
	id int not null auto_increment,
	category varchar(50) not null,

	PRIMARY KEY (id)
);

CREATE TABLE Members(
	id int not null auto_increment,
	fullname varchar(70) not null,
	address varchar(150),
	email varchar(100) not null,
	phone varchar(20) not null,
	gender enum('MALE', 'FEMALE') not null,
	registration_date date not null,
	registration_number varchar(30) not null

	PRIMARY KEY (id),
	UNIQUE(email, registration_number)
);

CREATE TABLE LendingRecords
	id int not null auto_increment,
	member_id int not null,
	date_borrowd date not null,
	date_returned date,
	return_status enum('RETURNED', 'PENDING'),

	PRIMARY KEY (id),
	FOREIGN KEY(member_id) REFERENCES Members(id)
);


CREATE TABLE Employees(
	id int not null auto_increment,
	fullname varchar(70) not null,
	address varchar(150),
	email varchar(100) not null,
	phone varchar(20) not null,
	gender enum('MALE', 'FEMALE') not null,
	date_employed date not null,
	employee_number varchar(30) not null,
	job_id int not null,

	PRIMARY KEY (id),
	FOREIGN KEY(job_id) REFERENCES Jobs(id),
	UNIQUE(email, employee_number)
);

CREATE TABLE Jobs(
	id int not null auto_increment,
	title varchar(25) not null,
	starting_salary decimal(8,2) not null,

	PRIMARY KEY(id),
	UNIQUE(title)
);


