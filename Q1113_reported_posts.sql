-- 题目描述有坑,最后他给的结果,标记为spam的2个同id的,只能算一个
select extra as report_reason, count(distinct post_id) as report_count
from Actions a
where action = 'report'
  and action_date = '2019-07-04'
group by extra
having report_count!=0;
