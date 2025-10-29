/*

--TASK1, Q1: MAKE NOTES
--dbo.annual_2016: id, series_id, year, period, value, footnote_codes, original_file
--dbo.datatype: data_type_code, data_type_text
--dbo.footnote: footnote_code, footnote_text
--dbo.industry: id, industry_code, naics_code, publishing_status, industry_name, display_level, selectable, sort_sequence
--dbo.january_2017: id, series_id, year, period, value, footnote_codes, original_file
--dbo.period: period_code, month_abbr, month
--dbo.seasonal: industry_code, seasonal_text
--dbo.series: series_id, superseector_code, industry_code, data_type_code, seasonal, series_title
--dbo.supersector: - supersector_code, supersector_name

--CONNECTING TABLES & COLUMNS:
--id: dbo.annual_2016, dbo.industry, dbo.january_2017
--series_id: dbo.annual_2016, dbo.january_2017, dbo.series
--year: dbo.annual_2016, dbo.january_2017
--period: dbo.annual_2016, dbo.january_2017; period_code exists in dbo.period
--footnote_codes: dbo.aanual_2016, dbo.footnote, dbo.january_2017
--original_file: dbo.annual_2016, dbo.january_2017
--data_type_code: dbo.datatype, dbo.series
--industry_code: dbo.industry, dbo.seasonal, dbo.series
--superseector_code: dbo.series, dbo.supersector

--TASK1, Q2: The data type for women employees is "Women Employees" and the data_type_code is 10.

SELECT data_type_code, data_type_text
FROM LaborStatisticsDB.dbo.datatype
WHERE data_type_text = 'WOMEN EMPLOYEES';


--TASK1, Q3: The series id for women employees in the commercial banking industry 
--in the financial supersector is: CES5552211010

--This query gives the industry code that I will use in my next query

SELECT industry_name, industry_code
FROM LaborStatisticsDB.dbo.industry
WHERE industry_name = 'commercial banking';

--This query gives me my series_id

SELECT series_id, data_type_code, industry_code, supersector_code 
FROM LaborStatisticsDB.dbo.series
WHERE data_type_code = 10 AND industry_code = 55522110;

--TASK2, Q1: 
--I will need to pull from the annual_2016 table using value column 
--and a WHERE clause that filters by 2016

SELECT ROUND(SUM(value), 0) AS total_employees_2016
FROM LaborStatisticsDB.dbo.annual_2016
WHERE [year] = 2016;

--The total reported employees were 2,351,408,916...

--TASK2, Q2:
--Samething as before just filter by data_type_code using a join for the series table
--because both tables use series_id 

SELECT ROUND(SUM(value), 0) AS total_women_employees_2016
FROM LaborStatisticsDB.dbo.annual_2016
JOIN LaborStatisticsDB.dbo.series 
    ON annual_2016.series_id = series.series_id
WHERE data_type_code = 10 AND [year] = 2016;

--The total reported women employees were 1,125,490 

--TASK 2, Q3:
--First I'll need to pull the data_type_code for the employee data type...

SELECT data_type_code
FROM LaborStatisticsDB.dbo.datatype
WHERE data_type_text = 'PRODUCTION AND NONSUPERVISORY EMPLOYEES'

--This gives me a data code of 6...

--I'll need to include a join using the data_type_code infomation and 
--possibly the series table or annual 2016 table...or maybe even both. 
--One of those tables will need to have the year 2016 on it...

SELECT ROUND(SUM(value), 0) AS total_pns_employees_2016
FROM LaborStatisticsDB.dbo.annual_2016
JOIN LaborStatisticsDB.dbo.series
    ON annual_2016.series_id = series.series_id
WHERE data_type_code = 6 AND [year] = 2016;

--The total production/nonsupervisory employees for 2016 were 1,263,650

--TASK2, Q4
--I'll have to use the janurary 2017 table which has the appropriate value to average...

SELECT AVG(value) AS avg_wkly_hrs
FROM LaborStatisticsDB.dbo.january_2017
JOIN LaborStatisticsDB.dbo.series
    ON january_2017.series_id = series.series_id
WHERE data_type_code = 06 
    AND [period] = 'M01'
    AND [year] = 2017;

--The average weekly hour worked by pns employees across all industries is 1147.507622504537

--Task2, Q5

SELECT ROUND(SUM(value), 2) AS ttl_wkly_payroll
FROM LaborStatisticsDB.dbo.january_2017
JOIN LaborStatisticsDB.dbo.series
    ON january_2017.series_id = series.series_id
WHERE series_title 
    LIKE '%Aggregate weekly payrolls of production and nonsupervisory employees%';

--The total weekly payroll for pns employees across all industries in 1/2017 is 1,839,113,368.8

--TASK2, Q6:

SELECT industry_name, AVG(value) AS avg_wkly_hrs
FROM LaborStatisticsDB.dbo.january_2017
JOIN LaborStatisticsDB.dbo.series
    ON january_2017.series_id = series.series_id
JOIN LaborStatisticsDB.dbo.industry
    ON series.industry_code = industry.industry_code
WHERE series.series_title LIKE '%Aggregate weekly hours of production and nonsupervisory employees%'
  AND period = 'M01'
  AND year = 2017
GROUP BY industry_name
ORDER BY avg_wkly_hrs DESC;

--From the looks of it, Total Private had the highest and Land subdivision had the lowest

--TASK2, Q7:

--There is no 2021 data to source this answer from...

SELECT TOP 5 *
FROM LaborStatisticsDB.dbo.january_2017
WHERE [year] = 2021

--In the event that I am meant to use 2017 data, here's the query:

SELECT industry_name, SUM(value) AS ttl_wkly_payroll
FROM LaborStatisticsDB.dbo.january_2017
JOIN LaborStatisticsDB.dbo.series
    ON january_2017.series_id = series.series_id
JOIN LaborStatisticsDB.dbo.industry
    ON series.industry_code = industry.industry_code
WHERE series.series_title LIKE '%Aggregate weekly payrolls of production and nonsupervisory employees%'
  AND period = 'M01'
  AND year = 2017
GROUP BY industry_name
ORDER BY ttl_wkly_payroll DESC;

--In which case, the Total private has the highest payroll while 
--the Coin-operated laundries and drycleaners has the least

--TASK3, Q1:

SELECT
    id,
    annual_2016.series_id,
    [year],
    [period],
    [value],
    footnote_codes,
    original_file
FROM LaborStatisticsDB.dbo.annual_2016
INNER JOIN LaborStatisticsDB.dbo.series
    ON series.series_id = annual_2016.series_id

--TASK3, Q2:

SELECT TOP 50 *
FROM LaborStatisticsDB.dbo.series
JOIN LaborStatisticsDB.dbo.datatype
    ON series.data_type_code = datatype.data_type_code

--TASK3, Q3:

SELECT TOP 50 *
FROM LaborStatisticsDB.dbo.series
JOIN LaborStatisticsDB.dbo.industry
    ON series.industry_code = industry.industry_code

--TASK4; Q1:

SELECT
    january_2017.series_id,
    series.industry_code,
    industry.industry_name,
    january_2017.value
FROM LaborStatisticsDB.dbo.january_2017
JOIN LaborStatisticsDB.dbo.series
    ON january_2017.series_id = series.series_id
JOIN LaborStatisticsDB.dbo.industry
    ON series.industry_code = industry.industry_code
WHERE value > (
    SELECT AVG(value)
    FROM LaborStatisticsDB.dbo.annual_2016
    WHERE data_type_code = 82
);

--TASK4; Q2:

SELECT
    ROUND(value, 2) AS average_earnings,
    year,
    period
FROM LaborStatisticsDB.dbo.annual_2016
JOIN LaborStatisticsDB.dbo.series 
    ON annual_2016.series_id = series.series_id
WHERE series.data_type_code = 30

UNION

SELECT 
    ROUND(value, 2) AS average_earnings,
    year,
    period
FROM LaborStatisticsDB.dbo.january_2017
JOIN LaborStatisticsDB.dbo.series 
    ON january_2017.series_id = series.series_id
WHERE series.data_type_code = 30;


--SUMMARIZATIONS
--1. Based on what I pulled from the Labor Statistics Database, 
--production and nonsupervisory employees actually fared better 
--in January 2017 compared to 2016. 

--When I looked at the average weekly earnings for data_type_code 30 
--(which specifically tracks this group), the 2017 values were 
--consistently a much higher.

SELECT 
  '2016' AS year,
  AVG(annual_2016.value) AS avg_weekly_earnings
FROM LaborStatisticsDB.dbo.annual_2016 
JOIN LaborStatisticsDB.dbo.series 
  ON annual_2016.series_id = series.series_id
WHERE annual_2016.period = 'M13'
  AND series.series_title LIKE '%average weekly earnings of production and nonsupervisory employees%'

UNION

SELECT 
  '2017' AS year,
  AVG(january_2017.value) AS avg_weekly_earnings
FROM LaborStatisticsDB.dbo.january_2017 
JOIN LaborStatisticsDB.dbo.series 
  ON january_2017.series_id = series.series_id
WHERE january_2017.period = 'M01'
  AND series.data_type_code = '30'

--2. The Reinsurance carriers, Petroleum and coal products,
--Fossil fuel electric power generation, and Pipeline transportation
--were the top 5 industries to fair out better in terms of weekly earnings
--according to my query results.

SELECT TOP 5
    industry.industry_name,
    AVG(january_2017.value) AS avg_weekly_earnings
FROM LaborStatisticsDB.dbo.january_2017
JOIN LaborStatisticsDB.dbo.series 
    ON january_2017.series_id = series.series_id
JOIN LaborStatisticsDB.dbo.industry 
    ON series.industry_code = industry.industry_code
WHERE series.series_title LIKE '%average weekly earnings of production and nonsupervisory employees%'
  AND period = 'M01'
  AND year = 2017
GROUP BY industry.industry_name
ORDER BY avg_weekly_earnings DESC;
*/

--3. I wish the dataset included more recent years, 
--especially 2021 as originally referenced. It also would’ve 
--helped to have data broken down by region or demographic so 
--we could analyze how different groups of production and
--nonsupervisory employees fared across the country.



