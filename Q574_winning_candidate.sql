select c.Name
from Candidate c
         join Vote v
              on c.id = CandidateId
group by c.id, c.Name
order by count(v.id) desc
limit 1


