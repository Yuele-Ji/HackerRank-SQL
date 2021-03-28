SET @number = 21;
SELECT REPEAT('* ', @number := @number - 1) /* := assign value*/
FROM information_schema.tables /* a built-in table*/
LIMIT 20;
