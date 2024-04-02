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
    FOREIGN KEY (country_id) REFERENCES Countries (country_id)
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
    team_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Countries (country_id),
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


CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name TEXT NOT NULL
);

CREATE TABLE  Stadiums (
    stadium_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Countries (country_id)
);

CREATE TABLE Referees (
    referee_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Countries (country_id)
);


CREATE TABLE  Matches (
    match_id INTEGER PRIMARY KEY,
    competition_id INTEGER,
    season_id INTEGER,
    home_team_id INTEGER,
    away_team_id INTEGER,
    home_score INTEGER,
    away_score INTEGER,
    match_date DATE,
    kick_off TIME WITHOUT TIME ZONE,
    match_week INTEGER,
    match_status VARCHAR(50),
    last_updated TIMESTAMP WITHOUT TIME ZONE,
    stadium_id INTEGER,
    referee_id INTEGER,
    FOREIGN KEY (competition_id) REFERENCES Competitions (competition_id),
    FOREIGN KEY (season_id) REFERENCES Seasons (season_id),
    FOREIGN KEY (home_team_id) REFERENCES Teams (team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams (team_id),
    FOREIGN KEY (stadium_id) REFERENCES Stadiums (stadium_id),
    FOREIGN KEY (referee_id) REFERENCES Referees (referee_id)
);


CREATE TABLE Managers (
    manager_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    nickname TEXT,
    dob DATE,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Countries (country_id)
);

CREATE TABLE MatchManagers (
    match_id INTEGER,
    team_id INTEGER,
    manager_id INTEGER,
    PRIMARY KEY (match_id, team_id, manager_id),
    FOREIGN KEY (match_id) REFERENCES Matches (match_id),
    FOREIGN KEY (team_id) REFERENCES Teams (team_id),
    FOREIGN KEY (manager_id) REFERENCES Managers (manager_id)
);



