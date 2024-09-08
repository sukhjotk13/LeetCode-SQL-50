WITH user_rating AS(
    SELECT m1.user_id, COUNT(movie_id) AS num_movies
    FROM MovieRating m1 JOIN Users u1
    ON (m1.user_id=u1.user_id)
    GROUP BY m1.user_id
    ORDER BY num_movies DESC,u1.name
    LIMIT 1
), movie_highest_rating AS
(
    SELECT m2.movie_id,AVG(rating)
    FROM MovieRating m2 JOIN Movies m3
    ON(m2.movie_id=m3.movie_id)
    WHERE YEAR(created_at)=2020 AND MONTH(created_at)=2
    GROUP BY movie_id
    ORDER BY AVG(rating) DESC,m3.title
    LIMIT 1
)
(
    SELECT u.name AS results
    FROM user_rating ur JOIN Users u
    ON (ur.user_id=u.user_id)
)
UNION ALL

(
    SELECT m.title
    FROM movie_highest_rating mhr JOIN
    Movies m
    ON (mhr.movie_id=m.movie_id)
);
