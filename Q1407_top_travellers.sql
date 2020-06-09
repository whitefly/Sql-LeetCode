select any_value(u.name) as `name`,ifnull(sum(distance),0) as travelled_distance   from
Users u left join Rides r on u.id=r.user_id
group by u.id
order by 2 desc, 1