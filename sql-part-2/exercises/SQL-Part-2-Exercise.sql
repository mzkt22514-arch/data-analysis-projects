/*
--Yes, the last three characters are "015" 
--which seems to be the part of a year, perhaps 2015
--whch is also a common pattern in data naming
SELECT RIGHT('other_FHV_services_jan_aug_2015', 3) AS last_three_chars;

--These are common business entity types so yes, they are very common
--abbreviations 
SELECT RIGHT(Base_name, 3) AS last_three_chars
FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015;

--The columns do not have a "number_of_pickups" in the dataset
--so I opted to use "number_of_vehicles" instead
SELECT CHARINDEX('', number_of_trips) AS space_in_trips,
CHARINDEX('', number_of_vehicles) AS space_in_vehicles
FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015;

SELECT DATENAME (MONTH, pick_up_date) AS pickup_month
FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015
ORDER BY pickup_month DESC;

SELECT DAY (pick_up_date) AS day_number,
DATENAME (MONTH, pick_up_date) AS month_name
FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015
ORDER BY day_number ASC;

SELECT *
FROM RideShareDB.dbo.lyft
    WHERE start_lng = (SELECT MAX(start_lng) 
    FROM RideShareDB.dbo.lyft)

SELECT *
FROM RideShareDB.dbo.lyft
    WHERE start_lat = (SELECT MAX(start_lat)
    FROM RideShareDB.dbo.lyft)

SELECT CONCAT(base_number, ':', base_name) AS base_info
FROM RideShareDB.dbo.other_FHV_services_jan_aug_2015
*/