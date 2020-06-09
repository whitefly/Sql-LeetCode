-- left join 即可
select Queries.id, Queries.year, ifnull(N.npv, 0) as npv
from Queries
         left join NPV N on Queries.year = N.year and Queries.id = N.id
