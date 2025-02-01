.PHONY: build

DOCKER_IMAGE=python_3.11
build:
	docker build -t $(DOCKER_IMAGE) .

extract:
	docker run -it -u 1000 --rm -v $(PWD):/app $(DOCKER_IMAGE) cp python3.11.9.zip /app/python3.11.9.zip

clean:
	docker rm $(DOCKER_IMAGE) -f
	docker system prune -f
	