CREATE TABLE players (
    player_id INTEGER PRIMARY KEY,
    player_name TEXT NOT NULL,
    player_nickname TEXT,
    jersey_number INTEGER,
    country_id INTEGER,
    country_name TEXT,
    team_id INTEGER,
    FOREIGN KEY (team_id) REFERENCES teams (team_id)
);
