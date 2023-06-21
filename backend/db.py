from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from models import Base
import os
from sqlalchemy.pool import QueuePool

# Create an engine to connect to the database
load_dotenv()
DATABASE_URL = database_url = os.getenv("DATABASE_URL")
engine = create_engine(DATABASE_URL, poolclass=QueuePool, pool_size=30, pool_timeout=50)
Base.metadata.create_all(bind=engine)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
