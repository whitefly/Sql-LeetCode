-- #  思如: @pre 和@ @id_group 得到间隔
select t3.period_state, t3.start_date, t3.end_date
from (select 'failed' as period_state, min(fail_date) as start_date, max(fail_date) as end_date
      from (
               select fail_date,
                      if(@pre = date_sub(`fail_date`, interval 1 day), @id_group,
                         @id_group := @id_group + 1) as group_id,
                      @pre := fail_date
               from Failed,
                    (select @pre := null, @id_group := 0) temp) t1
      where fail_date between '2019-01-01' and '2019-12-31'
      group by group_id
      union
      select 'succeeded' as period_state, min(success_date) as start_date, max(success_date) as end_date
      from (
               select success_date,
                      if(@pre = date_sub(`success_date`, interval 1 day), @id_group,
                         @id_group := @id_group + 1) as group_id,
                      @pre := success_date
               from Succeeded,
                    (select @pre := null, @id_group := 0) temp) t2
      where success_date between '2019-01-01' and '2019-12-31'
      group by group_id) t3
order by t3.start_date
