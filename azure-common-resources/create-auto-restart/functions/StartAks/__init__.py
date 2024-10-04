import datetime
import logging
import os
import azure.functions as func
from azure.identity import DefaultAzureCredential
from azure.mgmt.containerservice import ContainerServiceClient
from shared.holiday_check import is_holiday


def main(startakstimer: func.TimerRequest) -> None:

    if is_holiday():
        logging.info("Today is a holiday. Skipping AKS cluster start operation.")
        return
    
    SUBSCRIPTION_ID = os.environ["AZURE_SUBSCRIPTION_ID"]
    AKS_RESOURCE_GROUP = os.environ["AKS_RESOURCE_GROUP"]
    AKS_CLUSTER_NAME = os.environ["AKS_CLUSTER_NAME"]

    client = ContainerServiceClient(credential=DefaultAzureCredential(), subscription_id=SUBSCRIPTION_ID)
    
    utc_timestamp = datetime.datetime.utcnow().replace(
        tzinfo=datetime.timezone.utc).isoformat()
    
    poller = client.managed_clusters.begin_start(
        resource_group_name=AKS_RESOURCE_GROUP,
        resource_name=AKS_CLUSTER_NAME,
    )
    if poller.done():
        logging.info(f"Started AKS Cluster {AKS_CLUSTER_NAME}: {AKS_RESOURCE_GROUP}...")

    logging.info(f"Python timer trigger function ran {utc_timestamp}")
