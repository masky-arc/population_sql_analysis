CREATE DATABASE IF NOT EXISTS population_analysis;
USE population_analysis;


CREATE TABLE population (
    Entity VARCHAR(150),
    Code VARCHAR(20),
    Year INT,
    Population BIGINT
);


SELECT Entity, Code, Year, Population
FROM population
WHERE Year = (SELECT MAX(Year) FROM population)
ORDER BY Population DESC
LIMIT 50000;


SELECT Entity, Population
FROM population
WHERE Year = (SELECT MAX(Year) FROM population)
ORDER BY Population DESC
LIMIT 10;



SELECT Year, Population
FROM population
WHERE Entity = 'India'
ORDER BY Year;


SELECT f.Entity, f.Population AS First_Population, l.Population AS Latest_Population,
       l.Population - f.Population AS Population_Growth
FROM population f
JOIN population l ON f.Entity = l.Entity
WHERE f.Entity = 'India' AND f.Year = (SELECT MIN(Year) FROM population)
  AND l.Year = (SELECT MAX(Year) FROM population);
  
  
SELECT 
    FLOOR(Year / 10) * 10 AS Decade,
    ROUND(AVG(Population), 0) AS Average_Population
FROM population
WHERE Entity = 'India'
GROUP BY FLOOR(Year / 10) * 10
ORDER BY Decade;


SELECT Entity, Population
FROM population
WHERE Year = 2023 AND Population >= 100000000
ORDER BY Population DESC;



SELECT a.Entity,
       ROUND(100 * (b.Population - a.Population) / a.Population, 2) AS Growth_Percent
FROM population a JOIN population b ON a.Entity = b.Entity
WHERE a.Year = 1950 AND b.Year = 2023 AND a.Population > 0
ORDER BY Growth_Percent DESC
LIMIT 10;