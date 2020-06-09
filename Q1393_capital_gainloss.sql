-- 这是中等题?
select stock_name, sum(if(operation = 'Buy', -price, price)) as capital_gain_loss
from Stocks
group by Stocks.stock_name