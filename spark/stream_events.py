import os
from streaming_functions import *
from schema import schema

# Kafka Topics
LISTEN_EVENTS_TOPIC= "listen_events"
PAGE_VIEW_EVENTS_TOPIC = "page_view_events"
AUTH_EVENTS_TOPIC = "auth_events"

KAFKA_PORT = "9092"

KAFKA_ADDRESS = os.getenv("KAFKA_ADDRESS", 'localhost')
GCP_GCS_BUCKET = os.getenv("GCP_GCS_BUCKET", 'streaming-project-1123')
GCS_STORAGE_PATH = f'gs://{GCP_GCS_BUCKET}'
