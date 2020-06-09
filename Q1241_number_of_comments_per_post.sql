select distinct t1.sub_id as post_id, ifnull(t2.cnt, 0) as number_of_comments
from (select *
      from Submissions a
      where parent_id is null) t1
         left join
     (select parent_id, count(distinct sub_id) as cnt
      from Submissions
      group by parent_id
      having parent_id is not null) t2 on t1.sub_id = t2.parent_id
order by post_id