# 在算法中的并查集一般是要使用递归的. 这里无法使用,直接暴力写3层
select e1.employee_id
from Employees5 e1,
     Employees5 e2,
     Employees5 e3
where e1.manager_id = e2.employee_id
  and e2.manager_id = e3.employee_id
  and e3.manager_id = 1
  and e1.employee_id != 1


