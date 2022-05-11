NAME = nickhasser/pynet
DATE = $(shell date -I)
LOCALDIR = `pwd`

default: build

build:
	docker build -t $(NAME):$(DATE) .

build-latest:
	docker build -t $(NAME) .

push:
	docker push $(NAME):$(DATE)

push-latest:
	docker push $(NAME)

debug:
	docker run --rm -it -v $(LOCALDIR):/tmp/hostdir $(NAME) /bin/bash

run:
	docker run --rm $(NAME)

release: build push

release-latest: build-latest push-latest
