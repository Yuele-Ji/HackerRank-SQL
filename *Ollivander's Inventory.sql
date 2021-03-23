-- is that a minimum of coins amount needed to be returned for each unique combination of age and power?

-- 1.get the min cost for each age(code) and power
WITH min_cost AS(
    SELECT code, power, MIN(coins_needed) AS min_coins_needed
    FROM Wands 
    GROUP BY code, power)
SELECT w.id, p.age, m.min_coins_needed, m.power 
FROM min_cost m
JOIN Wands w 
ON m.code = w.code AND m.power = w.power AND m.min_coins_needed = w.coins_needed
JOIN Wands_Property p 
ON m.code = p.code
WHERE p.is_evil = 0
ORDER BY m.power DESC, age DESC

-- 2.
select w.id, p.age, w.coins_needed,w.power
    from wands w
    join wands_property p
      on p.code = w.code
    where (p.age,w.power,w.coins_needed) in (
            select p1.age,w1.power,min(w1.coins_needed)
                from wands_property p1
                join wands w1
                  on w1.code = p1.code
                where p1.is_evil = 0
                group by p1.age, w1.power)
    order by w.power desc, p.age desc
 
