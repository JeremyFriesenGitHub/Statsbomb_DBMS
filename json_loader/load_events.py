import os
import json
import psycopg
from datetime import datetime


def create_tables(cursor):

    create_events_table = """
       CREATE TABLE Events (
           event_id UUID PRIMARY KEY,
           index INTEGER,
           period INTEGER,
           timestamp timestamp,
           minute INTEGER,
           second INTEGER,
           event_type_id INTEGER,
           possession INTEGER,
           possession_team_id INTEGER, 
           play_pattern_id INTEGER,
           team_id INTEGER, 
           player_id INTEGER,
           location POINT,
           duration FLOAT,
           under_pressure BOOLEAN,
           off_camera BOOLEAN,
           out BOOLEAN,
           related_events UUID[],
           tactics_id INTEGER,
           FOREIGN KEY (event_type_id) REFERENCES event_types(event_type_id),
           FOREIGN KEY (possession_team_id) REFERENCES teams(team_id),
           FOREIGN KEY (play_pattern_id) REFERENCES play_patterns(play_pattern_id),
           FOREIGN KEY (team_id) REFERENCES teams(team_id),
           FOREIGN KEY (player_id) REFERENCES players(player_id),
           FOREIGN KEY (tactics_id) REFERENCES tactics(tactics_id)
       );
       """

    create_event_types_table = """
    CREATE TABLE event_types (
    event_type_id INTEGER PRIMARY KEY,
    event_type_name VARCHAR(255)
    );
    """

    create_possession_team_table = """
    CREATE TABLE possession_team (
    possession_team_id INTEGER PRIMARY KEY,
    FOREIGN KEY (possession_team_id) REFERENCES teams(team_id)
    );
    """

    create_play_pattern_table = """
    CREATE TABLE play_pattern (
    play_pattern_id integer PRIMARY KEY,
    play_pattern_name VARCHAR(255)
    );
    
    """

    create_tactics_table = """
    CREATE TABLE tactics (
    tactics_id SERIAL PRIMARY KEY,
    event_id UUID NOT NULL,
    formation INTEGER NOT NULL,
    FOREIGN KEY (event_id) REFERENCES Events(event_id)
    );
    """

    cursor.execute(create_events_table)






def extract_match_ids_for_season(comp_dir, season_id):
    match_ids = []
    file_path = os.path.join(comp_dir, f"{season_id}.json")
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            season_data = json.load(file)
            for match in season_data:
                match_id = match.get('match_id')
                if match_id:
                    match_ids.append(match_id)
    except FileNotFoundError:
        print(f"File not found: {file_path}")
    except json.JSONDecodeError:
        print(f"Error decoding JSON from file: {file_path}")

    return match_ids


def main():
    base_dir = "C:\\Users\\fries\\PycharmProjects\\COMP_3005_Final_Project\\open-data"
    events_dir = os.path.join(base_dir, "data", "events")
    matches_dir = os.path.join(base_dir, "data", "matches")

    competitions_seasons = {
        # competition with season ids
        11: ["90", "42", "4"],
        2: ["44"]
    }

    conn_params = {
        'dbname': os.getenv('DB_NAME', 'SoccerStatsDB'),
        'user': os.getenv('DB_USER', 'postgres'),
        'password': os.getenv('DB_PASSWORD', 'postgres'),
        'host': os.getenv('DB_HOST', 'localhost'),
        'port': os.getenv('DB_PORT', '5432')
    }

    with psycopg.connect(**conn_params) as conn:
        with conn.cursor() as cur:

            # tables
            create_tables(cur)
            conn.commit()

            for comp_id, seasons in competitions_seasons.items():
                comp_dir = os.path.join(matches_dir, str(comp_id))
                for season_id in seasons:
                    match_ids = extract_match_ids_for_season(comp_dir, season_id)

                    # load functions in order of tables



if __name__ == "__main__":
    main()
