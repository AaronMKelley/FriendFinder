-- DROP DATABASE IF EXISTS friend_finder;

CREATE DATABASE friend_finder;

USE friend_finder;

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE questions (
    id INTEGER NOT NULL primary key AUTO_INCREMENT,
    question VARCHAR (255) 
);

CREATE TABLE friends (
    id INT NOT NULL AUTO_INCREMENT primary key,
    question_id INT,
    Foreign Key (question_id) REFERENCES questions(id),
    friend_name VARCHAR (255),
    picture_link VARCHAR (255)
);

CREATE TABLE scores(
    id INT NOT NULL AUTO_INCREMENT primary key,
    friend_id INT,
    question_id INT,
    score INT NOT NULL,
    Foreign Key (question_id) REFERENCES questions(id),
    Foreign Key (friend_id) REFERENCES friends(id)
);



/* the association */

	/* friends has many scores */

		/* a score belongs to an friend */






