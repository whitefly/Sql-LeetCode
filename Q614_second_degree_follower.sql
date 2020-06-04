select f.followee as follower, count(distinct f.follower) as num
from follow f
where f.followee in (
    select distinct f2.follower
    from follow f2
)
group by f.followee

