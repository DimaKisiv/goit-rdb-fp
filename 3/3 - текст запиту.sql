SELECT
    c.CountryID,
    c.Code,
    c.Entity,
    AVG(CAST(NULLIF(ic.Number_rabies, '') AS UNSIGNED)) AS avg_rabies,
    MIN(CAST(NULLIF(ic.Number_rabies, '') AS UNSIGNED)) AS min_rabies,
    MAX(CAST(NULLIF(ic.Number_rabies, '') AS UNSIGNED)) AS max_rabies,
    SUM(CAST(NULLIF(ic.Number_rabies, '') AS UNSIGNED)) AS total_rabies
FROM
    infectious_cases ic
JOIN
    Country c ON ic.CountryID = c.CountryID
WHERE
    ic.Number_rabies <> ''
GROUP BY
    c.CountryID, c.Code, c.Entity
ORDER BY
    avg_rabies DESC
LIMIT 10;
