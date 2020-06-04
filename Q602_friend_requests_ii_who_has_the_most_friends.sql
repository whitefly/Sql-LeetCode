select t1.person as id, count(*) num
from (select requester_id as person
      from request_accepted
      union
      select accepter_id as person
      from request_accepted) t1,
     request_accepted t2
where t1.person = t2.accepter_id
   or t1.person = t2.requester_id
group by t1.person
order by count(*) desc
limit 1



