select e1.id, e1.Month, sum(e2.Salary) as Salary
from Employee2 e1
         join Employee2 e2
              on e1.Id = e2.Id and (e1.Month - e2.Month) <= 2 and 0 <= (e1.Month - e2.Month)
where (e1.Id, e1.Month) not in (
    select e3.id, max(e3.Month)
    from Employee2 e3
    group by e3.Id
)
group by e1.id, e1.Month
order by e1.Id, e1.Month desc

