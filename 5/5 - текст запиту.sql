DELIMITER //

CREATE FUNCTION YearsDifferenceFromNow(input_year INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE start_date DATE;
    SET start_date = STR_TO_DATE(CONCAT(input_year, '-01-01'), '%Y-%m-%d');
    RETURN TIMESTAMPDIFF(YEAR, start_date, CURDATE());
END //

DELIMITER ;

SELECT
    `Year`,
    YearsDifferenceFromNow(`Year`) AS years_difference
FROM
    infectious_cases;
