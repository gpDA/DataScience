/*
1. a query that involves an inner join*/
/*SHOW DIRECTOR AND HIS/HER MOVIE AND ITS IMDB SCORE WHEN both director_name AND movie_title, imdb_score exists*/
SELECT director.director_name, movie.movie_title, movie.imdb_score  FROM movie
INNER JOIN director on movie.director_id = director.director_id;

/*
2. a query that involves an outer join (left, right, or full)
*/
/*SHOW DIRECTOR AND HIS/HER MOVIE AND ITS IMDB SCORE EVEN IF there are NO MATCHES movie_title, imdb_score*/
SELECT director.director_name, movie.movie_title, movie.imdb_score  FROM director
LEFT JOIN movie on movie.director_id = director.director_id;

/*
3. a query that involves an inner join and an aggregate function
*/
/*NUMBER OF MOVIES PER DIRECTORS*/
SELECT director.director_name, count(movie_title) FROM movie INNER JOIN director ON movie.director_id = director.director_id GROUP BY director.director_name;