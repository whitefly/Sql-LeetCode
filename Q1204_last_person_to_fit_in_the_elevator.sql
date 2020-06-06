select any_value(q1.person_name)  as person_name
from Queue q1
         join Queue q2 on q1.turn >= q2.turn
group by q1.turn
having sum(q2.weight) <= 1000
order by q1.turn desc
limit 1

