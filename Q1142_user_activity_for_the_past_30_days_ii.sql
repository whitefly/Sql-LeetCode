select round(ifnull(avg(cnt), 0), 2) as average_sessions_per_user
from (select count(distinct session_id) as cnt
      from Activity a
      where a.activity_date between '2019-06-28' and '2019-07-27'
      group by user_id
     ) temp