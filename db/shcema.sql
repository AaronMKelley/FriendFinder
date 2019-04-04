DROP DATABASE IF EXISTS friend_finder;

CREATE DATABASE friend_finder;

USE friend_finder

CREATE TABLE questions (
    id INTEGER NOT NULL primary key AUTO_INCREMENT ,
    pizza_is_one_of_my_favorite_foods VARCHAR (255),
    I_generally_see_myself_as_a_dog_person VARCHAR (255),
    I_like_to_go_to_the_movies VARCHAR (255),
    I_like_to_spend_time_outdoors VARCHAR (255),
    I_like_to_get_involved_in_local_politics VARCHAR (255),
    I_see_myself_staying_in_the_Bay_Area_the_rest_of_my_life VARCHAR (255),
    I_like_to_volunteer_on_the_weekends VARCHAR (255),
    I_do_not_see_myself_wanting_to_travel_internationally VARCHAR (255),
    I_am_satisfied_with_just_having_an_average_life VARCHAR (255),
    Reading_is_a_worthwhile_activity VARCHAR (255)
    
);

CREATE TABLE friends (
    id INT NOT NULL AUTO_INCREMENT primary key,
    name VARCHAR (255),
    picture_link VARCHAR (255)
);

CREATE TABLE scores(
    id INT NOT NULL AUTO_INCREMENT primary key,
    question_id INT NOT NULL,
    friend_id INT NOT NULL,
    score INT NOT NULL
    -- FOREIGN KEY question_id REFERENCES questions(id),
    -- FOREIGN KEY friend_id REFERENCES friends(id)
);



INSERT INTO questions  (pizza_is_one_of_my_favorite_foods)  VALUES (1);
-- ("I like to go to the movies"),("I like to spend time outdoors"),
-- ("I like to get involved in local politics"),("I see myself staying in the Bay Area the rest of my life"),
-- ("I like to volunteer on the weekends"),("I don't see myself wanting to travel internationally"),
-- ("I am satisfied with just having an average life"),("Reading is a worthwhile activity");