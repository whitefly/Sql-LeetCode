select ad_id,
       round(100 * if(sum(action = 'Clicked' or action = 'Viewed') = 0, 0,
                      sum(action = 'Clicked') / sum(action = 'Clicked' or action = 'Viewed')), 2) as ctr
from Ads
group by ad_id
order by 2 desc,ad_id
