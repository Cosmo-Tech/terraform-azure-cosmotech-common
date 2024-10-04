import datetime
import logging
import requests
import os
import azure.functions as func
from azure.identity import DefaultAzureCredential
from shared.holiday_check import is_holiday


def main(mytimer: func.TimerRequest) -> None:

    if is_holiday():
        logging.info("Today is a holiday. Skipping POWERBI resume operation.")
        return

    azure_subscription = os.environ["AZURE_SUBSCRIPTION_ID"]
    resource_group_name = os.environ["POWERBI_RESOURCE_GROUP"]
    powerbi_name = os.environ["POWERBI_NAME"]
    tenant_id = os.environ["AZURE_TENANT_ID"]

    credential = DefaultAzureCredential()
    token = credential.get_token(
        "https://management.azure.com/.default",
        tenant_id=tenant_id
        )

    utc_timestamp = datetime.datetime.utcnow().replace(
        tzinfo=datetime.timezone.utc).isoformat()

    headers = {
        'Authorization': f'Bearer {token.token}',
        "Content-Type": "application/json",
    }

    route = (f'https://management.azure.com/subscriptions/{azure_subscription}/resourceGroups/{resource_group_name}/'
             f'providers/Microsoft.PowerBIDedicated/capacities/{powerbi_name}/resume?api-version=2021-01-01')

    try:
        response = requests.post(url=route, headers=headers)
    except Exception as e:
        logging.error(f"Request failed: {e}")
        return
    else:
        if response.status_code != 202:
            logging.error("An error occured")
        else:
            logging.info(f"Python timer trigger function ran {utc_timestamp}")
            logging.info(f"Successfully resumed {powerbi_name} instance "
                         f"in resource group {resource_group_name}")