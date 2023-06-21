import os
from fastapi import FastAPI, HTTPException
from db import get_db
from models import Record, RecordIn, RecordOut
from dotenv import load_dotenv
from utils import send_recordings

app = FastAPI()
load_dotenv()
secret_key = os.getenv("SECRET_KEY")


@app.post("/records_post/{key}")
async def create_record(record: RecordIn, key: str):
    if key == secret_key:
        db = next(get_db())
        existing_record = db.query(Record).filter(Record.id == record.id).first()
        if existing_record:
            return {"message": "A record with this id already exists"}
        else:
            new_record = Record(
                id=record.id.encode(), gen=record.gen, sp=record.sp, en=record.en, cnt=record.cnt,
                loc=record.loc.encode("utf-8"), lat=record.lat, lng=record.lng, alt=record.alt,
                type=record.type, file=record.file, filename=record.filename,
                sono=record.sono, osci=record.osci, quality=record.quality,
                length=record.length, date=str(record.date),
            )
            db.add(new_record)
            db.commit()
            db.refresh(new_record)
            return RecordOut(
                id=new_record.id, gen=new_record.gen, sp=new_record.sp, en=new_record.en,
                cnt=new_record.cnt, loc=new_record.loc.encode("utf-8"), lat=new_record.lat, lng=new_record.lng,
                alt=new_record.alt, type=new_record.type, file=new_record.file,
                filename=new_record.filename, sono=new_record.sono, osci=new_record.osci,
                quality=new_record.quality, length=new_record.length, date=str(new_record.date)
            )
    else:
        return {"message": "You are not authorized to make requests"}


@app.get("/records/{key}/{record_id}")
async def read_record(record_id: str, key: str):
    if key == secret_key:
        db = next(get_db())
        record = db.query(Record).filter(Record.id == record_id).first()
        if record is None:
            raise HTTPException(status_code=404, detail="Record not found")
        return RecordOut(
            id=record.id, gen=record.gen, sp=record.sp, en=record.en, cnt=record.cnt,
            loc=record.loc.encode("utf-8"), lat=record.lat, lng=record.lng, alt=record.alt,
            type=record.type, file=record.file, filename=record.filename,
            sono=record.sono, osci=record.osci, quality=record.quality,
            length=record.length, date=str(record.date)
        )
    else:
        return {"message": "You are not authorized to make requests"}


@app.get("/records_get/{key}")
async def read_records(key: str):
    if key == secret_key:
        db = next(get_db())
        records = db.query(Record).all()
        return [RecordOut(
            id=record.id, gen=record.gen, sp=record.sp, en=record.en, cnt=record.cnt,
            loc=record.loc.encode("utf-8"), lat=record.lat, lng=record.lng, alt=record.alt,
            type=record.type, file=record.file, filename=record.filename,
            sono=record.sono, osci=record.osci, quality=record.quality,
            length=record.length, date=str(record.date)
        ) for record in records]
    else:
        return {"message": "You are not authorized to make requests"}


@app.delete("/records_delete/{key}/{record_id}")
async def delete_record(record_id: str, key: str):
    if key == secret_key:
        db = next(get_db())
        record = db.query(Record).filter(Record.id == record_id).first()
        if record is None:
            raise HTTPException(status_code=404, detail="Record not found")
        db.delete(record)
        db.commit()
        return {"message": "Record deleted successfully"}
    else:
        return {"message": "You are not authorized to make requests"}


@app.post("/records_update/{key}")
async def update_record(key: str):
    if key == secret_key:
        send_recordings()
    else:
        return {"message": "You are not authorized to make requests"}
