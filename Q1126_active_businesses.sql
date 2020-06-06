select business_id
from Events
         join (select event_type, avg(occurences) as avg_count
               from Events e
               group by e.event_type) temp
              on Events.event_type = temp.event_type and Events.occurences > temp.avg_count
group by business_id
having count(Events.event_type) >= 2