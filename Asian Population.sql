SELECT SUM(ci.POPULATION) 
FROM CITY ci
JOIN COUNTRY co 
ON ci.COUNTRYCODE=co.CODE 
WHERE co.CONTINENT='Asia';
