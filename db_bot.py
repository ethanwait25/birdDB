import mysql.connector
from mysql.connector import ClientFlag
import os
import json
import random

def handle_query(query):
    print(query)

def setup():
    fdir = os.path.dirname(__file__)
    def getPath(fname):
        return os.path.join(fdir, fname)
    
    configPath = getPath("config.json")
    with open(configPath) as file:
        config = json.load(file)

    cnx = mysql.connector.connect(
        host=config["db_host"],
        user=config["db_user"],
        password=config["db_password"],
        client_flags=[ClientFlag.MULTI_STATEMENTS, ClientFlag.MULTI_RESULTS],
    )
    cur = cnx.cursor()
    
    with open(getPath("setup.sql"), encoding="utf-8") as setupFile:
        setupScript = setupFile.read()
    with open(getPath("setupData.sql"), encoding="utf-8") as setupDataFile:
        setupDataScript = setupDataFile.read()
    
    try:
        _run_script(cur, setupScript)
        _run_script(cur, setupDataScript)
        cnx.commit()
    finally:
        cur.close()
        cnx.close()

def _run_script(cur, script: str):
    for result in cur.execute(script, multi=True):
        if result.with_rows:
            result.fetchall()

def loop():
    print(get_logo())
    print(get_bird_art())
    print("Welcome to BirdDB. Please enter a query.")

    while True:
        try:
            line = input(">>> ")
            if line.lower() in ('q', 'quit', 'exit'):
                break

            handle_query(line)

        except KeyboardInterrupt as k:
            break
        except Exception as e:
            print(f"Error: {e}")

    print("Bye!")

def get_logo():
    return ''' ____  _         _ _____  ____  
|  _ \(_)       | |  __ \|  _ \ 
| |_) |_ _ __ __| | |  | | |_) |
|  _ <| | '__/ _` | |  | |  _ < 
| |_) | | | | (_| | |__| | |_) |
|____/|_|_|  \__,_|_____/|____/
'''

def get_bird_art():
    with open("bird_ascii.txt") as file:
        content = file.read()
        bird_ascii = [piece for piece in content.split('x') if piece != '']
        return random.choice(bird_ascii)


if __name__ == "__main__":
    setup()
    loop()