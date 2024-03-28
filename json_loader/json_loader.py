import json
import psycopg2
from psycopg2 import extras

# Database connection parameters
conn_params = {
    "dbname": "SoccerStatsDB",
    "user": "postgres",
    "password": "postgres",
    "host": "localhost"
}

def load_competitions(filename):
    # Open and load the JSON file
    with open(filename, 'r') as file:
        competitions = json.load(file)

    # Connect to database
    conn = psycopg2.connect(**conn_params)

    # Using cursor() method to obtain a cursor object
    with conn.cursor() as cursor:
        # Preparing SQL query to INSERT a record into the database.
        insert_query = """
        INSERT INTO Competitions (competition_id, name, country_name, gender, youth, international) 
        VALUES (%s, %s, %s, %s, %s, %s) ON CONFLICT (competition_id) DO NOTHING;
        """

        # Prepared data for insertion
        # Map JSON structure to table's schema
        data_for_insertion = [
            (
                competition.get("competition_id"),
                competition.get("competition_name"),
                competition.get("country_name"),
                competition.get("competition_gender"),
                competition.get("competition_youth"),
                competition.get("competition_international")
            ) for competition in competitions
        ]

        # Using execute_batch for efficient bulk inserts
        psycopg2.extras.execute_batch(cursor, insert_query, data_for_insertion)

    # Committing the changes
    conn.commit()

    # Close the database connection
    conn.close()


# load
load_competitions('C:/Users/fries/PycharmProjects/COMP_3005_Final_Project/JSON_Data_3005_Project/competitions.json')
