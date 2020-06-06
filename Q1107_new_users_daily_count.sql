--  构建first_login表
select login_date, count(user_id) as user_count
from (select user_id, min(t.activity_date) as login_date
      from Traffic t
      where t.activity = 'login'
      group by t.user_id) first_login
where   first_login.login_date >= '2019-04-01'
group by first_login.login_date