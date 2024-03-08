FROM nickhasser/pydev

LABEL maintainer Nick Hasser <nick.hasser@gmail.com>

COPY requirements.txt ./requirements.txt

RUN apt update && \
    apt upgrade -y && \
    apt install -y graphviz && \
    apt install -y libsnmp-dev && \
    pip install -r requirements.txt

CMD ["/bin/sh"]
