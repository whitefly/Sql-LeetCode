select team_id,
       any_value(team_name) as team_name ,
       sum(if(team_id = host_team, host_score, 0)) + sum(if(team_id = guest_team, guest_score, 0)) as  num_points
from Teams
         left join (select host_team,
                           guest_team,
                           case
                               when host_goals > guest_goals then 3
                               when host_goals = guest_goals then 1
                               else 0 end as host_score,
                           case
                               when host_goals < guest_goals then 3
                               when host_goals = guest_goals then 1
                               else 0 end as guest_score
                    from Matches) scores
                   on team_id = scores.guest_team or team_id = scores.host_team
group by team_id
order by  3 desc ,team_id




