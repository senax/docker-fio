all: .foo

.foo: Dockerfile
	docker build -t senax/docker-fio:latest .
	touch .foo

push:
	docker push senax/docker-fio:latest
