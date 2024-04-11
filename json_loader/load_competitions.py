import os
import json
import psycopg


def create_tables(cursor):
    create_competitions_table = """
        CREATE TABLE Competitions (
        competition_id INTEGER PRIMARY KEY,
        country_name VARCHAR(255),
        competition_name VARCHAR(255),
        competition_gender VARCHAR(255),
        competition_youth BOOLEAN,
        competition_international BOOLEAN
        );
        """

    create_seasons_table = """
       CREATE TABLE Seasons (
       competition_id INTEGER,
       season_id INTEGER,
       season_name VARCHAR(255),
       PRIMARY KEY (season_id, competition_id),
       FOREIGN KEY (competition_id) REFERENCES Competitions (competition_id)
       );
       """

    cursor.execute(create_competitions_table)
    cursor.execute(create_seasons_table)


def load_competitions(cursor):
    file_path = 'C:\\Users\\fries\\PycharmProjects\\COMP_3005_Final_Project\\open-data\\data\\competitions.json'

    with open(file_path, 'r', encoding='utf-8') as file:
        competitions = json.load(file)
        for competition in competitions:
            insert_into_competitions(cursor, competition)
            insert_into_seasons(cursor, competition)


def insert_into_competitions(cursor, competition):
    try:
        insert_query = """
            INSERT INTO Competitions (competition_id, country_name, competition_name, competition_gender, competition_youth, competition_international)
            VALUES (%s, %s, %s, %s, %s, %s)
            ON CONFLICT (competition_id) DO NOTHING;
            """

        cursor.execute(insert_query, (
            competition['competition_id'],
            competition['country_name'],
            competition['competition_name'],
            competition['competition_gender'],
            competition['competition_youth'],
            competition['competition_international']
        ))

    except Exception as e:
        print(f"Error inserting competition {competition.get('competition_id')}: {e}")


def insert_into_seasons(cursor, season):
    try:
        insert_query = """
            INSERT INTO Seasons (competition_id, season_id, season_name)
            VALUES (%s, %s, %s)
            ON CONFLICT (season_id, competition_id) DO NOTHING;
            """

        cursor.execute(insert_query, (
            season['competition_id'],
            season['season_id'],
            season['season_name'],
        ))

    except Exception as e:
        print(f"Error inserting season {season.get('season_id')}: {e}")


def main():
    conn_params = {
        'dbname': os.getenv('DB_NAME', 'postgres'),
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


if __name__ == "__main__":
    main()
