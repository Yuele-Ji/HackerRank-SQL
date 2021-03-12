SELECT CONCAT(Name,'(',UPPER(SUBSTR(Occupation,1,1)),')')
FROM OCCUPATIONS
ORDER BY Name;
SELECT CONCAT('There are a total of ', COUNT(Occupation), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(Occupation), LOWER(Occupation);

-- SELECT CONCAT(NAME, 
                 CASE WHEN occupation = "Doctor" THEN "(D)" 
                      WHEN occupation = "Professor" THEN "(P)" 
                      WHEN occupation = "Singer" THEN "(S)" 
                      WHEN occupation = "Actor" THEN "(A)" 
                      END )
