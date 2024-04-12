import os
import json
import psycopg
from datetime import datetime


def create_tables(cursor):
    create_table_matches = """ 
    CREATE TABLE Matches (
    match_id INTEGER PRIMARY KEY,
    match_date DATE,
    kick_off TIME(3), 
    competition_id INTEGER,
    season_id INTEGER,
    home_team_id INTEGER,
    away_team_id INTEGER,
    home_score INTEGER,
    away_score INTEGER,
    match_week INTEGER,
    competition_stage_id INTEGER,
    stadium_id INTEGER,
    referee_id INTEGER,
    FOREIGN KEY (competition_id) REFERENCES Competitions(competition_id),
    FOREIGN KEY (season_id, competition_id) REFERENCES Seasons(season_id, competition_id),
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (competition_stage_id) REFERENCES CompetitionStages(competition_stage_id),
    FOREIGN KEY (stadium_id) REFERENCES Stadiums(stadium_id),
    FOREIGN KEY (referee_id) REFERENCES Referees(referee_id)
    );
    """

    create_table_teams = """
    CREATE TABLE Teams (
    team_id INTEGER PRIMARY KEY,
    team_name VARCHAR(255),
    team_gender VARCHAR(255),
    team_group VARCHAR(20) NULL,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
    );
    """

    create_table_countries = """
    CREATE TABLE Countries (
    country_id INTEGER PRIMARY KEY,
    country_name VARCHAR(255)
    );
    """

    create_table_managers = """
    CREATE TABLE Managers (
    manager_id INTEGER PRIMARY KEY,
    manager_name VARCHAR(255),
    manager_nickname VARCHAR(255),
    manager_date_of_birth DATE,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
    );
    """

    create_table_team_managers = """
    CREATE TABLE TeamManagers (
    team_id INTEGER,
    manager_id INTEGER,
    PRIMARY KEY (team_id, manager_id),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (manager_id) REFERENCES Managers(manager_id)
    );
    """

    create_table_competition_stages = """
    CREATE TABLE CompetitionStages (
    competition_stage_id INTEGER PRIMARY KEY,
    competition_stage_name VARCHAR(255)
    );
    """

    create_table_stadiums = """
    CREATE TABLE Stadiums (
    stadium_id INTEGER PRIMARY KEY,
    stadium_name VARCHAR(255),
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
    );
    """

    create_table_referees = """
    CREATE TABLE Referees (
    referee_id INTEGER PRIMARY KEY,
    referee_name VARCHAR(255),
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
    );
    """

    # in order
    cursor.execute(create_table_countries)
    cursor.execute(create_table_competition_stages)
    cursor.execute(create_table_stadiums)
    cursor.execute(create_table_referees)
    cursor.execute(create_table_managers)
    cursor.execute(create_table_teams)
    cursor.execute(create_table_team_managers)
    cursor.execute(create_table_matches)


# def load_matches(cursor, file_path):
#     with open(file_path, 'r', encoding='utf-8') as file:
#         matches = json.load(file)
#         for match in matches:
#
#             for competition in match['competition']:
#
#             for season in match['season']:
#
#             for home_team in match['home_team']:
#
#                 for country in match['home_team']['country']:
#
#                 for manager in match['home_team']['managers']:
#
#             for away_team in match['away_team']:
#
#                 for country in match['home_team']['country']:
#
#                 for manager in match['home_team']['managers']:
#
#             for competition_stage in match['competition_stage']:
#
#             for stadium in match['stadium']:
#
#                 for country in match['stadium']['country']:
#
#             for referee in match['referee']:
#
#                 for country in match['referee']['country']:

def load_countries(cursor, file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        matches = json.load(file)
        for match in matches:
            home_team_country = match['home_team']['country']
            insert_country_into_database(cursor, home_team_country)

            away_team_country = match['away_team']['country']
            insert_country_into_database(cursor, away_team_country)

            if 'stadium' in match and match['stadium'] is not None:
                stadium_country = match['stadium']['country']
                insert_country_into_database(cursor, stadium_country)

            if 'referee' in match and match['referee'] is not None:
                referee_country = match['referee']['country']
                insert_country_into_database(cursor, referee_country)

            for manager in match['home_team'].get('managers', []):
                manager_country = manager['country']
                insert_country_into_database(cursor, manager_country)

            for manager in match['away_team'].get('managers', []):
                manager_country = manager['country']
                insert_country_into_database(cursor, manager_country)


def load_competition_stages(cursor, file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        matches = json.load(file)
        for match in matches:
            competition_stage = match['competition_stage']
            if competition_stage:
                insert_competition_stage_into_database(cursor, competition_stage)


def load_stadiums(cursor, file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        matches = json.load(file)
        for match in matches:
            if 'stadium' in match and match['stadium'] is not None:
                insert_stadium_into_database(cursor, match['stadium'])


def load_referees(cursor, file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        matches = json.load(file)
        for match in matches:
            if 'referee' in match and match['referee'] is not None:
                insert_referee_into_database(cursor, match['referee'])


def load_teams_and_managers(cursor, file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        matches = json.load(file)
        for match in matches:
            # Process home and away teams
            for team_key in ['home_team', 'away_team']:
                team = match[team_key]
                insert_team_into_database(cursor, team)

                team_id_key = f"{team_key}_id"
                team_id = team[team_id_key]

                # Process managers if the key exists and is not None
                if 'managers' in team and team['managers'] is not None:
                    for manager in team['managers']:
                        insert_manager_into_database(cursor, manager)
                        link_team_and_manager(cursor, team_id, manager['id'])


def load_matches(cursor, file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        matches = json.load(file)
        for match in matches:
            insert_match_into_database(cursor, match)


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


def insert_competition_stage_into_database(cursor, competition_stage):
    try:
        insert_query = """
        INSERT INTO CompetitionStages (competition_stage_id, competition_stage_name)
        VALUES (%s, %s)
        ON CONFLICT (competition_stage_id) DO NOTHING;
        """
        cursor.execute(insert_query, (competition_stage['id'], competition_stage['name']))
    except Exception as e:
        print(f"Error inserting competition stage {competition_stage['id']}: {e}")


def insert_stadium_into_database(cursor, stadium):
    try:
        insert_query = """
        INSERT INTO Stadiums (stadium_id, stadium_name, country_id)
        VALUES (%s, %s, %s)
        ON CONFLICT (stadium_id) DO NOTHING;
        """
        cursor.execute(insert_query, (stadium['id'], stadium['name'], stadium['country']['id']))
    except Exception as e:
        print(f"Error inserting stadium {stadium['id']}: {e}")


def insert_referee_into_database(cursor, referee):
    try:
        insert_query = """
        INSERT INTO Referees (referee_id, referee_name, country_id)
        VALUES (%s, %s, %s)
        ON CONFLICT (referee_id) DO NOTHING;
        """
        cursor.execute(insert_query, (referee['id'], referee['name'], referee['country']['id']))
    except Exception as e:
        print(f"Error inserting referee {referee['id']}: {e}")


def insert_manager_into_database(cursor, manager):
    dob = datetime.strptime(manager['dob'], '%Y-%m-%d').date() if 'dob' in manager else None
    try:
        insert_query = """
        INSERT INTO Managers (manager_id, manager_name, manager_nickname, manager_date_of_birth, country_id)
        VALUES (%s, %s, %s, %s, %s)
        ON CONFLICT (manager_id) DO NOTHING; 
        """
        cursor.execute(insert_query,
                       (manager['id'], manager['name'], manager['nickname'], dob, manager['country']['id']))
    except Exception as e:
        print(f"Error inserting manager {manager['id']}: {e}")


def insert_team_into_database(cursor, team):
    team_id_key = 'home_team_id' if 'home_team_id' in team else 'away_team_id'
    team_name_key = 'home_team_name' if 'home_team_name' in team else 'away_team_name'
    team_gender_key = 'home_team_gender' if 'home_team_gender' in team else 'away_team_gender'
    team_group_key = 'home_team_group' if 'home_team_group' in team else 'away_team_group'

    team_id = team[team_id_key]
    team_name = team[team_name_key]
    team_gender = team[team_gender_key]
    team_group = team[team_group_key]

    try:
        insert_query = """
        INSERT INTO Teams (team_id, team_name, team_gender, team_group, country_id)
        VALUES (%s, %s, %s, %s, %s)
        ON CONFLICT (team_id) DO NOTHING;
        """
        cursor.execute(insert_query, (team_id, team_name, team_gender, team_group, team['country']['id']))
    except Exception as e:
        print(f"Error inserting team {team_id}: {e}")


def insert_match_into_database(cursor, match):
    try:
        insert_query = """
        INSERT INTO Matches (match_id, match_date, kick_off, competition_id, season_id, home_team_id, away_team_id, home_score, away_score, match_week, competition_stage_id, stadium_id, referee_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s) 
        ON CONFLICT (match_id) DO NOTHING;
        """

        referee_id = match['referee']['id'] if 'referee' in match and match['referee'] is not None else None
        stadium_id = match['stadium']['id'] if 'stadium' in match and match['stadium'] is not None else None

        cursor.execute(insert_query, (
            match['match_id'], match['match_date'], match['kick_off'], match['competition']['competition_id'],
            match['season']['season_id'], match['home_team']['home_team_id'], match['away_team']['away_team_id'],
            match['home_score'], match['away_score'], match['match_week'], match['competition_stage']['id'],
            stadium_id, referee_id))
    except Exception as e:
        print(f"Error inserting match {match['match_id']}: {e}")


def link_team_and_manager(cursor, team_id, manager_id):
    try:
        insert_query = """
        INSERT INTO TeamManagers (team_id, manager_id)
        VALUES (%s, %s)
        ON CONFLICT (team_id, manager_id) DO NOTHING;
        """
        cursor.execute(insert_query, (team_id, manager_id))
    except Exception as e:
        print(f"Error linking team {team_id} with manager {manager_id}: {e}")


def main():
    base_dir = "C:\\Users\\fries\\PycharmProjects\\COMP_3005_Final_Project\\open-data"
    matches_dir = os.path.join(base_dir, "data", "matches")

    competitions_seasons = {
        # competition with season ids
        11: ["90", "42", "4"],
        2: ["44"]
    }

    conn_params = {
        'dbname': os.getenv('DB_NAME', 'query_database'),
        'user': os.getenv('DB_USER', 'postgres'),
        'password': os.getenv('DB_PASSWORD', '1234'),
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
                    season_json_path = os.path.join(comp_dir, f"{season_id}.json")

                    # loaders
                    load_countries(cur, season_json_path)
                    conn.commit()

                    load_competition_stages(cur, season_json_path)
                    conn.commit()

                    load_stadiums(cur, season_json_path)
                    conn.commit()

                    load_referees(cur, season_json_path)
                    conn.commit()

                    load_teams_and_managers(cur, season_json_path)
                    conn.commit()

                    load_matches(cur, season_json_path)
                    conn.commit()


if __name__ == "__main__":
    main()
