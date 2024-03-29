CREATE TABLE Competitions (
    competition_id INTEGER PRIMARY KEY,
    competition_name VARCHAR(255),
    country_name VARCHAR(255),
    gender VARCHAR(50),
    youth BOOLEAN,
    international BOOLEAN
);
