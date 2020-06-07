-- 分组求出最大最小即可
select activity
from Friends,
     (select @min_count := (select count(id)
                            from Friends
                            group by activity
                            order by 1
                            limit 1)
           , @max_count := (select count(id)
                            from Friends
                            group by activity
                            order by 1 desc
                            limit 1)) temp
group by activity
having count(id) != @min_count
   and count(id) != @max_count


