Create database Movie_DB

use Movie_DB

create schema Movie_Crew
go

Create Table Movie_crew.actor(
	act_id int primary key,
	act_fname varchar(20),
	act_lname varchar(20),
	act_gender varchar(1)
	)

Create Table Movie_crew.director(
	dir_id int primary key,
	act_fname varchar(20),
	act_lname varchar(20),
	)

Create Table Movie_crew.movie_director(
	dir_id int,
	Mov_id int,
	)
--Creat Foreigen key 
ALTER TABLE Movie_crew.movie_director
ADD CONSTRAINT Fk_MovDir FOREIGN KEY (dir_id) REFERENCES Movie_crew.director (dir_id);

ALTER TABLE Movie_crew.movie_director
ADD CONSTRAINT Fk_Mov FOREIGN KEY (Mov_id) REFERENCES About_theMovie.movie (Mov_id);


Create Table Movie_crew.movie_Cast(
	act_id int,
	Mov_id int,
	role varchar(30),
	)
--Creat Foreigen key 
ALTER TABLE Movie_crew.movie_Cast
ADD CONSTRAINT fk_act FOREIGN KEY (act_id) REFERENCES  Movie_crew.actor (act_id);

ALTER TABLE Movie_crew.movie_Cast
ADD CONSTRAINT Fk_Mov2 FOREIGN KEY (Mov_id) REFERENCES About_theMovie.movie (Mov_id);


--creating new schema for the rest of the tables

create schema About_theMovie
go

create table About_theMovie.movie(
mov_id int primary key,
mov_title varchar(50),
mov_year int,
mov_time int,
mov_lang varchar(50),
mov_dt_rel date,
mov_rel_country varchar(5),
	)

create table About_theMovie.reviewer(
rev_id int primary key,
rev_name varchar(30),
	)

create table About_theMovie.genres(
gen_id int primary key,
gen_title varchar(20),
	)

create table About_theMovie.movie_genres(
mov_id int,
gen_id int
	)
--Creat Foreigen key 
ALTER TABLE About_theMovie.movie_genres
ADD CONSTRAINT Fk_MovGen FOREIGN KEY (Mov_id) REFERENCES About_theMovie.movie (Mov_id);

ALTER TABLE About_theMovie.movie_genres
ADD CONSTRAINT Fk_MovGen2 FOREIGN KEY (gen_id) REFERENCES About_theMovie.genres(gen_id);


create table About_theMovie.rating(
mov_id int,
rev_id int,
rev_stars int,
num_o_rating int,
	)
--Creat Foreigen key 
ALTER TABLE About_theMovie.rating
ADD CONSTRAINT Fk_MovRat FOREIGN KEY (Mov_id) REFERENCES About_theMovie.movie (Mov_id);

ALTER TABLE About_theMovie.rating
ADD CONSTRAINT Fk_MovRev FOREIGN KEY (rev_id) REFERENCES About_theMovie.reviewer (rev_id);





