-- 水题
select a.actor_id, a.director_id
from ActorDirector a
group by a.actor_id, a.director_id
having count(a.timestamp) >= 3