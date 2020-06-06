select distinct page_id as recommended_page
from Likes
         join Friendship on (user1_id = 1 and  user2_id = user_id) or (user2_id = 1 and  user1_id = user_id)
where page_id
          not in (
          select page_id
          from Likes
          where user_id = 1
      )

