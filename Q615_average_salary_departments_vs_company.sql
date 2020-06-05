select t1.d                  as pay_month,
       t1.department_id,
       (case
            when t1.avg_amount > t2.avg_amount then 'higher'
            when t1.avg_amount < t2.avg_amount then 'lower'
            else 'same' end) as comparison
from (
#              每月各个部门的平均工资
         select date_format(s.pay_date, '%Y-%m') as d, e.department_id, avg(s.amount) as avg_amount
         from salary s
                  join employee3 e on s.employee_id = e.employee_id
         group by 1, 2) t1
         join (
#              每月的平均工资
    select date_format(pay_date, '%Y-%m') as d, avg(amount) as avg_amount
    from salary
    group by 1
) t2 on t1.d = t2.d


