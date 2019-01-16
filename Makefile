all: .foo

.foo: Dockerfile
	docker build -t senax/docker-fio:latest .
	touch .foo

test:
	docker run --rm senax/docker-fio --size=10M --name=test

push:
	docker push senax/docker-fio:latest
