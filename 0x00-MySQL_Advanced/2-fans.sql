-- Query table metal_bands and rank result
-- using sum built function
SELECT origin, SUM(fans) as nb_fans FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
