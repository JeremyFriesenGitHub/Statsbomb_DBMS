import os
import json
import psycopg
from datetime import datetime


def create_tables(cursor):
    create_event_types_table = """
    CREATE TABLE Event_types (
    event_type_id INTEGER PRIMARY KEY,
    event_type_name VARCHAR(255)
    );
    """

    create_play_pattern_table = """
    CREATE TABLE Play_Patterns (
    play_pattern_id integer PRIMARY KEY,
    play_pattern_name VARCHAR(255)
    );
    """

    create_event_outcome_table = """
    CREATE TABLE event_outcomes (
    outcome_id INTEGER PRIMARY KEY ,
    outcome_name VARCHAR(255)
    );
    """

    create_event_body_part_table = """
    CREATE TABLE event_body_parts (
    body_part_id integer PRIMARY KEY,
    body_part_name VARCHAR(255)
    );
    """

    create_event_technique_table = """
    CREATE TABLE event_techniques(
    technique_id INTEGER PRIMARY KEY,
    technique_name VARCHAR(255)
    );
    """

    create_height_table = """
    CREATE TABLE pass_heights (
    height_id INTEGER PRIMARY KEY,
    height_name VARCHAR(255)
    );
    """

    create_card_types_table = """
    CREATE TABLE card_types (
    card_type_id INTEGER PRIMARY KEY,
    card_type_name VARCHAR(255)
    );
    """

    create_50_50_table = """
    CREATE TABLE fifty_fifty (
    id UUID PRIMARY KEY NOT NULL ,
    index INTEGER NOT NULL,
    period INTEGER,
    timestamp TIME,
    minute INTEGER,
    seconds INTEGER,
    event_type_id INTEGER,
    possession INTEGER,
    possession_team_id INTEGER,
    play_pattern_id INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    position_id INTEGER,
    location POINT,
    duration FLOAT,
    under_pressure BOOLEAN,
    outcome_id INTEGER,
    counterpress BOOLEAN,
    out BOOLEAN, 
    match_id INTEGER,
    FOREIGN KEY (match_id) REFERENCES matches (match_id),
    FOREIGN KEY (event_type_id) REFERENCES event_types (event_type_id),
    FOREIGN KEY (possession_team_id) REFERENCES teams (team_id),
    FOREIGN KEY (play_pattern_id) REFERENCES play_patterns (play_pattern_id),
    FOREIGN KEY (team_id) REFERENCES teams (team_id),
    FOREIGN KEY (player_id) REFERENCES players (player_id),
    FOREIGN KEY (position_id) REFERENCES positions (position_id),
    FOREIGN KEY (outcome_id) REFERENCES event_outcomes (outcome_id)
    );
    """

    create_bad_behaviour_table = """
    CREATE TABLE Bad_Behaviours (
    id UUID PRIMARY KEY,
    index INTEGER NOT NULL,
    period INTEGER,
    timestamp TIME,
    minute INTEGER,
    second INTEGER,
    event_type_id INTEGER,
    possession INTEGER,
    possession_team_id INTEGER,
    play_pattern_id INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    position_id INTEGER,
    duration FLOAT,
    card_id INTEGER,
    off_camera BOOLEAN,
    match_id INTEGER,
    FOREIGN KEY (match_id) REFERENCES matches (match_id),
    FOREIGN KEY (event_type_id) REFERENCES event_types (event_type_id),
    FOREIGN KEY (possession_team_id) REFERENCES teams (team_id),
    FOREIGN KEY (play_pattern_id) REFERENCES play_patterns (play_pattern_id),
    FOREIGN KEY (team_id) REFERENCES teams (team_id),
    FOREIGN KEY (player_id) REFERENCES players (player_id),
    FOREIGN KEY (position_id) REFERENCES positions (position_id),
    FOREIGN KEY (card_id) REFERENCES card_types (card_type_id)    
    );
    """

    create_ball_recovery_table = """
    CREATE TABLE Ball_recoveries (
    id UUID PRIMARY KEY,
    index INTEGER NOT NULL,
    period INTEGER,
    timestamp TIME,
    minute INTEGER,
    second INTEGER,
    event_type_id INTEGER,
    possession INTEGER,
    possession_team_id INTEGER,
    play_pattern_id INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    position_id INTEGER,
    location POINT,
    duration FLOAT,
    under_pressure BOOLEAN,
    out BOOLEAN,
    recovery_failure BOOLEAN,
    offensive_recovery BOOLEAN,
    off_camera BOOLEAN, 
    match_id INTEGER,
    FOREIGN KEY (match_id) REFERENCES matches (match_id),
    FOREIGN KEY (event_type_id) REFERENCES event_types (event_type_id),
    FOREIGN KEY (possession_team_id) REFERENCES teams (team_id),
    FOREIGN KEY (play_pattern_id) REFERENCES play_patterns (play_pattern_id),
    FOREIGN KEY (team_id) REFERENCES teams (team_id),
    FOREIGN KEY (player_id) REFERENCES players (player_id),
    FOREIGN KEY (position_id) REFERENCES positions (position_id)
    );
    """

    create_block_table = """
    CREATE TABLE Blocks (
    id UUID PRIMARY KEY,
    index INTEGER NOT NULL,
    period INTEGER,
    timestamp TIME,
    minute INTEGER,
    second INTEGER,
    event_type_id INTEGER,
    possession INTEGER,
    possession_team_id INTEGER,
    play_pattern_id INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    position_id INTEGER,
    location POINT,
    duration FLOAT,
    out BOOLEAN,
    counterpress BOOLEAN,
    deflection BOOLEAN,
    offensive_block BOOLEAN,
    save_block BOOLEAN,
    under_pressure BOOLEAN,
    off_camera BOOLEAN,
    match_id INTEGER,
    FOREIGN KEY (match_id) REFERENCES matches (match_id),
    FOREIGN KEY (event_type_id) REFERENCES event_types (event_type_id),
    FOREIGN KEY (possession_team_id) REFERENCES teams (team_id),
    FOREIGN KEY (play_pattern_id) REFERENCES play_patterns (play_pattern_id),
    FOREIGN KEY (team_id) REFERENCES teams (team_id),
    FOREIGN KEY (player_id) REFERENCES players (player_id),
    FOREIGN KEY (position_id) REFERENCES positions (position_id)
    );
    """

    create_table_carry = """
    CREATE TABLE Carries (
    id UUID PRIMARY KEY,
    index INTEGER NOT NULL,
    period INTEGER,
    timestamp TIME,
    minute INTEGER,
    second INTEGER,
    event_type_id INTEGER,
    possession INTEGER,
    possession_team_id INTEGER,
    play_pattern_id INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    position_id INTEGER,
    location POINT,
    duration FLOAT,
    end_location POINT,
    under_pressure BOOLEAN,
    match_id INTEGER,
    FOREIGN KEY (match_id) REFERENCES matches (match_id),
    FOREIGN KEY (event_type_id) REFERENCES event_types (event_type_id),
    FOREIGN KEY (possession_team_id) REFERENCES teams (team_id),
    FOREIGN KEY (play_pattern_id) REFERENCES play_patterns (play_pattern_id),
    FOREIGN KEY (team_id) REFERENCES teams (team_id),
    FOREIGN KEY (player_id) REFERENCES players (player_id),
    FOREIGN KEY (position_id) REFERENCES positions (position_id)  
    );
    """

    create_table_clearance = """
    CREATE TABLE Clearances (
    id UUID PRIMARY KEY,
    index INTEGER NOT NULL,
    period INTEGER,
    timestamp TIME,
    minute INTEGER,
    second INTEGER,
    event_type_id INTEGER,
    possession INTEGER,
    possession_team_id INTEGER,
    play_pattern_id INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    position_id INTEGER,
    location POINT,
    duration FLOAT,
    under_pressure BOOLEAN,
    body_part_id INTEGER,
    right_foot BOOLEAN,
    left_foot BOOLEAN,
    aerial_won BOOLEAN,
    head BOOLEAN,
    other BOOLEAN,
    out BOOLEAN, 
    off_camera BOOLEAN,
    match_id INTEGER,
    FOREIGN KEY (match_id) REFERENCES matches (match_id),
    FOREIGN KEY (event_type_id) REFERENCES event_types (event_type_id),
    FOREIGN KEY (possession_team_id) REFERENCES teams (team_id),
    FOREIGN KEY (play_pattern_id) REFERENCES play_patterns (play_pattern_id),
    FOREIGN KEY (team_id) REFERENCES teams (team_id),
    FOREIGN KEY (player_id) REFERENCES players (player_id),
    FOREIGN KEY (position_id) REFERENCES positions (position_id),
    FOREIGN KEY (body_part_id) REFERENCES event_body_parts (body_part_id)
    );
    """

    create_table_dispossessed = """
    CREATE TABLE Dispossessions(
    id UUID PRIMARY KEY,
    index INTEGER NOT NULL,
    period INTEGER,
    timestamp TIME,
    minute INTEGER,
    second INTEGER,
    event_type_id INTEGER,
    possession INTEGER,
    possession_team_id INTEGER,
    play_pattern_id INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    position_id INTEGER,
    location POINT,
    duration FLOAT,
    under_pressure BOOLEAN,
    off_camera BOOLEAN,
    match_id INTEGER,
    FOREIGN KEY (match_id) REFERENCES matches (match_id),
    FOREIGN KEY (event_type_id) REFERENCES event_types (event_type_id),
    FOREIGN KEY (possession_team_id) REFERENCES teams (team_id),
    FOREIGN KEY (play_pattern_id) REFERENCES play_patterns (play_pattern_id),
    FOREIGN KEY (team_id) REFERENCES teams (team_id),
    FOREIGN KEY (player_id) REFERENCES players (player_id),
    FOREIGN KEY (position_id) REFERENCES positions (position_id)
    );
    """

    create_table_dribble = """
    CREATE TABLE Dribbles (
    id UUID PRIMARY KEY,
    index INTEGER NOT NULL,
    period INTEGER,
    timestamp TIME,
    minute INTEGER,
    second INTEGER,
    event_type_id INTEGER,
    possession INTEGER,
    possession_team_id INTEGER,
    play_pattern_id INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    position_id INTEGER,
    location POINT,
    duration FLOAT,
    under_pressure BOOLEAN,
    outcome_id INTEGER,
    overrun BOOLEAN,
    nutmeg BOOLEAN,
    no_touch BOOLEAN,
    off_camera BOOLEAN,
    out BOOLEAN,
    match_id INTEGER,
    FOREIGN KEY (match_id) REFERENCES matches (match_id),
    FOREIGN KEY (event_type_id) REFERENCES event_types (event_type_id),
    FOREIGN KEY (possession_team_id) REFERENCES teams (team_id),
    FOREIGN KEY (play_pattern_id) REFERENCES play_patterns (play_pattern_id),
    FOREIGN KEY (team_id) REFERENCES teams (team_id),
    FOREIGN KEY (player_id) REFERENCES players (player_id),
    FOREIGN KEY (position_id) REFERENCES positions (position_id),
    FOREIGN KEY (outcome_id) REFERENCES event_outcomes (outcome_id)
    );
    """

    create_table_dribbled_past = """
    CREATE TABLE Dribbles_Past (
    id UUID PRIMARY KEY,
    index INTEGER NOT NULL,
    period INTEGER,
    timestamp TIME,
    minute INTEGER,
    second INTEGER,
    event_type_id INTEGER,
    possession INTEGER,
    possession_team_id INTEGER,
    play_pattern_id INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    position_id INTEGER,
    location POINT,
    duration FLOAT,
    counterpress BOOLEAN,
    off_camera BOOLEAN,
    match_id INTEGER,
    FOREIGN KEY (match_id) REFERENCES matches (match_id),
    FOREIGN KEY (event_type_id) REFERENCES event_types (event_type_id),
    FOREIGN KEY (possession_team_id) REFERENCES teams (team_id),
    FOREIGN KEY (play_pattern_id) REFERENCES play_patterns (play_pattern_id),
    FOREIGN KEY (team_id) REFERENCES teams (team_id),
    FOREIGN KEY (player_id) REFERENCES players (player_id),
    FOREIGN KEY (position_id) REFERENCES positions (position_id)
    );
    """

    create_table_duel = """
    CREATE TABLE Duels(
    id UUID PRIMARY KEY,
    index INTEGER NOT NULL,
    period INTEGER,
    timestamp TIME,
    minute INTEGER,
    second INTEGER,
    event_type_id INTEGER,
    possession INTEGER,
    possession_team_id INTEGER,
    play_pattern_id INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    position_id INTEGER,
    location POINT,
    duration FLOAT,
    under_pressure BOOLEAN,
    duel_type_id INTEGER,
    outcome_id INTEGER,
    counterpress BOOLEAN,
    off_camera BOOLEAN,
    match_id INTEGER,
    FOREIGN KEY (match_id) REFERENCES matches (match_id),
    FOREIGN KEY (event_type_id) REFERENCES event_types (event_type_id),
    FOREIGN KEY (possession_team_id) REFERENCES teams (team_id),
    FOREIGN KEY (play_pattern_id) REFERENCES play_patterns (play_pattern_id),
    FOREIGN KEY (team_id) REFERENCES teams (team_id),
    FOREIGN KEY (player_id) REFERENCES players (player_id),
    FOREIGN KEY (position_id) REFERENCES positions (position_id),
    FOREIGN KEY (duel_type_id) REFERENCES event_types (event_type_id),
    FOREIGN KEY (outcome_id) REFERENCES event_outcomes (outcome_id)
    );
    """

    create_table_error = """
    CREATE TABLE Errors(
    id UUID PRIMARY KEY,
    index INTEGER NOT NULL,
    period INTEGER,
    timestamp TIME,
    minute INTEGER,
    second INTEGER,
    event_type_id INTEGER,
    possession INTEGER,
    possession_team_id INTEGER,
    play_pattern_id INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    position_id INTEGER,
    location POINT,
    duration FLOAT,
    under_pressure BOOLEAN,
    off_camera BOOLEAN,
    match_id INTEGER,
    FOREIGN KEY (match_id) REFERENCES matches (match_id),
    FOREIGN KEY (event_type_id) REFERENCES event_types (event_type_id),
    FOREIGN KEY (possession_team_id) REFERENCES teams (team_id),
    FOREIGN KEY (play_pattern_id) REFERENCES play_patterns (play_pattern_id),
    FOREIGN KEY (team_id) REFERENCES teams (team_id),
    FOREIGN KEY (player_id) REFERENCES players (player_id),
    FOREIGN KEY (position_id) REFERENCES positions (position_id)
    );
    """

    # #to change for subs, tactics, etc.
    # create_tactics_table = """
    # CREATE TABLE Tactics (
    # event_id UUID PRIMARY KEY,
    # formation INTEGER,
    # FOREIGN KEY (event_id) REFERENCES Events(event_id)
    # );
    # """

    # to optimize
    cursor.execute(create_event_types_table)
    cursor.execute(create_play_pattern_table)
    cursor.execute(create_event_outcome_table)
    cursor.execute(create_event_body_part_table)
    cursor.execute(create_event_technique_table)
    cursor.execute(create_height_table)
    cursor.execute(create_card_types_table)
    cursor.execute(create_50_50_table)
    cursor.execute(create_bad_behaviour_table)
    cursor.execute(create_ball_recovery_table)
    cursor.execute(create_block_table)
    cursor.execute(create_table_carry)
    cursor.execute(create_table_clearance)
    cursor.execute(create_table_dispossessed)
    cursor.execute(create_table_dribble)
    cursor.execute(create_table_dribbled_past)
    cursor.execute(create_table_duel)
    cursor.execute(create_table_error)
    # cursor.execute(create_tactics_table)


def load_event_types(cursor, events_dir, match_ids):
    for match_id in match_ids:
        specific_file_path = os.path.join(events_dir, f"{match_id}.json")
        if os.path.exists(specific_file_path):
            with open(specific_file_path, 'r', encoding='utf-8') as file:
                events = json.load(file)
                for event in events:

                    event_type = event.get('type', {})
                    play_pattern = event.get('play_pattern', {})
                    duel_type = event.get('duel', {}).get('type')
                    foul_committed_type = event.get('foul_committed', {}).get('type')
                    goalkeeper_type = event.get('goalkeeper', {}).get('type')
                    pass_type = event.get('pass', {}).get('type')
                    shot_type = event.get('shot', {}).get('type')
                    clearance_part = event.get('clearance', {}).get('body_part')
                    goalkeeper_part = event.get('goalkeeper', {}).get('body_part')
                    pass_part = event.get('pass', {}).get('body_part')
                    shot_part = event.get('shot', {}).get('body_part')
                    goalkeeper_technique = event.get('goalkeeper', {}).get('technique')
                    pass_technique = event.get('pass', {}).get('technique')
                    shot_technique = event.get('shot', {}).get('technique')
                    height = event.get('pass', {}).get('height')
                    bad_behaviour = event.get('bad_behaviour', {}).get('card')
                    foul_committed = event.get('foul_committed', {}).get('card')
                    fifty_fifty_outcome = event.get('50_50', {}).get('outcome')
                    duel_outcome = event.get('duel', {}).get('outcome')
                    goalkeeper_position = event.get('goalkeeper', {}).get('position')
                    goalkeeper_outcome = event.get('goalkeeper', {}).get('outcome')
                    interception_outcome = event.get('interception', {}).get('outcome')
                    pass_outcome = event.get('pass', {}).get('outcome')
                    shot_outcome = event.get('shot', {}).get('outcome')
                    substitution_outcome = event.get('substitution', {}).get('outcome')
                    dribble_outcome = event.get('dribble', {}).get('outcome')
                    position = event.get('position', {})
                    if position:
                        insert_position_into_database(cursor, position)
                    if event_type:
                        insert_event_type_into_database(cursor, event_type)
                    if play_pattern:
                        insert_play_pattern_into_database(cursor, play_pattern)
                    if duel_type:
                        insert_event_type_into_database(cursor, duel_type)
                    if foul_committed_type:
                        insert_event_type_into_database(cursor, foul_committed_type)
                    if goalkeeper_type:
                        insert_event_type_into_database(cursor, goalkeeper_type)
                    if pass_type:
                        insert_event_type_into_database(cursor, pass_type)
                    if shot_type:
                        insert_event_type_into_database(cursor, shot_type)
                    if clearance_part:
                        insert_body_part(cursor, clearance_part)
                    if goalkeeper_part:
                        insert_body_part(cursor, goalkeeper_part)
                    if pass_part:
                        insert_body_part(cursor, pass_part)
                    if shot_part:
                        insert_body_part(cursor, shot_part)
                    if goalkeeper_technique:
                        insert_technique(cursor, goalkeeper_technique)
                    if pass_technique:
                        insert_technique(cursor, pass_technique)
                    if shot_technique:
                        insert_technique(cursor, shot_technique)
                    if height:
                        insert_height(cursor, height)
                    if bad_behaviour:
                        insert_card(cursor, bad_behaviour)
                    if foul_committed:
                        insert_card(cursor, foul_committed)
                    if fifty_fifty_outcome:
                        insert_outcomes(cursor, fifty_fifty_outcome)
                    if duel_outcome:
                        insert_outcomes(cursor, duel_outcome)
                    if goalkeeper_position:
                        insert_position_into_database(cursor, goalkeeper_position)
                    if goalkeeper_outcome:
                        insert_outcomes(cursor, goalkeeper_outcome)
                    if interception_outcome:
                        insert_outcomes(cursor, interception_outcome)
                    if pass_outcome:
                        insert_outcomes(cursor, pass_outcome)
                    if shot_outcome:
                        insert_outcomes(cursor, shot_outcome)
                    if substitution_outcome:
                        insert_outcomes(cursor, substitution_outcome)
                    if dribble_outcome:
                        insert_outcomes(cursor, dribble_outcome)


# def load_tactics(cursor, events_dir, match_ids):
#     for match_id in match_ids:
#         specific_file_path = os.path.join(events_dir, f"{match_id}.json")
#         if os.path.exists(specific_file_path):
#             with open(specific_file_path, 'r', encoding='utf-8') as file:
#                 events = json.load(file)
#                 for event in events:
#                     if 'tactics' in event:
#                         insert_tactics(cursor, event['id'], event['tactics'])


def load_events(cursor, events_dir, match_ids):
    for match_id in match_ids:
        specific_file_path = os.path.join(events_dir, f"{match_id}.json")
        if os.path.exists(specific_file_path):
            with open(specific_file_path, 'r', encoding='utf-8') as file:
                events = json.load(file)
                for event in events:
                    if "50_50" in event:
                        insert_50_50(cursor, event, match_id)
                    if "bad_behaviour" in event:
                        insert_bad_behaviour(cursor, event, match_id)
                    if "ball_recovery" in event:
                        insert_ball_recovery(cursor, event, match_id)
                    if "block" in event:
                        insert_block(cursor, event, match_id)
                    if "carry" in event:
                        insert_carry(cursor, event, match_id)
                    if "clearance" in event:
                        insert_clearance(cursor, event, match_id)
                    if event.get('type', {}).get('name') == "Dispossessed":
                        insert_dispossessed(cursor, event, match_id)
                    if "dribble" in event:
                        insert_dribble(cursor, event, match_id)
                    if event.get('type', {}).get('name') == "Dribbled Past":
                        insert_dribbled_past(cursor, event, match_id)
                    if "duel" in event:
                        insert_duel(cursor, event, match_id)
                    if event.get('type', {}).get('name') == "Error":
                        insert_error(cursor, event, match_id)


def insert_block(cursor, event, match_id):
    try:
        location = None
        if 'location' in event and event['location'] is not None:
            x, y = event['location']
            location = f"({x}, {y})"

        event_timestamp = event.get('timestamp')
        if event_timestamp:
            hours, minutes, seconds = event_timestamp.split(':')
            event_timestamp = f"{int(hours):02}:{int(minutes):02}:{float(seconds):06.3f}"

        out = event.get('out', None)
        counterpress = event.get('counterpress', None)
        deflection = event.get('block', {}).get('deflection', None)
        offensive_block = event.get('block', {}).get('offensive', None)
        save_block = event.get('block', {}).get('save_block', None)
        under_pressure = event.get('under_pressure', None)
        off_camera = event.get('off_camera', None)

        insert_query = """
        INSERT INTO Blocks (id, index, period, timestamp, minute, second, event_type_id, possession, possession_team_id, play_pattern_id, team_id, player_id, position_id, location, duration, out, counterpress, deflection, offensive_block, save_block, under_pressure, off_camera, match_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        ON CONFLICT (id) DO NOTHING;
        """

        cursor.execute(insert_query, (
            event['id'], event['index'], event['period'], event_timestamp, event['minute'], event['second'],
            event['type']['id'], event['possession'], event['possession_team']['id'], event['play_pattern']['id'],
            event['team']['id'], event['player']['id'], event.get('position', {}).get('id'), location,
            event.get('duration'), out,
            counterpress, deflection, offensive_block, save_block, under_pressure, off_camera, match_id))
    except Exception as e:
        print(f"Error inserting blocks event {event['id']}: {e}")


def insert_carry(cursor, event, match_id):
    try:
        event_timestamp = event.get('timestamp')
        if event_timestamp:
            hours, minutes, seconds = event_timestamp.split(':')
            event_timestamp = f"{int(hours):02}:{int(minutes):02}:{float(seconds):06.3f}"

        location = None
        if 'location' in event and event['location'] is not None:
            x, y = event['location']
            location = f"({x}, {y})"

        end_location = None
        if 'carry' in event and 'end_location' in event['carry'] and event['carry']['end_location'] is not None:
            ex, ey = event['carry']['end_location']
            end_location = f"({ex}, {ey})"
        under_pressure = event.get('under_pressure', None)

        insert_query = """
                INSERT INTO Carries (id, index, period, timestamp, minute, second, event_type_id, possession, possession_team_id, play_pattern_id, team_id, player_id, position_id, location, duration, end_location, under_pressure, match_id)
                VALUES (%s, %s, %s, %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
                ON CONFLICT (id) DO NOTHING;
                """

        cursor.execute(insert_query, (
            event['id'], event['index'], event['period'], event_timestamp, event['minute'], event['second'],
            event['type']['id'], event['possession'], event['possession_team']['id'], event['play_pattern']['id'],
            event['team']['id'], event['player']['id'], event['position']['id'], location, event['duration'],
            end_location,
            under_pressure, match_id))
    except Exception as e:
        print(f"Error inserting carry event {event['id']}: {e}")


def insert_duel(cursor, event, match_id):
    try:
        event_timestamp = event.get('timestamp')
        if event_timestamp:
            hours, minutes, seconds = event_timestamp.split(':')
            event_timestamp = f"{int(hours):02}:{int(minutes):02}:{float(seconds):06.3f}"

        location = None
        if 'location' in event and event['location'] is not None:
            x, y = event['location']
            location = f"({x}, {y})"

        under_pressure = event.get('under_pressure', None)
        outcome_id = event.get('clearance', {}).get('outcome', {}).get('id', None)
        counterpress = event.get('counterpress', None)
        off_camera = event.get('off_camera', None)

        insert_query = """
        INSERT INTO Duels (id, index , period ,timestamp , minute , second , event_type_id , possession , possession_team_id , play_pattern_id , team_id , player_id , position_id , location , duration , under_pressure, duel_type_id, outcome_id, counterpress, off_camera, match_id)
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        ON CONFLICT (id) DO NOTHING;
        """

        cursor.execute(insert_query,
                       (event['id'], event['index'], event['period'], event_timestamp, event['minute'], event['second'],
                        event['type']['id'], event['possession'], event['possession_team']['id'],
                        event['play_pattern']['id'],
                        event['team']['id'], event['player']['id'], event['position']['id'], location,
                        event['duration'],
                        under_pressure, event['duel']['type']['id'], outcome_id, counterpress, off_camera, match_id))
    except Exception as e:
        print(f"Error inserting duel event {event['id']}: {e}")


def insert_clearance(cursor, event, match_id):
    try:
        event_timestamp = event.get('timestamp')
        if event_timestamp:
            hours, minutes, seconds = event_timestamp.split(':')
            event_timestamp = f"{int(hours):02}:{int(minutes):02}:{float(seconds):06.3f}"

        location = None
        if 'location' in event and event['location'] is not None:
            x, y = event['location']
            location = f"({x}, {y})"

        under_pressure = event.get('under_pressure', None)
        right_foot = event.get('clearance', {}).get('right_foot', None)
        left_foot = event.get('clearance', {}).get('left_foot', None)
        aerial_won = event.get('clearance', {}).get('aerial_won', None)
        head = event.get('clearance', {}).get('head', None)
        other = event.get('clearance', {}).get('other', None)
        out = event.get('out', None)
        off_camera = event.get('off_camera', None)

        insert_query = """
        INSERT INTO Clearances (id, index , period ,timestamp , minute , second , event_type_id , possession , possession_team_id , play_pattern_id , team_id , player_id , position_id , location , duration , under_pressure , body_part_id ,right_foot , left_foot , aerial_won , head , other , out ,  off_camera , match_id)
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        ON CONFLICT (id) DO NOTHING;
        """

        cursor.execute(insert_query, (
            event['id'], event['index'], event['period'], event_timestamp, event['minute'], event['second'],
            event['type']['id'], event['possession'], event['possession_team']['id'], event['play_pattern']['id'],
            event['team']['id'], event['player']['id'], event['position']['id'], location, event['duration'],
            under_pressure, event['clearance']['body_part']['id'], right_foot, left_foot, aerial_won, head, other, out,
            off_camera, match_id))
    except Exception as e:
        print(f"Error inserting clearance event {event['id']}: {e}")


def insert_dispossessed(cursor, event, match_id):
    try:
        event_timestamp = event.get('timestamp')
        if event_timestamp:
            hours, minutes, seconds = event_timestamp.split(':')
            event_timestamp = f"{int(hours):02}:{int(minutes):02}:{float(seconds):06.3f}"

        location = None
        if 'location' in event and event['location'] is not None:
            x, y = event['location']
            location = f"({x}, {y})"

        under_pressure = event.get('under_pressure', None)
        off_camera = event.get('off_camera', None)

        insert_query = """
        INSERT INTO Dispossessions (id , index , period , timestamp , minute , second , event_type_id , possession , possession_team_id , play_pattern_id , team_id , player_id , position_id ,location , duration ,  under_pressure , off_camera , match_id)
        VALUES (%s, %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        ON CONFLICT (id) DO NOTHING;
        """

        cursor.execute(insert_query, (
            event['id'], event['index'], event['period'], event_timestamp, event['minute'], event['second'],
            event['type']['id'], event['possession'], event['possession_team']['id'], event['play_pattern']['id'],
            event['team']['id'], event['player']['id'], event['position']['id'], location, event['duration'],
            under_pressure, off_camera, match_id))
    except Exception as e:
        print(f"Error inserting dispossession event {event['id']}: {e}")


def insert_error(cursor, event, match_id):
    try:
        event_timestamp = event.get('timestamp')
        if event_timestamp:
            hours, minutes, seconds = event_timestamp.split(':')
            event_timestamp = f"{int(hours):02}:{int(minutes):02}:{float(seconds):06.3f}"

        location = None
        if 'location' in event and event['location'] is not None:
            x, y = event['location']
            location = f"({x}, {y})"

        under_pressure = event.get('under_pressure', None)
        off_camera = event.get('off_camera', None)

        insert_query = """
        INSERT INTO Errors (id , index , period , timestamp , minute , second , event_type_id , possession , possession_team_id , play_pattern_id , team_id , player_id , position_id ,location , duration ,  under_pressure , off_camera , match_id)
        VALUES (%s, %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        ON CONFLICT (id) DO NOTHING;
        """

        cursor.execute(insert_query, (
            event['id'], event['index'], event['period'], event_timestamp, event['minute'], event['second'],
            event['type']['id'], event['possession'], event['possession_team']['id'], event['play_pattern']['id'],
            event['team']['id'], event['player']['id'], event['position']['id'], location, event['duration'],
            under_pressure, off_camera, match_id))
    except Exception as e:
        print(f"Error inserting error event {event['id']}: {e}")


def insert_dribbled_past(cursor, event, match_id):
    try:
        event_timestamp = event.get('timestamp')
        if event_timestamp:
            hours, minutes, seconds = event_timestamp.split(':')
            event_timestamp = f"{int(hours):02}:{int(minutes):02}:{float(seconds):06.3f}"

        location = None
        if 'location' in event and event['location'] is not None:
            x, y = event['location']
            location = f"({x}, {y})"

        counterpress = event.get('counterpress', None)
        off_camera = event.get('off_camera', None)
        insert_query = """
        INSERT INTO Dribbles_Past (id , index , period , timestamp , minute , second , event_type_id , possession , possession_team_id , play_pattern_id , team_id , player_id , position_id ,location , duration , counterpress , off_camera, match_id)
        VALUES (%s, %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        ON CONFLICT (id) DO NOTHING;
        """

        cursor.execute(insert_query, (
            event['id'], event['index'], event['period'], event_timestamp, event['minute'], event['second'],
            event['type']['id'], event['possession'], event['possession_team']['id'], event['play_pattern']['id'],
            event['team']['id'], event['player']['id'], event['position']['id'], location, event['duration'],
            counterpress, off_camera, match_id))
    except Exception as e:
        print(f"Error inserting dribbled past {event['id']}: {e}")


def insert_dribble(cursor, event, match_id):
    try:
        event_timestamp = event.get('timestamp')
        if event_timestamp:
            hours, minutes, seconds = event_timestamp.split(':')
            event_timestamp = f"{int(hours):02}:{int(minutes):02}:{float(seconds):06.3f}"

        location = None
        if 'location' in event and event['location'] is not None:
            x, y = event['location']
            location = f"({x}, {y})"

        under_pressure = event.get('under_pressure', None)
        overrun = event.get('dribble', {}).get('overrun', None)
        nutmeg = event.get('dribble', {}).get('nutmeg', None)
        no_touch = event.get('dribble', {}).get('no_touch', None)
        off_camera = event.get('off_camera', None)
        out = event.get('out', None)

        insert_query = """
        INSERT INTO Dribbles (id , index , period , timestamp , minute , second , event_type_id , possession , possession_team_id , play_pattern_id , team_id , player_id , position_id ,location , duration , under_pressure , outcome_id, overrun , nutmeg, no_touch , off_camera, out, match_id)
        VALUES (%s, %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        ON CONFLICT (id) DO NOTHING;
        """

        cursor.execute(insert_query, (
            event['id'], event['index'], event['period'], event_timestamp, event['minute'], event['second'],
            event['type']['id'], event['possession'], event['possession_team']['id'], event['play_pattern']['id'],
            event['team']['id'], event['player']['id'], event['position']['id'], location, event['duration'],
            under_pressure, event['dribble']['outcome']['id'], overrun, nutmeg, no_touch, off_camera, out, match_id))
    except Exception as e:
        print(f"Error inserting dribble event {event['id']}: {e}")


def insert_bad_behaviour(cursor, event, match_id):
    try:

        event_timestamp = event.get('timestamp')
        if event_timestamp:
            hours, minutes, seconds = event_timestamp.split(':')
            event_timestamp = f"{int(hours):02}:{int(minutes):02}:{float(seconds):06.3f}"

        off_camera = event.get('off_camera', None)

        insert_query = """
        INSERT INTO Bad_Behaviours (id , index ,period , timestamp ,minute ,second ,event_type_id ,possession ,possession_team_id ,play_pattern_id ,team_id ,player_id ,position_id ,duration ,card_id ,off_camera ,match_id)
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        ON CONFLICT (id) DO NOTHING;
        """

        cursor.execute(insert_query, (
            event['id'], event['index'], event['period'], event_timestamp, event['minute'], event['second'],
            event['type']['id'], event['possession'], event['possession_team']['id'], event['play_pattern']['id'],
            event['team']['id'], event['player']['id'], event['position']['id'], event['duration'],
            event['bad_behaviour']['card']['id'], off_camera, match_id))
    except Exception as e:
        print(f"Error inserting bad behaviour event {event['id']}: {e}")


def insert_50_50(cursor, event, match_id):
    try:
        location = None
        if 'location' in event and event['location'] is not None:
            x, y = event['location']
            location = f"({x}, {y})"

        event_timestamp = event.get('timestamp')
        if event_timestamp:
            hours, minutes, seconds = event_timestamp.split(':')
            event_timestamp = f"{int(hours):02}:{int(minutes):02}:{float(seconds):06.3f}"

        under_pressure = event.get('under_pressure', None)
        counterpress = event.get('counterpress', None)
        out = event.get('out', None)

        insert_query = """
            INSERT INTO fifty_fifty (
                id, index, period, timestamp, minute, seconds, event_type_id, 
                possession, possession_team_id, play_pattern_id, team_id, player_id, 
                position_id, location, duration, under_pressure, outcome_id, counterpress, 
                out, match_id
            ) VALUES (
                %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
            )
            ON CONFLICT (id) DO NOTHING;
        """

        cursor.execute(insert_query, (
            event['id'], event['index'], event['period'], event_timestamp, event['minute'], event['second'],
            event['type']['id'], event['possession'], event['possession_team']['id'], event['play_pattern']['id'],
            event['team']['id'], event['player']['id'], event['position']['id'], location,
            event['duration'], under_pressure, event['50_50']['outcome']['id'], counterpress,
            out, match_id))

    except Exception as e:
        print(f"Error inserting 50_50 event {event['id']}: {e}")


def insert_ball_recovery(cursor, event, match_id):
    try:
        location = None
        if 'location' in event and event['location'] is not None:
            x, y = event['location']
            location = f"({x}, {y})"

        event_timestamp = event.get('timestamp')
        if event_timestamp:
            hours, minutes, seconds = event_timestamp.split(':')
            event_timestamp = f"{int(hours):02}:{int(minutes):02}:{float(seconds):06.3f}"

        under_pressure = event.get('under_pressure', None)
        out = event.get('out', None)
        recovery_failure = event.get('ball_recovery', {}).get('recovery_failure', None)
        offensive_recovery = event.get('ball_recovery', {}).get('offensive', None)
        off_camera = event.get('off_camera', None)

        insert_query = """
        INSERT INTO Ball_recoveries (id, index , period ,timestamp , minute , second , event_type_id , possession , possession_team_id , play_pattern_id , team_id , player_id , position_id , location , duration , under_pressure , out , recovery_failure , offensive_recovery , off_camera ,  match_id )
        VALUES (%s, %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
        ON CONFLICT (id) DO NOTHING;
        """

        cursor.execute(insert_query, (
            event['id'], event['index'], event['period'], event_timestamp, event['minute'], event['second'],
            event['type']['id'], event['possession'], event['possession_team']['id'], event['play_pattern']['id'],
            event['team']['id'], event['player']['id'], event['position']['id'], location, event['duration'],
            under_pressure, out,
            recovery_failure, offensive_recovery, off_camera, match_id))
    except Exception as e:
        print(f"Error inserting ball recovery event {event['id']}: {e}")


def insert_card(cursor, card):
    try:
        insert_query = """
        INSERT INTO card_types (card_type_id, card_type_name)
        VALUES (%s,%s)
        ON CONFLICT (card_type_id) DO NOTHING;
        """

        cursor.execute(insert_query, (card['id'], card['name']))
    except Exception as e:
        print(f"Error inserting card {card['id']}: {e}")


def insert_height(cursor, height):
    try:
        insert_query = """
        INSERT INTO pass_heights (height_id, height_name) 
        VALUES (%s, %s)
        ON CONFLICT (height_id) DO NOTHING;
        """

        cursor.execute(insert_query, (height['id'], height['name']))
    except Exception as e:
        print(f"Error inserting height {height['id']}: {e}")


def insert_position_into_database(cursor, position):
    try:
        insert_query = """
        INSERT INTO Positions (position_id, position_name)
        VALUES (%s, %s)
        ON CONFLICT (position_id) DO NOTHING;
        """

        cursor.execute(insert_query, (position['id'], position['name']))
    except Exception as e:
        print(f"Error inserting position {position['id']}: {e}")


def insert_body_part(cursor, body_part):
    try:
        insert_query = """
        INSERT INTO event_body_parts (body_part_id,body_part_name)
        VALUES (%s, %s)
        ON CONFLICT (body_part_id) DO NOTHING;
        """

        cursor.execute(insert_query, (body_part.get('id'), body_part.get('name')))
    except Exception as e:
        print(f"Error inserting outcome {body_part.get('id')}: {e}")


def insert_technique(cursor, technique):
    try:
        insert_query = """
        INSERT INTO event_techniques(technique_id, technique_name)
        VALUES (%s, %s)
        ON CONFLICT (technique_id) DO NOTHING;
        """

        cursor.execute(insert_query, (technique.get('id'), technique.get('name')))
    except Exception as e:
        print(f"Error inserting technique {technique.get('id')}: {e}")


def insert_event_type_into_database(cursor, event_type):
    try:
        insert_query = """
        INSERT INTO Event_types(event_type_id, event_type_name)
        VALUES (%s, %s)
        ON CONFLICT (event_type_id) DO NOTHING;
        """

        cursor.execute(insert_query, (event_type['id'], event_type['name']))
    except Exception as e:
        print(f"Error inserting event type {event_type['id']}: {e}")


def insert_play_pattern_into_database(cursor, play_pattern):
    try:
        insert_query = """
        INSERT INTO Play_Patterns(play_pattern_id, play_pattern_name)
        VALUES (%s, %s)
        ON CONFLICT (play_pattern_id) DO NOTHING;
        """

        cursor.execute(insert_query, (play_pattern['id'], play_pattern['name']))
    except Exception as e:
        print(f"Error inserting play pattern {play_pattern['id']}: {e}")


# def insert_tactics(cursor, event_id, tactics):
#     try:
#         formation = tactics.get('formation')
#         if formation:
#             insert_query = """
#             INSERT INTO Tactics (event_id, formation)
#             VALUES (%s, %s)
#             """
#             cursor.execute(insert_query, (event_id, formation))
#     except Exception as e:
#         print(f"Error error inserting tactics {event_id}: {e}")


def insert_outcomes(cursor, outcome):
    try:
        insert_query = """
        INSERT INTO event_outcomes (outcome_id, outcome_name)
        VALUES (%s, %s)
        ON CONFLICT (outcome_id) DO NOTHING;
        """

        cursor.execute(insert_query, (outcome.get('id'), outcome.get('name')))
    except Exception as e:
        print(f"Error inserting outcome {outcome.get('id')}: {e}")


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
            create_tables(cur)
            conn.commit()

        for comp_id, seasons in competitions_seasons.items():
            comp_dir = os.path.join(matches_dir, str(comp_id))
            for season_id in seasons:
                match_ids = extract_match_ids_for_season(comp_dir, season_id)

                with conn.cursor() as cur:
                    load_event_types(cur, events_dir, match_ids)
                    load_events(cur, events_dir, match_ids)

                conn.commit()

                # with conn.cursor() as cur:
                #     load_tactics(cur, events_dir, match_ids)
                # conn.commit()


if __name__ == "__main__":
    main()
