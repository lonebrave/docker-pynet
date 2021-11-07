FROM nickhasser/pydev

LABEL maintainer Nick Hasser <nick.hasser@gmail.com>

COPY requirements.txt ./requirements.txt

RUN pip install -r requirements.txt

CMD ["/bin/sh"]
