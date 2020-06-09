--  group by + 去重统计即可

select activity_date as `activity_date`, count(distinct user_id) as active_users
from Activity2 a
where datediff('2019-07-27', activity_date) <= 30
group by activity_date
