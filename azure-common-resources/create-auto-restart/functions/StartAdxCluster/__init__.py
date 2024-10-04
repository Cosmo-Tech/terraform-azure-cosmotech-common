import datetime
import logging
import os
import json
import azure.functions as func
from azure.identity import DefaultAzureCredential
from azure.mgmt.kusto import KustoManagementClient
from shared.holiday_check import is_holiday


def main(startadxtimer: func.TimerRequest) -> None:

    if is_holiday():
        logging.info("Today is a holiday. Skipping ADX start operation.")
        return

    SUBSCRIPTION_ID = os.environ["AZURE_SUBSCRIPTION_ID"]
    ADX_CLUSTERS_CONFIG = json.loads(os.environ["ADX_CLUSTERS_CONFIG"])
    # ADX_CLUSTERS_CONFIG=[{"cluster_name": "cluster1", "resource_group": "group1"}, {"cluster_name": "cluster2", "resource_group": "group2"}, ...]

    client = KustoManagementClient(credential=DefaultAzureCredential(), subscription_id=SUBSCRIPTION_ID)

    utc_timestamp = datetime.datetime.utcnow().replace(
        tzinfo=datetime.timezone.utc).isoformat()
    
    for cluster_config in ADX_CLUSTERS_CONFIG:
        resource_group = cluster_config['resource_group']
        cluster_name = cluster_config['cluster_name']
        
        poller = client.clusters.begin_start(
            resource_group_name=resource_group,
            cluster_name=cluster_name,
        )
        if poller.done():
            logging.info(f"Started Kusto Cluster {cluster_name} in {resource_group}...")

    logging.info(f"Python timer trigger function ran at {utc_timestamp}")
