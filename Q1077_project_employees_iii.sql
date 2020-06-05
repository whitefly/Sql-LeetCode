select p1.project_id, p1.employee_id
from Project p1
         join Employee4 e1 on p1.employee_id = e1.employee_id
where (p1.project_id, e1.experience_years) in
      (select p.project_id, max(e.experience_years)
       from Project p
                join Employee4 e on e.employee_id = p.employee_id
       group by p.project_id
      )