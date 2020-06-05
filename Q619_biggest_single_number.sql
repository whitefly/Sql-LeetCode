select nullif((select num
               from my_numbers m
               group by num
               having count(*) = 1
               order by num desc
               limit 1), null) as num