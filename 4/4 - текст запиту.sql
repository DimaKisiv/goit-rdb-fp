SELECT
    `Year`,
    @year_start := STR_TO_DATE(CONCAT(`Year`, '-01-01'), '%Y-%m-%d') AS year_start_date,
    @today := CURDATE() AS today_date,
    TIMESTAMPDIFF(YEAR, @year_start, @today) AS years_difference
FROM
    infectious_cases;
