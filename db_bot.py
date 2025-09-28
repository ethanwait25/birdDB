import mysql.connector
from mysql.connector import ClientFlag
from openai import OpenAI 
import os
import json
import random

class BirdDB:
    def __init__(self):
        self.setupConfig()
        self.setupDB()
        self.openAiClient = OpenAI(api_key=self.config["openaiKey"])

    def handle_query(self, userQuery):
        getSqlPrompt = " ".join([self.setupScript, self.promptConfig["getSqlPrompt"], userQuery])
        chatGptSqlResponse = self.getChatGptResponse(getSqlPrompt)
        sqlQuery = self.sanitizeSqlFromChatGpt(chatGptSqlResponse)
        # print(sqlQuery)

        cur = self.cnx.cursor()
        try:
            result = self.runSql(cur, sqlQuery)
        finally:
            cur.close()

        # print(result)
        getExplainedDataPrompt = self.promptConfig["explainDataPrompt"].format(userQuery, self.setupScript, sqlQuery, result)
        chatGptExplainedDataResponse = self.getChatGptResponse(getExplainedDataPrompt)
        
        return chatGptExplainedDataResponse

    def getChatGptResponse(self, message):
        stream = self.openAiClient.chat.completions.create(
            model="gpt-4o",
            messages=[{"role": "user", "content": message}],
            stream=True
        )

        responses = []
        for chunk in stream:
            if chunk.choices[0].delta.content is not None:
                responses.append(chunk.choices[0].delta.content)

        return "".join(responses)

    def sanitizeSqlFromChatGpt(self, value):
        gptStartSqlMarker = "```sql"
        gptEndSqlMarker = "```"
        if gptStartSqlMarker in value:
            value = value.split(gptStartSqlMarker)[1]
        if gptEndSqlMarker in value:
            value = value.split(gptEndSqlMarker)[0]
        return value

    def setupConfig(self):
        with open(self.getPath("config.json")) as config:
            self.config = json.load(config)
        with open(self.getPath("promptConfig.json")) as promptConfig:
            self.promptConfig = json.load(promptConfig)
    
    def setupDB(self):
        configPath = self.getPath("config.json")
        with open(configPath) as file:
            self.config = json.load(file)

        self.cnx = mysql.connector.connect(
            host=self.config["db_host"],
            user=self.config["db_user"],
            password=self.config["db_password"],
            client_flags=[ClientFlag.MULTI_STATEMENTS, ClientFlag.MULTI_RESULTS],
        )
        cur = self.cnx.cursor()
        
        with open(self.getPath("setup.sql"), encoding="utf-8") as setupFile:
            self.setupScript = setupFile.read()
        with open(self.getPath("setupData.sql"), encoding="utf-8") as setupDataFile:
            setupDataScript = setupDataFile.read()
        
        try:
            self.runSql(cur, self.setupScript)
            self.runSql(cur, setupDataScript)
            self.cnx.commit()
        finally:
            cur.close()

    def runSql(self, cur, sql: str):
        rows = []
        for result in cur.execute(sql, multi=True):
            if result.with_rows:
                rows.extend(result.fetchall())
        return rows

    def loop(self):
        self.clear_console()
        print(self.get_logo())
        print(self.get_bird_art())
        print("Welcome to BirdDB. Please enter a query.")

        while True:
            try:
                line = input(">>> ")
                if line.lower() in ('q', 'quit', 'exit'):
                    break

                response = self.handle_query(line)
                print(response)

            except KeyboardInterrupt as k:
                break
            except Exception as e:
                print(f"Error: {e}")

        print(self.get_goodbye())

    def clear_console(self):
        if os.name == "nt":
            _ = os.system("cls")
        else:
            _ = os.system("clear")

    def getPath(self, fname):
        fdir = os.path.dirname(__file__)
        return os.path.join(fdir, fname)

    def get_logo(self):
        with open("logo.txt") as file:
            return file.read()

    def get_bird_art(self):
        with open("bird_ascii.txt") as file:
            content = file.read()
            bird_ascii = [piece for piece in content.split('x') if piece != '']
            return random.choice(bird_ascii)
        
    def get_goodbye(self):
        return random.choice([
            "Owl be seeing you!",
            "Bye-bye birdie!",
            "Peck ya later!",
            "Time to duck out!",
            "Seagull later!",
            "Hatcha later.",
            "Let's flock again soon.",
            "Feather-well!",
            "Gotta fly!",
            "Over and owl-t.",
            "I'll be flamingoing now.",
            "Until nest time."
        ])
    
    def run(self):
        self.loop()

BirdDB().run()