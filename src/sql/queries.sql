-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1
-- Your query here;
SELECT * FROM observations
LIMIT 10;
-- MISSION 2
-- Your query here;
SELECT DISTINCT id From regions;


-- MISSION 3
-- Your query here;
SELECT COUNT(DISTINCT id) From species;


-- MISSION 4
-- Your query here;
SELECT * FROM regions
WHERE id = 2;

-- MISSION 5
-- Your query here;
SELECT * FROM observations
WHERE observation_date = "1998-08-08";


-- MISSION 6
-- Your query here;
SELECT r.name AS region_name, COUNT(o.id) AS total_observations FROM regions r
JOIN observations o ON o.region_id = r.id
GROUP BY r.name
ORDER BY total_observations DESC
LIMIT 1;


-- MISSION 7
-- Your query here;
SELECT s.id AS species_id, 
       s.scientific_name, 
       COUNT(*) AS total_observations
FROM observations o
JOIN species s ON o.species_id = s.id
GROUP BY s.id, s.scientific_name
ORDER BY total_observations DESC
LIMIT 5;


-- MISSION 8
-- Your query here;
SELECT species_id, COUNT(*) AS total_observations
FROM observations
GROUP BY species_id
HAVING COUNT(*) < 5
ORDER BY total_observations ASC;


-- MISSION 9
-- Your query here;
SELECT observer, COUNT(*) AS total_observations
FROM observations
GROUP BY observer
ORDER BY total_observations DESC
LIMIT 1;


-- MISSION 10
-- Your query here;
SELECT o.id AS observation_id,
       r.name AS region_name
FROM observations o
JOIN regions r ON o.region_id = r.id;

-- MISSION 11
-- Your query here;
SELECT o.id AS observation_id,
       s.scientific_name
FROM observations o
JOIN species s ON o.species_id = s.id;


-- MISSION 12
-- Your query here;
SELECT region_name, scientific_name, total_observations
FROM (
    SELECT 
        r.name AS region_name,
        s.scientific_name,
        COUNT(*) AS total_observations,
        ROW_NUMBER() OVER (PARTITION BY r.name ORDER BY COUNT(*) DESC) AS rn
    FROM observations o
    JOIN regions r ON o.region_id = r.id
    JOIN species s ON o.species_id = s.id
    GROUP BY r.name, s.scientific_name
) AS sub
WHERE rn = 1;


