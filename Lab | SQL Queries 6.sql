use sakila;
##to create the structure of the table before importing the data
drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year DEFAULT NULL,
  `language_id` tinyint unsigned NOT NULL,
  `original_language_id` tinyint unsigned DEFAULT NULL,
  `rental_duration` text,
  `rental_rate` text,
  `length` smallint unsigned DEFAULT NULL,
  `replacement_cost` text DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;


SHOW VARIABLES LIKE 'secure_file_priv';
SET GLOBAL secure_file_priv = "/tmp/";
show variables like "local_infile";
set global local_infile = 1;
SELECT @@GLOBAL.secure_file_priv;

##Importing data from a csv file to the table we created 
load data local infile '/Users/johanayf/Desktop/IronJohana/SQL/lab-intro-sql/lab-sql-6/files_for_lab/films_2020.csv' 
into table films_2020
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

##check the data
select * from films_2020;

##Add the new films to the database.
##INSERT INTO films_2020 (rental_duration, rental_rate, replacement_cost) VALUES ('3', '2.99', '8.99');

UPDATE films_2020
SET  rental_duration = '3', rental_rate = '2.99', replacement_cost = '8.99'
Where release_year = 2020;

##Double Check with result 
select rental_duration, rental_rate, replacement_cost from films_2020;