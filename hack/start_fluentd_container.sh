#!/usr/bin/env sh

PROJECT_HOME="$(cd "$(dirname "$0")"/..; pwd)"

. $PROJECT_HOME/hack/setup-default.sh
. $PROJECT_HOME/VERSION

docker run -d \
	-e AWS_KEY_ID=$AWS_KEY_ID \
	-e AWS_SEC_KEY=$AWS_SEC_KEY \
	-e AWS_REGION=$AWS_REGION \
	-e EVENT_TAG=$EVENT_TAG \
	-e S3_BUCKET=$S3_BUCKET \
	-e KINESIS_STREAM_NAME=$KINESIS_STREAM_NAME \
	-e KINESIS_PARTITION_KEY=$KINESIS_PARTITION_KEY \
	--net=host \
	$IMAGE:$TAG
