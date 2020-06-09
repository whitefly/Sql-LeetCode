select a.id as p1, b.id as p2, abs((a.x_value - b.x_value) * (a.y_value - b.y_value)) as area
from Points a
         join Points b on a.id < b.id and a.x_value != b.x_value and a.y_value != b.y_value
order by 3 desc, 1, 2