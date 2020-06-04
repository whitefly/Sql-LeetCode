select t1.id,
       (case
            when count(t1.p_id) = 0 then 'Root'
            when count(t2.id) = 0 then 'Leaf'
            else 'Inner' end) as Type
from tree t1
         left join tree t2 on t1.id = t2.p_id
group by t1.id


