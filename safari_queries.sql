-- queries:
-- 1. The names of the animals in a given enclosure

SELECT name 
FROM animals
WHERE enclosure_id = 1;

-- 2. The names of the staff working in a given enclosure

SELECT name
FROM employees
WHERE id IN (SELECT employee_id
FROM assignments
WHERE enclosure_id = 1);

-- 3. the names of staff working in enclosures which are closed for maintenance

SELECT name 
FROM employees
WHERE id IN (
    SELECT employee_id
    FROM assignments
    WHERE enclosure_id = (
        SELECT id
        FROM enclosures
        WHERE closed_for_maintenance = true
    )
)
;

-- Extenstion 2: The name of the enclosure where the oldest animal lives. If there are two animals who are the same age choose the first one alphabetically.
SELECT enclosure_id, MAX(age)
FROM animals
GROUP BY enclosure_id;

SELECT name
FROM enclosures
WHERE id = 4;

-- Extension 3: The number of different animal types a given keeper has been assigned to work with.
SELECT enclosure_id
FROM assignments
WHERE employee_id = 3;

SELECT COUNT(DISTINCT type)
FROM animals
WHERE enclosure_id = 2 OR enclosure_id = 3;

