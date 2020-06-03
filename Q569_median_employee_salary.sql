select any_value(e1.Id)as id ,e1.Company, e1.Salary
from Employee1 e1,
     Employee1 e2
where e1.Company = e2.Company
group by e1.Company, e1.Salary
having sum(if(e1.Salary = e2.Salary, 1, 0)) >= abs(sum(sign(e1.Salary - e2.Salary)))



