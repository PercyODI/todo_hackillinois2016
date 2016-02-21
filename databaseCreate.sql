set foreign_key_checks=0;

DROP TABLE IF EXISTS user;
CREATE TABLE user (
	uid SERIAL,
	username VARCHAR(15) UNIQUE NOT NULL,
	password VARCHAR(255),
	firstname VARCHAR(30),
	lastname VARCHAR(30),
	PRIMARY KEY(uid)
)ENGINE=InnoDB;

INSERT INTO user (username, password, firstname, lastname) VALUES
	("pah9qd", "password", "Pearse", "Hutson"),
	("hayleyWho", "123abc", "Hayley", "Hutson");


DROP TABLE IF EXISTS list;
CREATE TABLE list (
	lid SERIAL,
	uid BIGINT UNSIGNED,
	listname VARCHAR(30),
	datecreated DATETIME,
	type VARCHAR(30),
	PRIMARY KEY(lid),
	FOREIGN KEY(uid) REFERENCES user(uid)
)ENGINE=InnoDB;

INSERT INTO list (uid, listname, datecreated, type) VALUES
	((SELECT uid FROM user WHERE username = "pah9qd"), "App Ideas", NOW(), "Regular"),
	((SELECT uid FROM user WHERE username = "hayleyWho"), "Things to Clean", NOW(), "OCD Plus");

DROP TABLE IF EXISTS task;
CREATE TABLE task (
	tid SERIAL,
	lid BIGINT UNSIGNED,
	tasktext TEXT,
	datecreated DATETIME,
	completed TINYINT(1),
	PRIMARY KEY(tid),
	FOREIGN KEY(lid) REFERENCES list(lid)
)ENGINE=InnoDB;

INSERT INTO task (lid, tasktext, datecreated, completed) VALUES
	((SELECT lid FROM list WHERE listname = "Things to Clean"), "Kitchen Sink", NOW(), 0),
	((SELECT lid FROM list WHERE listname = "Things to Clean"), "Jessie's Toilet", NOW(), 1),
	((SELECT lid FROM list WHERE listname = "Things to Clean"), "Computer (Keyboard is disgusting!)", NOW(), 0),
	((SELECT lid FROM list WHERE listname = "App Ideas"), "A To-Do application for websites", NOW(), 0);

set foreign_key_checks=1;