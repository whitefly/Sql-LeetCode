(select u.name as results
 from Movie_Rating m
          join Users3 u on u.user_id = m.user_id
 group by u.user_id, u.name
 order by count(m.rating) desc, u.name
 limit 1)
union
(select Movies.title as results
 from Movie_Rating m
          join Movies on m.movie_id = Movies.movie_id and m.created_at between '2020-02-01' and '2020-02-28'
 group by Movies.movie_id, Movies.title
 order by avg(m.rating) desc, Movies.title
 limit 1)