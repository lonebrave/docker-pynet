NAME = nickhasser/pynet

default: build

build:
	docker build -t $(NAME) .

push:
	docker push $(NAME)

debug:
	docker run --rm -it $(NAME) /bin/sh

run:
	docker run --rm $(NAME)

release: build push
