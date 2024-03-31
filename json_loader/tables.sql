CREATE TABLE Competitions (
    competition_id INTEGER PRIMARY KEY,
    competition_name VARCHAR(255),
    country_name VARCHAR(255),
    gender VARCHAR(50),
    youth BOOLEAN,
    international BOOLEAN
);

CREATE TABLE Seasons (
    season_id INTEGER,
    competition_id INTEGER,
    season_name VARCHAR(255),
    match_updated TIMESTAMP WITHOUT TIME ZONE,
    match_available TIMESTAMP WITHOUT TIME ZONE,
    PRIMARY KEY (season_id, competition_id),
    FOREIGN KEY (competition_id) REFERENCES Competitions(competition_id)
);

CREATE TABLE teams (
    team_id INTEGER PRIMARY KEY,
    team_name TEXT NOT NULL,
    country_id INTEGER,
    country_name TEXT
);

CREATE TABLE positions (
    position_id INTEGER PRIMARY KEY,
    position_name TEXT NOT NULL
);

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

CREATE TABLE player_positions (
    player_id INTEGER,
    position_id INTEGER,
    match_id INTEGER,
    from_time TEXT,
    to_time TEXT,
    from_period INTEGER,
    to_period INTEGER,
    start_reason TEXT,
    end_reason TEXT,
    FOREIGN KEY (player_id) REFERENCES players (player_id),
    FOREIGN KEY (position_id) REFERENCES positions (position_id),
    PRIMARY KEY (player_id, position_id, match_id, from_time)
);


CREATE TABLE cards (
    card_id SERIAL PRIMARY KEY,
    player_id INTEGER,
    match_id INTEGER,
    card_type VARCHAR(255),
    card_time TEXT,
    FOREIGN KEY (player_id) REFERENCES players (player_id)
);



