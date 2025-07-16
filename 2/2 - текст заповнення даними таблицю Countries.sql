INSERT INTO Country (Entity, Code)
SELECT DISTINCT Entity, Code
FROM infectious_cases
WHERE Entity IS NOT NULL AND Code IS NOT NULL;