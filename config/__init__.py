from pydantic import BaseSettings


class CommonSettings(BaseSettings):
    APP_NAME: str = "FARM Intro"
    DEBUG_MODE: bool = True
    DB_URL = "mongodb://mongo_user:mongo_password@mongo:27017"
    # DB_URL = "mongodb://127.0.0.1:27017/?compressors=" \
    #          "disabled&gssapiServiceName=mongodb"
    # DB_NAME = "farmstack"


class ServerSettings(BaseSettings):
    HOST: str = "0.0.0.0"
    PORT: int = 4000


class DatabaseSettings(BaseSettings):
    DB_URL: str
    DB_NAME: str


class Settings(CommonSettings, ServerSettings, DatabaseSettings):
    pass


settings = Settings()
