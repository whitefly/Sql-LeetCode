select a.player_id as player_id, a.device_id as device_id
from Activity a
where (a.player_id, a.event_date) in (
    select player_id, min(event_date)
    from Activity
    group by player_id)
