select Department.Department,Employee.Employee,Employee.Salary
from (select *  from Employee group  by DepartmentId order by Salary desc ) as temp
join  Department on  temp.DepatmentId=Department.Name