select * from [delivery_data (1)];

SELECT * 
FROM [delivery_data (1)]
WHERE city='Cape Town';

SELECT
city,
COUNT(*) AS Total
FROM [delivery_data (1)]
GROUP BY city;

SELECT 
city,
SUM(distance_km) AS Distance_travelled 
FROM [delivery_data (1)]
group by city;

SELECT 
carrier,
city from [delivery_data (1)]
GROUP by city;

Select 
carrier,
city,
COUNT(*) FROM [delivery_data (1)]
GROUP by city;

Select 
carrier, 
COUNT(*) AS Most_Used 
from [delivery_data (1)]
where city='Cape Town' 
GROUP by carrier 
ORDER by Most_Used DESC;

Select 
carrier, 
COUNT(*) AS Most_Used 
from [delivery_data (1)]
where city='Johannesburg'
GROUP by carrier
ORDER by Most_Used DESC;

Select 
carrier,
COUNT(*) AS Most_Used
from [delivery_data (1)]
where city='Durban'
GROUP by carrier 
ORDER by Most_Used DESC;

Select
carrier,
COUNT(*) AS Most_Used 
from [delivery_data (1)] 
where city='Bloemfontein' 
GROUP by carrier 
ORDER by Most_Used DESC;

Select
carrier,
COUNT(*) AS Most_Used 
from [delivery_data (1)] 
where city='Pretoria' 
GROUP by carrier 
ORDER by Most_Used DESC;

Select
carrier,
COUNT(*) AS Most_Used 
from [delivery_data (1)] 
where city='Gqeberha' 
GROUP by carrier 
ORDER by Most_Used DESC;

Select 
TOP 1 carrier,
Count(*) AS Furthest_distance
from [delivery_data (1)]
where city='Cape Town'
Group by carrier
Order by Furthest_distance;

SELECT 
  carrier,
  COUNT(*) AS DeliveryCount
FROM [delivery_data (1)]
WHERE city = 'Cape Town'
GROUP BY carrier
ORDER BY DeliveryCount DESC;

SELECT 
  carrier,
  MAX(distance_km) AS FurthestDistance
FROM [delivery_data (1)]
WHERE city = 'Cape Town'
GROUP BY carrier
ORDER BY FurthestDistance DESC;

SELECT TOP 1 
  carrier,
  distance_km
FROM [delivery_data (1)]
WHERE city = 'Cape Town'
ORDER BY distance_km DESC;

SELECT *
FROM [delivery_data (1)]
WHERE [status] = 'Delivered';

SELECT 
city,
delay_minutes
FROM [delivery_data (1)]
WHERE [status] = 'Delivered'AND city='Cape Town';

SELECT
city,
carrier,
delay_minutes
from [delivery_data (1)]
Where city='Cape Town' and delay_minutes>10;

SELECT *
FROM [delivery_data (1)]
WHERE scheduled_datetime <delivered_datetime
  AND city = 'Cape Town'
  AND carrier = 'MegaHaul';

SELECT TOP 1 
  carrier,
  delay_minutes
FROM [delivery_data (1)]
WHERE city = 'Cape Town'
ORDER BY delay_minutes DESC;

SELECT TOP 5 
  carrier,
  delay_minutes
FROM [delivery_data (1)]
WHERE city = 'Cape Town'
ORDER BY delay_minutes DESC;

SELECT 
  carrier,
  AVG(delay_minutes) AS avg_delay
FROM [delivery_data (1)]
WHERE city = 'Cape Town'
GROUP BY carrier
ORDER BY avg_delay DESC;

SELECT 
  carrier,
  COUNT(*) AS delay_count
FROM [delivery_data (1)]
WHERE city = 'Cape Town' AND delay_minutes > 0
GROUP BY carrier
ORDER BY delay_count DESC;

SELECT city, carrier, delay_minutes
FROM (
  SELECT 
    city,
    carrier,
    delay_minutes,
    RANK() OVER (PARTITION BY city ORDER BY delay_minutes DESC) AS rank_per_city
  FROM [delivery_data (1)]
) ranked_delays
WHERE rank_per_city = 1;

Select
Top 100 *
from [delivery_data (1)];

SELECT COUNT(*) AS heavy_delivery_count
FROM [delivery_data (1)]
WHERE TRY_CAST(weight_kg AS FLOAT) > 5;







