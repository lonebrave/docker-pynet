NAME = nickhasser/pynet
DATE = $(shell date -I)
LOCALDIR = `pwd`

default: build

clean:
	docker image rm $(NAME)

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

update-req:
	sed -e 's/==.*//' ../pydev/requirements.txt > pydev_req_nover.txt
	sed -e 's/==.*//' requirements.txt > pynet_req_nover.txt
	grep -v -f pydev_req_nover.txt pynet_req_nover.txt > requirements.txt
	rm pydev_req_nover.txt pynet_req_nover.txt
