#!/usr/bin/env sh

EVENT_TAG=${EVENT_TAG:-razer.**}
AWS_REGION=${AWS_REGION:-us-east-1}

sed -i "s/AWS_KEY_ID/$AWS_KEY_ID/g" /etc/td-agent/td-agent.conf
sed -i "s#AWS_SEC_KEY#$AWS_SEC_KEY#g" /etc/td-agent/td-agent.conf
sed -i "s#EVENT_TAG#${EVENT_TAG}#g" /etc/td-agent/td-agent.conf
sed -i "s#AWS_REGION#${AWS_REGION}#g" /etc/td-agent/td-agent.conf
sed -i "s#S3_BUCKET#${S3_BUCKET}#g" /etc/td-agent/td-agent.conf
sed -i "s#KINESIS_STREAM_NAME#${KINESIS_STREAM_NAME}#g" /etc/td-agent/td-agent.conf
sed -i "s#KINESIS_PARTITION_KEY#${KINESIS_PARTITION_KEY}#g" /etc/td-agent/td-agent.conf

/usr/sbin/td-agent "$@"
