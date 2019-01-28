/*ASSUMPTION : 1 director can have MANY movies
But one movie cannot be made by Multiple Directors */

CREATE TABLE director(
    director_id SERIAL PRIMARY KEY,
    director_name VARCHAR UNIQUE (150) NOT NULL,
    director_facebook VARCHAR (150) NOT NULL

);

CREATE TABLE movie(
    movie_id serial PRIMARY KEY,
    director_id integer NOT NULL,
    num_critic_for_reviews VARCHAR (150) NOT NULL,
    duration VARCHAR (150) NOT NULL,
    movie_title VARCHAR (150) NOT NULL,
    imdb_score VARCHAR (150) NOT NULL,
    FOREIGN KEY (director_id) REFERENCES director (director_id)
        ON DELETE CASCADE

);