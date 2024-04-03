import os
import json
import psycopg
from datetime import datetime


def create_tables(cursor):
    # SQL command to create Competitions table
    create_competitions_table = """
    CREATE TABLE Competitions (
        competition_id INTEGER PRIMARY KEY,
        competition_name VARCHAR(255),
        country_name VARCHAR(255),
        gender VARCHAR(50),
        youth BOOLEAN,
        international BOOLEAN
    );
    """

    # SQL command to create Countries table
    create_countries_table = """
    CREATE TABLE Countries (
        country_id SERIAL PRIMARY KEY,
        country_name TEXT NOT NULL
    );
    """

    # SQL command to create Teams table
    create_teams_table = """
    CREATE TABLE Teams (
        team_id INTEGER PRIMARY KEY,
        team_name TEXT NOT NULL,
        country_id INTEGER,
        FOREIGN KEY (country_id) REFERENCES Countries (country_id)
    );
    """

    # SQL command to create Stadiums table
    create_stadiums_table = """
    CREATE TABLE Stadiums (
        stadium_id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        country_id INTEGER,
        FOREIGN KEY (country_id) REFERENCES Countries (country_id)
    );
    """

    # SQL command to create Referees table
    create_referees_table = """
    CREATE TABLE Referees (
        referee_id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        country_id INTEGER,
        FOREIGN KEY (country_id) REFERENCES Countries (country_id)
    );
    """

    # SQL command to create Managers table
    create_managers_table = """
    CREATE TABLE Managers (
        manager_id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        nickname TEXT,
        dob DATE,
        country_id INTEGER,
        FOREIGN KEY (country_id) REFERENCES Countries (country_id)
    );
    """

    # SQL command to create Positions table
    create_positions_table = """
    CREATE TABLE Positions (
        position_id INTEGER PRIMARY KEY,
        position_name TEXT NOT NULL
    );
    """

    # SQL command to create Players table
    create_players_table = """
    CREATE TABLE Players (
        player_id INTEGER PRIMARY KEY,
        player_name TEXT NOT NULL,
        player_nickname TEXT,
        jersey_number INTEGER,
        country_id INTEGER,
        team_id INTEGER,
        FOREIGN KEY (country_id) REFERENCES Countries (country_id),
        FOREIGN KEY (team_id) REFERENCES Teams (team_id)
    );
    """

    # SQL command to create Seasons table
    create_seasons_table = """
    CREATE TABLE Seasons (
        season_id INTEGER,
        competition_id INTEGER,
        season_name VARCHAR(255),
        match_updated TIMESTAMP WITHOUT TIME ZONE,
        match_available TIMESTAMP WITHOUT TIME ZONE,
        PRIMARY KEY (season_id, competition_id),
        FOREIGN KEY (competition_id) REFERENCES Competitions (competition_id)
    );
    """

    # SQL command to create Matches table
    create_matches_table = """
    CREATE TABLE Matches (
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
    FOREIGN KEY (competition_id, season_id) REFERENCES Seasons (competition_id, season_id),
    FOREIGN KEY (home_team_id) REFERENCES Teams (team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams (team_id),
    FOREIGN KEY (stadium_id) REFERENCES Stadiums (stadium_id),
    FOREIGN KEY (referee_id) REFERENCES Referees (referee_id)
    );
    """

    # SQL command to create Player_Positions table
    create_players_positions_table = """
    CREATE TABLE Player_Positions (
        player_id INTEGER,
        position_id INTEGER,
        match_id INTEGER,
        from_time TEXT,
        to_time TEXT,
        from_period INTEGER,
        to_period INTEGER,
        start_reason TEXT,
        end_reason TEXT,
        FOREIGN KEY (match_id) REFERENCES Matches (match_id),
        FOREIGN KEY (player_id) REFERENCES Players (player_id),
        FOREIGN KEY (position_id) REFERENCES Positions (position_id),
        PRIMARY KEY (player_id, position_id, match_id, from_time)
    );
    """

    # SQL command to create Cards table
    create_cards_table = """
    CREATE TABLE Cards (
        card_id SERIAL PRIMARY KEY,
        player_id INTEGER,
        match_id INTEGER,
        card_type VARCHAR(255),
        card_time TEXT,
        FOREIGN KEY (match_id) REFERENCES Matches (match_id),
        FOREIGN KEY (player_id) REFERENCES Players (player_id)
    );
    """

    # SQL command to create MatchManagers table
    create_match_managers_table = """
    CREATE TABLE Match_Managers (
        match_id INTEGER,
        team_id INTEGER,
        manager_id INTEGER,
        PRIMARY KEY (match_id, team_id, manager_id),
        FOREIGN KEY (match_id) REFERENCES Matches (match_id),
        FOREIGN KEY (team_id) REFERENCES Teams (team_id),
        FOREIGN KEY (manager_id) REFERENCES Managers (manager_id)
    );
    """

    # Create foundational tables without dependencies

    cursor.execute(create_competitions_table)
    cursor.execute(create_seasons_table)
    cursor.execute(create_countries_table)
    cursor.execute(create_positions_table)

    # Create tables with dependencies
    cursor.execute(create_teams_table)
    cursor.execute(create_stadiums_table)
    cursor.execute(create_referees_table)
    cursor.execute(create_managers_table)
    cursor.execute(create_players_table)

    # Create tables with multiple dependencies
    cursor.execute(create_matches_table)
    cursor.execute(create_players_positions_table)
    cursor.execute(create_cards_table)
    cursor.execute(create_match_managers_table)


# def load_events(cursor, db_connection):
#     file_path = 'C:\\Users\\fries\\PycharmProjects\\COMP_3005_Final_Project\\open-data\\data\\events.json'
#
#     with open(file_path, 'r', encoding='utf-8') as file:
#         events = json.load(file)
#
#         for event in events:
#             insert_event_into_database(cursor, event)


def load_competitions(cursor):
    file_path = 'C:\\Users\\fries\\PycharmProjects\\COMP_3005_Final_Project\\open-data\\data\\competitions.json'

    with open(file_path, 'r', encoding='utf-8') as file:
        competitions = json.load(file)

        for competition in competitions:
            insert_competition_into_database(cursor, competition)
            insert_season_into_database(cursor, competition)


def load_countries_and_positions(cursor, lineups_dir, match_ids):
    for match_id in match_ids:
        file_path = os.path.join(lineups_dir, f"{match_id}.json")
        if os.path.exists(file_path):
            with open(file_path, 'r', encoding='utf-8') as file:
                teams = json.load(file)
                for team in teams:
                    for player in team['lineup']:
                        insert_country_into_database(cursor, player['country'])
                        for position in player['positions']:
                            insert_position_into_database(cursor, position)


def load_teams(cursor, lineups_dir, match_ids):
    for match_id in match_ids:
        file_path = os.path.join(lineups_dir, f"{match_id}.json")
        if os.path.exists(file_path):
            with open(file_path, 'r', encoding='utf-8') as file:
                teams = json.load(file)
                for team in teams:
                    insert_team_into_database(cursor, team)


def load_stadiums_referees_and_managers(cursor, matches_file):
    if os.path.exists(matches_file):
        with open(matches_file, 'r', encoding='utf-8') as file:
            matches = json.load(file)
            for match in matches:
                if 'stadium' in match:
                    insert_stadium_into_database(cursor, match['stadium'])

                if 'referee' in match:
                    insert_referee_into_database(cursor, match['referee'])

                for manager in match['home_team'].get('managers', []):
                    insert_manager_into_database(cursor, manager)

                for manager in match['away_team'].get('managers', []):
                    insert_manager_into_database(cursor, manager)


def load_players(cursor, lineups_dir, match_ids):
    for match_id in match_ids:
        file_path = os.path.join(lineups_dir, f"{match_id}.json")
        if os.path.exists(file_path):
            with open(file_path, 'r', encoding='utf-8') as file:
                teams = json.load(file)
                for team in teams:
                    for player in team['lineup']:
                        insert_player_into_database(cursor, player, team['team_id'])


def load_matches(cursor, matches_file):
    if os.path.exists(matches_file):
        with open(matches_file, 'r', encoding='utf-8') as file:
            matches = json.load(file)
            for match in matches:
                insert_match_into_database(cursor, match)


def load_player_positions_and_cards(cursor, lineups_dir, match_ids):
    for match_id in match_ids:
        file_path = os.path.join(lineups_dir, f"{match_id}.json")
        if os.path.exists(file_path):
            with open(file_path, 'r', encoding='utf-8') as file:
                teams = json.load(file)
                for team in teams:
                    for player in team['lineup']:
                        for position in player['positions']:
                            insert_player_position_into_database(cursor, player['player_id'], position, match_id)
                        for card in player['cards']:
                            insert_card_into_database(cursor, player['player_id'], card, match_id)


def load_match_managers(cursor, matches_file):
    if os.path.exists(matches_file):
        with open(matches_file, 'r', encoding='utf-8') as file:
            matches = json.load(file)
            for match in matches:
                for manager in match['away_team'].get('managers', []):
                    insert_match_manager_into_database(cursor, match['match_id'], match['away_team']['away_team_id'],
                                                       manager['id'])


# lineups ordering

# def load_lineups(cursor, lineups_dir, match_ids):
#     for match_id in match_ids:
#         file_path = os.path.join(lineups_dir, f"{match_id}.json")
#         if os.path.exists(file_path):
#             with open(file_path, 'r', encoding='utf-8') as file:
#                 teams = json.load(file)
#                 for team in teams:
#                     insert_team_into_database(cursor, team)
#                     for player in team['lineup']:
#                         insert_player_into_database(cursor, player, team['team_id'])
#                         for position in player['positions']:
#                             insert_position_into_database(cursor, position)
#                             insert_player_position_into_database(cursor, player['player_id'], position, match_id)
#                         for card in player['cards']:
#                             insert_card_into_database(cursor, player['player_id'], card, match_id)


# matches ordering

# def load_matches(cursor, matches_file):
#     if os.path.exists(matches_file):
#         with open(matches_file, 'r', encoding='utf-8') as file:
#             matches = json.load(file)
#             for match in matches:
#
#                 insert_match_into_database(cursor, match)
#
#                 if 'stadium' in match:
#                     insert_stadium_into_database(cursor, match['stadium'])
#
#                 if 'referee' in match:
#                     insert_referee_into_database(cursor, match['referee'])
#                     # print(match['referee']['id'])
#
#                 for manager in match['home_team'].get('managers', []):
#                     insert_manager_into_database(cursor, manager)
#                     insert_match_manager_into_database(cursor, match['match_id'], match['home_team']['home_team_id'],
#                                                        manager['id'])
#
#                 for manager in match['away_team'].get('managers', []):
#                     insert_manager_into_database(cursor, manager)
#                     insert_match_manager_into_database(cursor, match['match_id'], match['away_team']['away_team_id'], manager['id'])


def insert_match_into_database(cursor, match):
    match_date = datetime.strptime(match['match_date'], '%Y-%m-%d').date() if 'match_date' in match else None
    kick_off = match['kick_off'] if 'kick_off' in match else None
    last_updated = datetime.fromisoformat(match['last_updated'].rstrip('Z')) if 'last_updated' in match else None
    stadium_id = match['stadium']['id'] if 'stadium' in match else None
    referee_id = match['referee']['id'] if 'referee' in match else None

    insert_query = """
    INSERT INTO Matches (match_id, competition_id, season_id, home_team_id, away_team_id, home_score, away_score, match_date, kick_off, match_week, match_status, last_updated, stadium_id, referee_id)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    ON CONFLICT (match_id) DO NOTHING;
    """
    cursor.execute(insert_query, (
        match['match_id'], match['competition']['competition_id'], match['season']['season_id'],
        match['home_team']['home_team_id'], match['away_team']['away_team_id'], match['home_score'],
        match['away_score'],
        match_date, kick_off, match['match_week'], match['match_status'], last_updated, stadium_id, referee_id))


def insert_referee_into_database(cursor, referee):
    insert_query = """
    INSERT INTO Referees (referee_id, name, country_id)
    VALUES (%s, %s, %s)
    ON CONFLICT (referee_id) DO NOTHING;
    """
    cursor.execute(insert_query, (referee['id'], referee['name'], referee['country']['id']))


def insert_match_manager_into_database(cursor, match_id, team_id, manager_id):
    try:
        insert_query = """
        INSERT INTO Match_Managers (match_id, team_id, manager_id)
        VALUES (%s, %s, %s)
        ON CONFLICT DO NOTHING;
        """

        cursor.execute(insert_query, (match_id, team_id, manager_id))
    except Exception as e:

        print(f"Error inserting match manager for match ID {match_id}, team ID {team_id}, manager ID {manager_id}: {e}")


def insert_stadium_into_database(cursor, stadium):
    insert_query = """
    INSERT INTO Stadiums (stadium_id, name, country_id)
    VALUES (%s, %s, %s)
    ON CONFLICT (stadium_id) DO NOTHING;
    """
    cursor.execute(insert_query, (stadium['id'], stadium['name'], stadium['country']['id']))


def insert_manager_into_database(cursor, manager):
    dob = datetime.strptime(manager['dob'], '%Y-%m-%d').date() if 'dob' in manager else None
    insert_query = """
    INSERT INTO Managers (manager_id, name, nickname, dob, country_id)
    VALUES (%s, %s, %s, %s, %s)
    ON CONFLICT (manager_id) DO NOTHING;
    """
    cursor.execute(insert_query, (
        manager['id'], manager['name'], manager.get('nickname'), dob, manager['country']['id']
    ))


def insert_country_into_database(cursor, country):
    try:
        insert_query = """
        INSERT INTO Countries (country_id, country_name)
        VALUES (%s, %s)
        ON CONFLICT (country_id) DO NOTHING;
        """
        cursor.execute(insert_query, (country['id'], country['name']))
    except Exception as e:
        print(f"Error inserting country {country['id']}: {e}")


def insert_team_into_database(cursor, team):
    try:
        insert_query = """
        INSERT INTO Teams (team_id, team_name)
        VALUES (%s, %s)
        ON CONFLICT (team_id) DO NOTHING;
        """
        cursor.execute(insert_query, (team['team_id'], team['team_name']))
    except Exception as e:
        print(f"Error inserting team {team['team_id']}: {e}")


def insert_player_into_database(cursor, player, team_id):
    try:
        insert_query = """
        INSERT INTO Players (player_id, player_name, player_nickname, jersey_number, country_id, team_id)
        VALUES (%s, %s, %s, %s, %s, %s)
        ON CONFLICT (player_id) DO NOTHING;
        """
        cursor.execute(insert_query, (
            player['player_id'],
            player['player_name'],
            player.get('player_nickname'),
            player['jersey_number'],
            player['country']['id'],
            team_id
        ))
    except Exception as e:
        print(f"Error inserting player {player['player_id']}: {e}")


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


def insert_player_position_into_database(cursor, player_id, position, match_id):
    try:
        insert_query = """
        INSERT INTO Player_Positions (player_id, position_id, match_id, from_time, to_time, from_period, to_period, start_reason, end_reason)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        ON CONFLICT DO NOTHING;  
        """
        cursor.execute(insert_query, (
            player_id,
            position['position_id'],
            match_id,
            position['from'],
            position['to'],
            position['from_period'],
            position['to_period'],
            position.get('start_reason', ''),
            position.get('end_reason', '')
        ))
    except Exception as e:
        print(f"Error inserting player position for player {player_id}: {e}")


def insert_card_into_database(cursor, player_id, card, match_id):
    try:
        insert_query = """
        INSERT INTO Cards (player_id, match_id, card_type, card_time)
        VALUES (%s, %s, %s, %s)
        ON CONFLICT DO NOTHING;  
        """
        cursor.execute(insert_query, (
            player_id,
            match_id,
            card['card_type'],
            card['time']
        ))
    except Exception as e:
        print(f"Error inserting card for player {player_id}: {e}")


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
        match_available = datetime.fromisoformat(competition['match_available'].rstrip('Z')) if competition[
            'match_available'] else None

        cursor.execute(insert_query, (
            competition['season_id'],
            competition['competition_id'],
            competition['season_name'],
            match_updated,
            match_available
        ))
    except Exception as e:
        print(f"Error inserting season for competition {competition.get('competition_id')}: {e}")


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

            # competitions
            load_competitions(cur)
            conn.commit()

            for comp_id, seasons in competitions_seasons.items():
                comp_dir = os.path.join(matches_dir, str(comp_id))
                for season_id in seasons:
                    match_ids = extract_match_ids_for_season(comp_dir, season_id)
                    season_path = os.path.join(matches_dir, str(comp_id), f"{season_id}.json")

                    # in order
                    load_countries_and_positions(cur, lineups_dir, match_ids)
                    conn.commit()

                    load_teams(cur, lineups_dir, match_ids)
                    conn.commit()

                    load_stadiums_referees_and_managers(cur, season_path)
                    conn.commit()

                    load_players(cur, lineups_dir, match_ids)
                    conn.commit()

                    load_matches(cur, season_path)
                    conn.commit()

                    load_player_positions_and_cards(cur, lineups_dir, match_ids)
                    conn.commit()

                    load_match_managers(cur, season_path)
                    conn.commit()


if __name__ == "__main__":
    main()
