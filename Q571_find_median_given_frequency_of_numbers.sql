select avg(temp.number) as  median
from (select n1.Number
      from Numbers n1,
           Numbers n2
      where n1.Number != n2.Number
      group by n1.Number, n1.Frequency
      having n1.Frequency >= abs(sum(if(n1.Number > n2.Number, -n2.Frequency, n2.Frequency)))) temp
