-- 判断 min+1这天的登录,有就说明存在连续登录

select round(count(distinct player_id) / (select COUNT(distinct player_id)
                                          from Activity), 2) as fraction
from Activity a
where (a.player_id, event_date) in (
    select player_id, date_add(min(event_date), interval 1 day)
    from Activity
    group by player_id)





