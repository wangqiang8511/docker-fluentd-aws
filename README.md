# Fluentd image with s3, kinesis plugin

Fluentd docker image with s3, kinesis plugin


# How to use

## Build Image

```bash
make docker
```

## Config

Modify hack/set-default.sh.tmpl to hack/setup-default.sh

## Run

```bash
hack/start_fluentd_container.sh
```
