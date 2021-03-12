SELECT CEIL(AVG(SALARY) - AVG((REPLACE(SALARY, '0', ''))))
FROM EMPLOYEES;

/*
-- REPLACE(string, from_string, new_string)
The REPLACE() function replaces all occurrences of a substring within a string, with a new substring.

--ROUND :The ROUND() function rounds a number to a specified number of decimal places.
--CEIL: The CEIL() function returns the smallest integer value that is bigger than or equal to a number.
EG, CEIL(25.01) = 26, CEIL(25.00) = 25
*/
