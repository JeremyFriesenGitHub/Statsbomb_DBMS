CREATE TABLE cards (
    card_id SERIAL PRIMARY KEY,
    player_id INTEGER,
    match_id INTEGER,
    card_type VARCHAR(255),
    card_time TEXT,
    FOREIGN KEY (player_id) REFERENCES players (player_id)
);
