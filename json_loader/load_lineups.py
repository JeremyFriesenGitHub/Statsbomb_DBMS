import os
import json
import psycopg


def create_tables(cursor):
    create_player_match_participation_table = """
    CREATE TABLE PlayerMatchParticipations (
    player_id INTEGER NOT NULL,
    match_id INTEGER NOT NULL,
    team_id INTEGER NOT NULL,
    start_time VARCHAR(10),
    end_time VARCHAR(10),
    position_id INTEGER,
    start_period INTEGER,
    end_period INTEGER,
    start_reason VARCHAR(255),
    end_reason VARCHAR(255),
    PRIMARY KEY (player_id, match_id, position_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (position_id) REFERENCES Positions(position_id)
    );
    """

    create_players_table = """
    CREATE TABLE Players (
    player_id INTEGER PRIMARY KEY,
    player_name VARCHAR(255),
    player_nickname VARCHAR(255),
    jersey_number INTEGER,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
    );
    """

    create_positions_table = """
    CREATE TABLE Positions (
    position_id INTEGER PRIMARY KEY,
    position_name VARCHAR(255) 
    );
    """


    cursor.execute(create_positions_table)
    cursor.execute(create_players_table)

    cursor.execute(create_player_match_participation_table)


def load_positions_and_countries(cursor, lineups_dir, match_ids):
    for match_id in match_ids:
        specific_file_path = os.path.join(lineups_dir, f"{match_id}.json")
        if os.path.exists(specific_file_path):
            with open(specific_file_path, 'r', encoding='utf-8') as file:
                teams = json.load(file)
                for team in teams:
                    for player in team['lineup']:
                        insert_country_into_database(cursor, player['country'])
                        for position in player['positions']:
                            insert_position_into_database(cursor, position)


def load_players(cursor, lineups_dir, match_ids):
    for match_id in match_ids:
        specific_file_path = os.path.join(lineups_dir, f"{match_id}.json")
        if os.path.exists(specific_file_path):
            with open(specific_file_path, 'r', encoding='utf-8') as file:
                teams = json.load(file)
                for team in teams:
                    for player in team['lineup']:
                        insert_player_into_database(cursor, player)

def load_player_match_participants(cursor, lineups_dir, match_ids):
    for match_id in match_ids:
        specific_file_path = os.path.join(lineups_dir, f"{match_id}.json")
        if os.path.exists(specific_file_path):
            with open(specific_file_path, 'r', encoding='utf-8') as file:
                teams = json.load(file)
                for team in teams:
                    team_id = team['team_id']
                    for player in team['lineup']:
                        player_id = player['player_id']
                        for position in player['positions']:
                            insert_player_match_participation_into_database(cursor, position, match_id, player_id,
                                                                            team_id)


def insert_country_into_database(cursor, country):
    try:
        insert_query = """
        INSERT INTO Countries (country_id, country_name)
        VALUES (%s, %s)
        ON CONFLICT (country_id) DO NOTHING;
        """
        cursor.execute(insert_query, (country['id'], country['name']))
    except Exception as e:
        print(f"Error inserting country {country['id']} ({country['name']}): {e}")


def insert_position_into_database(cursor, position):
    try:
        insert_query = """
        INSERT INTO Positions (position_id, position_name)
        VALUES (%s, %s)
        ON CONFLICT (position_id) DO NOTHING;
        """

        cursor.execute(insert_query, (position['position_id'], position['position']))
    except Exception as e:
        print(f"Error inserting position {position['position_id']}: {e}")


def insert_player_into_database(cursor, player):
    try:
        insert_query = """
        INSERT INTO Players (player_id, player_name, player_nickname, jersey_number, country_id)
        VALUES (%s, %s, %s, %s, %s)
        ON CONFLICT (player_id) DO NOTHING;
        """

        cursor.execute(insert_query, (
            player['player_id'], player['player_name'], player['player_nickname'], player['jersey_number'],
            player['country']['id']))
    except Exception as e:
        print(f"Error inserting player {player['player_id']}: {e}")


def insert_player_match_participation_into_database(cursor, position, match_id, player_id, team_id):
    try:
        insert_query = """
        INSERT INTO PlayerMatchParticipations (player_id, match_id, team_id, start_time, end_time, position_id, start_period, end_period, start_reason, end_reason)
        VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        ON CONFLICT (player_id, match_id, position_id) DO NOTHING;
        """

        cursor.execute(insert_query, (
            player_id, match_id, team_id, position['from'], position['to'], position['position_id'],
            position['from_period'], position['to_period'], position['start_reason'], position['end_reason']))

    except Exception as e:
        print(f"Error inserting position {position['position_id']}: {e}")


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
    matches_dir = os.path.join(base_dir, "data", "matches")
    lineups_dir = os.path.join(base_dir, "data", "lineups")

    competitions_seasons = {
        # competition with season ids
        11: ["90", "42", "4"],
        2: ["44"]
    }

    conn_params = {
        'dbname': os.getenv('DB_NAME', 'project_database'),
        'user': os.getenv('DB_USER', 'postgres'),
        'password': os.getenv('DB_PASSWORD', '1234'),
        'host': os.getenv('DB_HOST', 'localhost'),
        'port': os.getenv('DB_PORT', '5432')
    }

    with psycopg.connect(**conn_params) as conn:
        with conn.cursor() as cur:

            # create
            create_tables(cur)
            conn.commit()

            for comp_id, seasons in competitions_seasons.items():
                comp_dir = os.path.join(matches_dir, str(comp_id))
                for season_id in seasons:
                    match_ids = extract_match_ids_for_season(comp_dir, season_id)

                    # loaders
                    load_positions_and_countries(cur, lineups_dir, match_ids)
                    conn.commit()

                    load_players(cur, lineups_dir, match_ids)
                    conn.commit()

                    load_player_match_participants(cur, lineups_dir, match_ids)
                    conn.commit()


if __name__ == "__main__":
    main()
