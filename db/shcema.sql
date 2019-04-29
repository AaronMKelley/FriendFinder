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

SELECT s.question_id, s.friend_id, s.score
FROM scores s
LEFT JOIN friends f
ON f.id = s.friend_id
ORDER BY s.question_id, s.friend_id, s.score;

SELECT scores.friend_id, scores.question_id,scores.score,
    LAG (scores.score,1) OVER () prev_score,
    LAG (scores.score,1) OVER () - scores.score difference
FROM scores 
LEFT JOIN friends
ON scores.friend_id=friends.id;
/*--------------------------------------------------------------------*/

SELECT scores.friend_id, scores.question_id,scores.score,
        LAG (scores.score,1) OVER () prev_score,
    ->     LAG (scores.score,1) OVER () - scores.score difference
    -> FROM scores 
    -> LEFT JOIN friends
    -> ON scores.friend_id=friends.id;

/*--------------------------------------------------------------------*/

SELECT scores.question_id, scores.friend_id, scores.score,
        LAG(scores.friend_id ,1) OVER () previous_friend_id,
        LAG (scores.score, 1) OVER () prev_score,
        LAG (scores.score, 1) OVER () - scores.score difference
FROM scores 
LEFT JOIN friends 
ON scores.friend_id=friends.id
ORDER BY question_id;

/*--------------------------------------------------------------------*/


