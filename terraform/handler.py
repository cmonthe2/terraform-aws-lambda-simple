import os
import json
import uuid
import boto3

s3 = boto3.client('s3')
ddb = boto3.client('dynamodb')

SRC_BUCKET = os.environ.get('SRC_BUCKET')
DDB_TABLE = os.environ.get('DDB_TABLE')

def handler(event, context):
    key = f"test-{uuid.uuid4()}.txt"
    s3.put_object(Bucket=SRC_BUCKET, Key=key, Body=b"hello from lambda")
    ddb.put_item(TableName=DDB_TABLE, Item={'id': {'S': key}, 'note': {'S': 'replication test'}})
    return { "statusCode": 200, "body": json.dumps({'key': key}) }
