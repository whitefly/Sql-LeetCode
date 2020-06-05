select project_id, round(avg(e.experience_years), 2) as average_years
from Project p
         join Employee4 e on p.employee_id = e.employee_id
group by project_id