from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def hello():
    print("Hello from StaffordMediaConsulting DAG!")

with DAG(dag_id="hello_world", start_date=datetime(2025,7,2), schedule_interval="@daily") as dag:
    PythonOperator(
        task_id="say_hello",
        python_callable=hello
    )
