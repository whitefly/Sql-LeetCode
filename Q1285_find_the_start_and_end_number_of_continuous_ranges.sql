select min(log_id) as start_id, max(log_id) as end_id
from (
         select log_id,
                if(log_id = @pre + 1, @count, @count := @count + 1) id_group,
                @pre := log_id
         from Logs2,
              (select @pre := null, @count := 0) temp) gap
group by id_group
