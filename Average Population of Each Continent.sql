SELECT co.CONTINENT, FLOOR(AVG(ci.POPULATION))
FROM COUNTRY co
JOIN CITY ci
ON co.CODE = ci.COUNTRYCODE
GROUP BY 1;
