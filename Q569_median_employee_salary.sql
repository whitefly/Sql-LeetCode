select ranking.id, ranking.Company, ranking.Salary,ranking.`rank`,cnt
from (select Company,
             Salary,
             id,
             if(@PreGroup = Company, @`rank` := @`rank` + 1, @`rank` := 0) as `rank`,
             @PreGroup := Company
      from Employee1,
           (select @rank := null, @PreGroup := null) temp
      order by Company, Salary, id) ranking
         join (select count(*) as cnt, e2.Company from Employee1 e2 group by e2.Company) as t1
              on ranking.Company = t1.Company


