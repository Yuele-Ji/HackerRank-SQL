SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(CITY) LIKE '[AEIOU]%'; -- or WHERE CITY ILIKE '[aeiou]%';