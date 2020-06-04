select round(sum(TIV_2016), 2) as TIV_2016
from insurance i1
where TIV_2015 in (
    select i2.TIV_2015
    from insurance i2
    group by i2.TIV_2015
    having count(*) >= 2
)
  and (i1.LAT, i1.LON) not in (
    select LAT, LON
    from insurance
    group by LAT, LON
    having count(*) >= 2)
