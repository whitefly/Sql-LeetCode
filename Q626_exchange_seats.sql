# 奇数id+1,偶数id-1,最后一个奇数的不变
select (case
            when id % 2 = 0 then id - 1
            when id = @total then id
            else id + 1 end) as id,
       student
from seat s,
     (select @total := count(*) from seat) temp
order by id