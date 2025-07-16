ALTER TABLE infectious_cases ADD COLUMN CountryID INT;

ALTER TABLE infectious_cases
ADD CONSTRAINT fk_country
FOREIGN KEY (CountryID) REFERENCES Country(CountryID);

SET SQL_SAFE_UPDATES = 0;

UPDATE infectious_cases ic
JOIN Country c ON ic.Code = c.Code
SET ic.CountryID = c.CountryID;