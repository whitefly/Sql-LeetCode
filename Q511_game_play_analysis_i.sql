select player_id, min(event_date)
from Activity
group by player_id
