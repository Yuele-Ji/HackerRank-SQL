--1.
SELECT Start_Date, MIN(End_Date)
FROM
(SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) AS s,
/* 1.Choose start dates that are not end dates of other projects (if a start date is an end date, it is part of the samee project) */
(SELECT End_Date FROM Projects WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) AS e
/* 2.Choose end dates that are not end dates of other projects */
/* At this point, we should have a list of start dates and end dates that don't necessarily correspond with each other */
WHERE Start_Date < End_Date
/* This makes sure we only choose end dates that fall after the start date, 
and choosing the MIN means for the particular start_date, 
we get the closest end date that does not coincide with the start of another task */
GROUP BY Start_Date
ORDER BY DATEDIFF(MIN(End_Date), Start_Date), Start_Date
                                                      
                               
--2.
SELECT T1.Start_Date,T2.End_Date 
FROM (
    SELECT Start_Date, ROW_NUMBER() OVER (ORDER BY Start_Date) RN 
    FROM Projects 
    WHERE Start_Date NOT IN (SELECT END_Date FROM Projects) ) AS T1
JOIN (
    SELECT End_Date, ROW_NUMBER() OVER (ORDER BY End_Date) RN 
    FROM Projects 
    WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) AS T2 
ON T1.RN = T2.RN 
ORDER BY DATEDIFF(T2.End_Date, T1.Start_Date), T1.Start_Date                                                      
