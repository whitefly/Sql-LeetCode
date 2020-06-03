# select t.id, Status, Request_at, c.Banned as c_ban, d.Banned as d_Banned

select Request_at                                                                     as Day,
       round(count(if(t.Status != 'completed', t.Status, null)) / count(t.Status), 2) as `Cancellation Rate`
from Trips t
         join Users c
         join Users d
              on t.Client_Id = c.Users_Id and t.Driver_Id = d.Users_Id
where c.Banned = 'No'
  and d.Banned = 'No'
  and t.Request_at between '2013-10-01' and '2013-10-03'
group by Request_at



