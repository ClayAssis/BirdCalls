import requests
import json
import time
from tqdm import tqdm


def get_recordings():
    recordings = []
    page = 1
    url = f"https://xeno-canto.org/api/2/recordings?query=cnt:brazil&page={page}"
    response = requests.get(url)
    data = json.loads(response.text)
    num_pages = data['numPages']
    with tqdm(total=num_pages, desc='Loading recordings',
              bar_format='{desc}: {percentage:3.0f}%|{bar}| {n_fmt}/{total_fmt}', leave=False) as pbar:
        while True:
            url = f"https://xeno-canto.org/api/2/recordings?query=cnt:brazil&page={page}"
            response = requests.get(url)
            data = json.loads(response.text)
            if 'recordings' not in data:
                break
            page_recordings = data['recordings']
            recordings.extend(page_recordings)
            pbar.update(1)
            page += 1
            time.sleep(1)
    return recordings


def post_data(data):
    url = "http://127.0.0.1:8888/records_post/podekeyclay"
    headers = {'Content-type': 'application/json'}
    response = requests.post(url, data=json.dumps(data), headers=headers)
    return response


def send_recordings():
    recordings = get_recordings()
    print(len(recordings))
    for recording in tqdm(recordings):
        post_data({
            "id": str(recording["id"]),
            "gen": str(recording["gen"]),
            "sp": str(recording["sp"]),
            "en": str(recording["en"]),
            "cnt": str(recording["cnt"]),
            "loc": str(recording["loc"]),
            "lat": str(recording["lat"]),
            "lng": str(recording["lng"]),
            "alt": str(recording["alt"]),
            "type": str(recording["type"]),
            "file": str(recording["file"]),
            "filename": str(recording["file-name"]),
            "sono": str(recording["sono"]["full"]),
            "osci": str(recording["osci"]["large"]),
            "quality": str(recording["q"]),
            "length": str(recording["length"]),
            "date": str(recording["date"])
        })
        time.sleep(1)


if __name__ == "__main__":
    send_recordings()
