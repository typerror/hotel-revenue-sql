
-- creating temporay table to merge all years
with hotelinfo as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$'])

-- merging market segment with hotelinfo
select * from hotelinfo
left join dbo.market_segment$
on hotelinfo.market_segment = market_segment$.market_segment
left join dbo.meal_cost$
on meal_cost$.meal = hotelinfo.meal


-- calculating revenue for each guest
select 
arrival_date_year,
hotel,
round(sum((stays_in_week_nights + stays_in_weekend_nights) * adr), 2) as total_revenue 
from hotelinfo
group by arrival_date_year, hotel