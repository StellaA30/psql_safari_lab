-- queries:
-- 1. The names of the animals in a given enclosure

SELECT name 
FROM animals
WHERE enclosure_id = 1;

-- 2. The names of the staff working in a given enclosure
-- SELECT employee_id, enclosure_id
-- FROM assignments
-- WHERE enclosure_id = 1;


-- SELECT name
-- FROM employees
-- WHERE id = 2 OR id = 1;

SELECT name
FROM employees
WHERE id IN (SELECT employee_id
FROM assignments
WHERE enclosure_id = 1);


