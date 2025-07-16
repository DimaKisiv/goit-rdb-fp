DELIMITER //
CREATE FUNCTION AverageCasesPerPeriod(cases_per_year INT, divider INT)
RETURNS DECIMAL(20,5)
DETERMINISTIC
BEGIN
    IF cases_per_year IS NULL OR divider = 0 THEN
        RETURN NULL;
    END IF;
    RETURN cases_per_year / divider;
END //
DELIMITER ;

SELECT
    CountryID,
    `Year`,
    Number_rabies,
    AverageCasesPerPeriod(CAST(Number_rabies AS DECIMAL(20,5)), 12) AS avg_cases_per_month,
    AverageCasesPerPeriod(CAST(Number_rabies AS DECIMAL(20,5)), 4) AS avg_cases_per_quarter,
    AverageCasesPerPeriod(CAST(Number_rabies AS DECIMAL(20,5)), 2) AS avg_cases_per_halfyear
FROM
    infectious_cases
WHERE
    Number_rabies <> ''
      AND Number_rabies IS NOT NULL;


