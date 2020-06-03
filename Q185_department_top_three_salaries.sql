-- 内联查找比自己高的

select d.Name as Department, e3.Name as Employee, e3.Salary as Salary
from Employee e3
         join Department d on e3.DepartmentId = d.Id
where e3.id in
      (select e1.id
       from Employee e1
                left join Employee e2 on e1.DepartmentId = e2.DepartmentId and e2.Salary > e1.Salary
       group by e1.Id
       having count(*) <= 2)
order by DepartmentId, Salary desc




