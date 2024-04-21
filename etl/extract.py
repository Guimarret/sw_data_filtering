import httpx
import time
import json
import pandas as pd
import io
import re

bucket = "bucket-medallion"
api_url = "https://swapi.dev/api/planets"

# req = httpx.get(api).json()
# raw = req.json()

init_df = []
i = 1
while i < 10:
    api_url = f"https://swapi.dev/api/planets?page={i}"
    req = httpx.get(api_url).json()
    try:
        raw = req["results"]
        init_df.append(raw)
    except:
        pass
    i+=1

df = pd.DataFrame.from_records(init_df)

file_execution_time = time.strftime("%d_%H_%M")
execution_year = time.strftime("%Y")
execution_month = time.strftime("%m")

# import boto3
# try:
#     s3 = boto3.resource("s3")
#     s3object = s3.Object(bucket, f"bronze/{execution_year}/{execution_month}/ingest_{file_execution_time}.json")
# except Exception as err:
#     logging.error('Exception was thrown in connection %s' % err)
# s3object.put(Body=(bytes(json.dumps(req.json()).encode("UTF-8"))))