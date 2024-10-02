import datetime
import logging
import traceback
import os
import azure.functions as func
from azure.common.credentials import ServicePrincipalCredentials
from azure.mgmt.compute import ComputeManagementClient
from shared.holiday_check import is_holiday

from msrestazure.azure_exceptions import CloudError


def main(mytimer: func.TimerRequest) -> None:

    if is_holiday():
        logging.info("Today is a holiday. Skipping VM start operation.")
        return

    azure_subscription = os.environ["AZURE_SUBSCRIPTION_ID"]
    resource_group_name = os.environ["VM_RESOURCE_GROUP"]
    tenant_id = os.environ["AZURE_TENANT_ID"]
    client_id = os.environ["AZURE_CLIENT_ID"]
    client_secret = os.environ["AZURE_CLIENT_SECRET"]
    vm_name = os.environ["VM_NAME"]

    credential = ServicePrincipalCredentials(
        client_id=client_id,
        secret=client_secret,
        tenant=tenant_id
    )

    utc_timestamp = datetime.datetime.utcnow().replace(
        tzinfo=datetime.timezone.utc).isoformat()

    compute_client = ComputeManagementClient(credential, azure_subscription)

    try:
        logging.info('\nStart VM')
        async_vm_start = compute_client.virtual_machines.start(
            resource_group_name, vm_name)
        async_vm_start.wait()
    except CloudError:
        logging.info('Start VM operation failed:\n{}'.format(traceback.format_exc()))
    else:
        logging.info('Start VM operation completed successfully!')
        logging.info(f"Python timer trigger function ran {utc_timestamp}")
