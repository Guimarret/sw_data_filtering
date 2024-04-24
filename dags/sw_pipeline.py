from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta
import boto3

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 4, 20),
    'e-mail': 'guimarret@gmail.com',
    'email_on_failure': True,
    'email_on_retry': False,
    'retries': 2,
    'retry_delay': timedelta(minutes=1),
}

dag = DAG(
    'lambda_caller',
    default_args=default_args,
    description='A DAG to call Lambda function every 5 minutes',
    schedule_interval='*/3 * * * *',
)

def call_lambda():
    client = boto3.client('lambda')
    response = client.invoke(FunctionName='lambda_pipeline_sw', InvocationType='RequestResponse')
    print("Calling Lambda function")

call_lambda_operator = PythonOperator(
    task_id='call_lambda_task',
    python_callable=call_lambda,
    dag=dag,
)
