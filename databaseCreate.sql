set foreign_key_checks=0;

DROP TABLE IF EXISTS user;
CREATE TABLE user (
	uid SERIAL,
	usernamee VARCHAR(15),
	password VARCHAR(255),
	firstname VARCHAR(30),
	lastname VARCHAR(30),
	PRIMARY KEY(uid)
)ENGINE=InnoDB;


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

set foreign_key_checks=1;