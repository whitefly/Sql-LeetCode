select e1.Name from
Employee e1 join Employee e2
on e1.Id=e2.ManagerId
group by e1.Id
having count(e2.Id)>=5