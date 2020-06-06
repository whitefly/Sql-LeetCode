select distinct v.viewer_id as id
from Views v
group by v.viewer_id, v.view_date
having count(distinct v.article_id, v.author_id) >= 2
order by v.viewer_id
