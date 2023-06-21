from sqlalchemy import Column, String
from sqlalchemy.ext.declarative import declarative_base
from pydantic import BaseModel

Base = declarative_base()


class Record(Base):
    __tablename__ = 'birdcallsa'
    id = Column(String, primary_key=True)
    gen = Column(String)
    sp = Column(String)
    en = Column(String)
    cnt = Column(String)
    loc = Column(String)
    lat = Column(String)
    lng = Column(String)
    alt = Column(String)
    type = Column(String)
    file = Column(String)
    filename = Column(String)
    sono = Column(String)
    osci = Column(String)
    quality = Column(String)
    date = Column(String)
    length = Column(String)


class RecordIn(BaseModel):
    id: str
    gen: str
    sp: str
    en: str
    cnt: str
    loc: str
    lat: str
    lng: str
    alt: str
    type: str
    file: str
    filename: str
    sono: str
    osci: str
    quality: str
    length: str
    date: str


class RecordOut(BaseModel):
    id: str
    gen: str
    sp: str
    en: str
    cnt: str
    loc: str
    lat: str
    lng: str
    alt: str
    type: str
    file: str
    filename: str
    sono: str
    osci: str
    quality: str
    length: str
    date: str
