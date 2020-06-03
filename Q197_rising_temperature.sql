# 内联,找到所有比小的,日期差一天,若有结果,就去id即可
# 函数 datediff的使用

select w1.Id
from Weather w1
         join Weather w2 on w1.Temperature > w2.Temperature and datediff(w1.RecordDate, w2.RecordDate) = 1;

