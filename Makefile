include VERSION

all: docker

docker: 
	docker build -t $(IMAGE):$(TAG) .
