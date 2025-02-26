


USE linkedin;

CREATE TABLE users(
	user_id INT UNSIGNED AUTO_INCREMENT, -- allow to store 4294967295 different user_id
    first_name VARCHAR(20) NOT NULL, -- allow first_name upto 20 character length
    last_name VARCHAR(20) NOT NULL, -- allow last_name upto 20 character length
    user_name VARCHAR(20) UNIQUE, -- restrict duplicate username
    user_password VARCHAR(128) NOT NULL, -- allow hash value upto 128 lenght to be stored
    PRIMARY KEY(user_id)
);

SELECT *
FROM users;

DROP TABLE users;

DELIMITER $$

CREATE PROCEDURE create_an_account(IN first_name VARCHAR(20), IN last_name VARCHAR(20), u_name VARCHAR(20), u_password VARCHAR(128))
	BEGIN
		INSERT INTO users(first_name, last_name, user_name, user_password) VALUES(f_name, l_name, u_name, u_password);
	END$$
    
DELIMITER ;


CALL create_an_account('sujan','kharel','sujan41','password');
CALL create_an_account('binod','rijal','binod41','password');

DELETE FROM users;

-- free up the space used by delted rows
OPTIMIZE TABLE users;

-- reset AUTO_INCREMENT
TRUNCATE TABLE users;

-- create table school_and_universities

CREATE TABLE school_and_universities(
	school_id INTEGER AUTO_INCREMENT,
    name VARCHAR(40),
    type ENUM('Primary', 'Secondary', 'Higher Education'), -- restict to type either of three
    location VARCHAR(40),
    year_founded YEAR,
    PRIMARY KEY(school_id)
);

SELECT *
FROM school_and_universities;

DROP TABLE school_and_universities;

DROP TABLE companies;

CREATE TABLE companies(
	company_id INTEGER AUTO_INCREMENT,
    name VARCHAR(40),
    industry ENUM('Technology', 'Education', 'Business'),
    location VARCHAR(40),
    PRIMARY KEY(company_id)
);

-- lot to improve in following table
-- established mutual connection
-- solve - no duplicate relationship 
CREATE TABLE connection_with_people (
	connection_id INT UNSIGNED,
    first_id INT UNSIGNED,
    second_id INT UNSIGNED,
    relationship VARCHAR(255) GENERATED ALWAYS AS (CONCAT(first_id, second_id)) STORED,
    FOREIGN KEY(first_id) REFERENCES users(user_id),
    FOREIGN KEY(second_id) REFERENCES users(user_id),
    PRIMARY KEY(connection_id)
);

DROP TABLE connection_with_people;

INSERT INTO connection_with_people(first_id,second_id) VALUES(1,1);
SHOW TABLES;
