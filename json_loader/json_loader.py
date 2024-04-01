import os
import json
import psycopg
from datetime import datetime

# Function to create tables
def create_tables(cursor):

    # SQL command to create Competitions table
    create_competitions_table = """
    CREATE TABLE IF NOT EXISTS Competitions (
        competition_id INTEGER PRIMARY KEY,
        competition_name VARCHAR(255),
        country_name VARCHAR(255),
        gender VARCHAR(50),
        youth BOOLEAN,
        international BOOLEAN
    );
    """
    # SQL command to create Seasons table
    create_seasons_table = """
    CREATE TABLE IF NOT EXISTS Seasons (
        season_id INTEGER,
        competition_id INTEGER,
        season_name VARCHAR(255),
        match_updated TIMESTAMP WITHOUT TIME ZONE,
        match_available TIMESTAMP WITHOUT TIME ZONE,
        PRIMARY KEY (season_id, competition_id),
        FOREIGN KEY (competition_id) REFERENCES Competitions(competition_id)
    );
    """
    # SQL command to create Teams table
    create_teams_table = """
    CREATE TABLE IF NOT EXISTS Teams (
    team_id INTEGER PRIMARY KEY,
    team_name TEXT NOT NULL,
    country_id INTEGER,
    country_name TEXT);
    """

    # SQL command to create Positions table
    create_positions_table = """
    CREATE TABLE IF NOT EXISTS Positions (
    position_id INTEGER PRIMARY KEY,
    position_name TEXT NOT NULL
    );
    """

    # SQL command to create Players table
    create_players_table = """
    CREATE TABLE IF NOT EXISTS Players (
    player_id INTEGER PRIMARY KEY,
    player_name TEXT NOT NULL,
    player_nickname TEXT,
    jersey_number INTEGER,
    country_id INTEGER,
    country_name TEXT,
    team_id INTEGER,
    FOREIGN KEY (team_id) REFERENCES teams (team_id)
    );
    """

    #SQL command to create players positions
    create_players_positions_table = """
    CREATE TABLE IF NOT EXISTS  (
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
    """

    # SQL command to create Cards table
    create_cards_table = """
    CREATE TABLE IF NOT EXISTS Cards (
        card_id SERIAL PRIMARY KEY,
        player_id INTEGER,
        match_id INTEGER,
        card_type VARCHAR(255),
        card_time TEXT,
        FOREIGN KEY (player_id) REFERENCES players (player_id)
    );
    """

    # Execute the SQL commands (string??for cards, array for positions?)
    cursor.execute(create_competitions_table)
    cursor.execute(create_seasons_table)
    cursor.execute(create_teams_table)
    cursor.execute(create_positions_table)
    cursor.execute(create_players_table)
    cursor.execute(create_players_positions_table)
    cursor.execute(create_cards_table)


# def load_events(cursor, db_connection):
#     file_path = 'C:\\Users\\fries\\PycharmProjects\\COMP_3005_Final_Project\\open-data\\data\\events.json'
#
#     with open(file_path, 'r', encoding='utf-8') as file:
#         events = json.load(file)
#
#         for event in events:
#             insert_event_into_database(cursor, event)

# def load_matches(cursor, db_connection):
#     file_path = 'C:\\Users\\fries\\PycharmProjects\\COMP_3005_Final_Project\\open-data\\data\\matches.json'
#
#     with open(file_path, 'r', encoding='utf-8') as file:
#         matches = json.load(file)
#
#         for match in matches:
#             insert_match_into_database(cursor, match)

# def load_lineups(cursor, db_connections):
#     file_path = 'C:\\Users\\fries\\PycharmProjects\\COMP_3005_Final_Project\\open-data\\data\\lineups.json'
#
#     with open(file_path, 'r', encoding='utf-8') as file:
#         lineups = json.load(file)
#
#         for lineup in lineups:
#             insert_lineup_into_database(cursor, lineup)


def load_competitions(cursor, db_connection):
    file_path = 'C:\\Users\\fries\\PycharmProjects\\COMP_3005_Final_Project\\open-data\\data\\competitions.json'

    with open(file_path, 'r', encoding='utf-8') as file:
        competitions = json.load(file)

        for competition in competitions:
            insert_competition_into_database(cur, competition)
            insert_season_into_database(cur, competition)
def insert_competition_into_database(cursor, competition):
    try:
        insert_query = """
        INSERT INTO Competitions (competition_id, competition_name, country_name, gender, youth, international)
        VALUES (%s, %s, %s, %s, %s, %s)
        ON CONFLICT (competition_id) DO NOTHING;
        """

        cursor.execute(insert_query, (
            competition['competition_id'],
            competition['competition_name'],
            competition['country_name'],
            competition['competition_gender'],
            competition['competition_youth'],
            competition['competition_international']
        ))
    except Exception as e:
        print(f"Error inserting competition {competition.get('competition_id')}: {e}")

def insert_season_into_database(cursor, competition):
    try:
        insert_query = """
        INSERT INTO Seasons (season_id, competition_id, season_name, match_updated, match_available)
        VALUES (%s, %s, %s, %s, %s)
        ON CONFLICT (season_id, competition_id) DO NOTHING;
        """

        match_updated = datetime.fromisoformat(competition['match_updated'].rstrip('Z'))
        match_available = datetime.fromisoformat(competition['match_available'].rstrip('Z')) if competition['match_available'] else None

        cursor.execute(insert_query, (
            competition['season_id'],
            competition['competition_id'],
            competition['season_name'],
            match_updated,
            match_available
        ))
    except Exception as e:
        print(f"Error inserting season for competition {competition.get('competition_id')}: {e}")

# DB parameters
conn_params = {
    'dbname': os.getenv('DB_NAME', 'SoccerStatsDB'),
    'user': os.getenv('DB_USER', 'postgres'),
    'password': os.getenv('DB_PASSWORD', 'postgres'),
    'host': os.getenv('DB_HOST', 'localhost'),
    'port': os.getenv('DB_PORT', '5432')
}

# Connect to the database using psycopg connect() function
with psycopg.connect(**conn_params) as conn:
    with conn.cursor() as cur:
        create_tables(cur)
        conn.commit()

        load_competitions(cur, conn)
        conn.commit()
