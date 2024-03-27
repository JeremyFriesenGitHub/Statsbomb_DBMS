import json
import psycopg2
import os

# Database connection parameters
db_params = {
    "dbname": "project",
    "user": "postgres",
    "password": "postgres",
    "host": "localhost",
    "port": "5432"
}

# Base directory containing JSON files and subdirectories
base_directory = 'C:\\Users\\fries\\PycharmProjects\\COMP3005_FinalProject\\JSON_Data_3005_Project'


def load_json_to_db(filepath, cursor):
    with open(filepath, 'r', encoding='utf-8') as file:
        json_data = json.load(file)
        cursor.execute(
            "INSERT INTO raw_events_data (data) VALUES (%s)",
            [json.dumps(json_data)]
        )


def walk_and_load(directory, cursor):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.json'):
                filepath = os.path.join(root, file)
                load_json_to_db(filepath, cursor)


def main():
    conn = psycopg2.connect(**db_params)
    cursor = conn.cursor()

    walk_and_load(base_directory, cursor)

    conn.commit()
    cursor.close()
    conn.close()


if __name__ == "__main__":
    main()