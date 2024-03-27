import psycopg

def main():
    try: 
        conn = psycopg.connect(dbname="Project", user="postgres", password="postgres", host="localhost", port="5432")
    except psycopg.Error as e:
        print(f"Error running sql command: {e}")
        exit()
    

if __name__ == "__main__": 
    main()