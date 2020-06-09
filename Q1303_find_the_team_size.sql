select employee_id, cnt as team_size
from Employee5 e1
         join (select team_id, count(employee_id) as cnt
               from Employee5 e2
               group by e2.team_id) temp on e1.team_id = temp.team_id