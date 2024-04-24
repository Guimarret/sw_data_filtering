import re
import pandas as pd
import json
import httpx
import logging
import numpy as np

def process_item(item):
    url_numeric_part = re.findall(r'\d+', item['url'])[0]
    item['url'] = url_numeric_part
    return item

def get_data(api_urls:list):

    for api in api_urls:
        init = []
        i = 1
        while i < 10:
            api_url = f"https://swapi.dev/api/{api}?page={i}"
            req = httpx.get(api_url, verify=False).json()
            try:
                raw = req["results"]
                init.append(raw)
            except:
                pass
            i+=1

        flattened_data = []
        for sublist in init:
            for item in sublist:
                processed_item = process_item(item)
                flattened_data.append(processed_item)
        df = pd.DataFrame(flattened_data)

        try:
            s3_url = f"s3://dev-data-mesh/data/sw_data_{api}/sw_data_{api}.parquet" 
            df.to_parquet(s3_url, compression='snappy')
            logging.info(f"Sucessful ingestion on {s3_url}") 
        except Exception as err:
            logging.error('Exception was thrown in connection %s' % err)
    return
