CREATE TABLE Seasons (
    season_id INTEGER,
    competition_id INTEGER,
    season_name VARCHAR(255),
    match_updated TIMESTAMP WITHOUT TIME ZONE,
    match_available TIMESTAMP WITHOUT TIME ZONE,
    PRIMARY KEY (season_id, competition_id),
    FOREIGN KEY (competition_id) REFERENCES Competitions(competition_id)
);