SELECT months*salary AS total_earning, COUNT(*) AS num_employee
FROM Employee
GROUP BY 1
ORDER BY 1 DESC
LIMIT 1;
