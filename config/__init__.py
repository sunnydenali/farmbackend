from pydantic import BaseSettings


class CommonSettings(BaseSettings):
    APP_NAME: str = "FARM Intro"
    DEBUG_MODE: bool = False


class ServerSettings(BaseSettings):
    HOST: str = "0.0.0.0"
    PORT: int = 4000


class DatabaseSettings(BaseSettings):
    DB_URL: str = "mongodb://mongo_user:mongo_password@127.0.0.1:27017"
    DB_NAME: str = "farmstack"


class Settings(CommonSettings, ServerSettings, DatabaseSettings):
    pass


settings = Settings()
