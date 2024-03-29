import json
import psycopg2
from psycopg2 import extras
from datetime import datetime

# Database connection parameters
conn_params = {
    "dbname": "SoccerStatsDB",
    "user": "postgres",
    "password": "postgres",
    "host": "localhost"
}


def load_data(filename):
    with open(filename, 'r') as file:
        data = json.load(file)

    conn = psycopg2.connect(**conn_params)

    try:
        with conn.cursor() as cursor:
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
    except psycopg2.Error as e:
        print(f"Database error: {e}")
    finally:
        conn.close()


# Specify the path to your JSON file
load_data('C:\\Users\\fries\\PycharmProjects\\COMP_3005_Final_Project\\JSON_Data_3005_Project\\competitions.json')
