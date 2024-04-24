from utils import process_item, get_data
import logging

def lambda_handler(event, context):
    api_url = ["planets","films","people","species","starships","vehicles"]
    try:
        get_data(api_url)
    except Exception as err:
        logging.error('Exception was thrown in getting data %s' % err)
    return

lambda_handler(1,2)
