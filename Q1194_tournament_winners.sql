-- 求组内最高的新方法 排序
select group_id, any_value(player_id) as  player_id
from (
         select player_id,
                sum(if(player_id = first_player, first_score, second_score)) as amount,
                any_value(group_id)                                          as group_id
         from Players
                  join Matches
                       on player_id = first_player or player_id = second_player
         group by player_id
         order by 2 desc, 1) t1
group by group_id