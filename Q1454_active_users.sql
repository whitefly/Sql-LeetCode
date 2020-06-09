--  日期排序后使用环境变量

select cnt_table.id, any_value(Accounts.name) as `name`
from (
         select L1.id,
                L1.login_date,
                (case
                     when datediff(login_date, @pre) = 1 and (@pre := login_date) is not null then @count := @count + 1
                     when datediff(login_date, @pre) != 1 and (@pre := login_date) is not null
                         then @count := 1 end) as cnt
         from (select distinct * from Logins) L1,
              (select @id := null, @count := 1, @pre := null) temp
         order by L1.id, L1.login_date) cnt_table
         join Accounts on cnt_table.id = Accounts.id
group by cnt_table.id
having max(cnt_table.cnt) >= 5
order by  id




