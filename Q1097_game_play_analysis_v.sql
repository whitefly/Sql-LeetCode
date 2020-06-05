-- 连续性问题
select first_login.event_date                  as install_dt,
       count(*)                                as installs,
       round(count(a.player_id) / count(*), 2) as Day1_retention
from (select player_id, min(event_date) as event_date
      from Activity
      group by player_id) first_login
         left join Activity a
                   on first_login.player_id = a.player_id and datediff(a.event_date, first_login.event_date) = 1
group by first_login.event_date



