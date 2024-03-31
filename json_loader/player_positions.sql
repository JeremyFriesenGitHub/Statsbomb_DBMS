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
