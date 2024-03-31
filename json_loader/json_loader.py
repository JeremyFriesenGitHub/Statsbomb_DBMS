import os
import json
import psycopg2
from datetime import datetime

# Database connection parameters
conn_params = {
    "dbname": "SoccerStatsDB",
    "user": "postgres",
    "password": "postgres",
    "host": "localhost"
}

def load_competitions_and_seasons(filename, conn):
    """
    Load competitions and seasons data from the specified JSON file.
    """
    with open(filename, 'r', encoding='utf-8') as file:
        data = json.load(file)

    cursor = conn.cursor()
    # Insert Competitions
    insert_competitions_query = """
        INSERT INTO Competitions (competition_id, competition_name, country_name, gender, youth, international) 
        VALUES (%s, %s, %s, %s, %s, %s) ON CONFLICT (competition_id) DO NOTHING;
    """
    # Insert Seasons
    insert_seasons_query = """
        INSERT INTO Seasons (season_id, competition_id, season_name, match_updated, match_available)
        VALUES (%s, %s, %s, %s, %s)
        ON CONFLICT (season_id, competition_id) DO NOTHING;
    """

    for item in data:
        # Pre-process date strings
        match_updated = datetime.fromisoformat(item["match_updated"].rstrip('Z'))
        match_available = datetime.fromisoformat(item["match_available"].rstrip('Z'))

        # Competitions data
        cursor.execute(insert_competitions_query, (
            item["competition_id"],
            item["competition_name"],
            item["country_name"],
            item["competition_gender"],
            item["competition_youth"],
            item["competition_international"],
        ))

        # Seasons data
        cursor.execute(insert_seasons_query, (
            item["season_id"],
            item["competition_id"],
            item["season_name"],
            match_updated,
            match_available,
        ))
    conn.commit()
def process_lineup_file(filepath, conn):
    with open(filepath, 'r', encoding='utf-8') as file:
        lineup_data = json.load(file)

    cursor = conn.cursor()

    # Extract match_id from filename
    match_id = os.path.basename(filepath).split('.')[0]

    for team_data in lineup_data:
        # Insert team data
        cursor.execute(
            "INSERT INTO teams (team_id, team_name) VALUES (%s, %s) ON CONFLICT (team_id) DO NOTHING;",
            (team_data['team_id'], team_data['team_name']))

        for player_data in team_data.get('lineup', []):
            # Insert player data
            cursor.execute(
                "INSERT INTO players (player_id, player_name, player_nickname, jersey_number, country_id, country_name, team_id) VALUES (%s, %s, %s, %s, %s, %s, %s) ON CONFLICT (player_id) DO NOTHING;",
                (player_data['player_id'], player_data['player_name'], player_data.get('player_nickname'), player_data['jersey_number'], player_data['country']['id'], player_data['country']['name'], team_data['team_id']))

            # Insert position and player_positions data
            for position_data in player_data.get('positions', []):
                cursor.execute(
                    "INSERT INTO positions (position_id, position_name) VALUES (%s, %s) ON CONFLICT (position_id) DO NOTHING;",
                    (position_data['position_id'], position_data['position']))
                cursor.execute(
                    "INSERT INTO player_positions (player_id, position_id, match_id, from_time, to_time, from_period, to_period, start_reason, end_reason) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s) ON CONFLICT DO NOTHING;",
                    (player_data['player_id'], position_data['position_id'], match_id, position_data.get('from'), position_data.get('to'), position_data.get('from_period'), position_data.get('to_period'), position_data.get('start_reason'), position_data.get('end_reason')))

            # Insert card data
            for card_data in player_data.get('cards', []):
                cursor.execute(
                    "INSERT INTO cards (player_id, match_id, card_type, card_time) VALUES (%s, %s, %s, %s);",
                    (player_data['player_id'], match_id, card_data['card_type'], card_data['time']))

    conn.commit()

def load_data(path):
    """
    Load competitions, seasons, and lineup data from the specified path.
    """
    conn = psycopg2.connect(**conn_params)
    try:
        if os.path.isfile(path):
            load_competitions_and_seasons(path, conn)
        elif os.path.isdir(path):
            for root, dirs, files in os.walk(path):
                for file in files:
                    if file.endswith(".json"):
                        process_lineup_file(os.path.join(root, file), conn)
        else:
            print("Unsupported data path.")
    except psycopg2.Error as e:
        print(f"Database error: {e}")
    finally:
        conn.close()

# Example usage
load_data('C:\\Users\\fries\\PycharmProjects\\COMP_3005_Final_Project\\JSON_Data_3005_Project\\competitions.json')
load_data('C:\\Users\\fries\\PycharmProjects\\COMP_3005_Final_Project\\JSON_Data_3005_Project\\PL-2003-2004\\lineups')
