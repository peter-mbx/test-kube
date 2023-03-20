FROM ubuntu:22.04
SHELL ["/bin/bash", "--login", "-i", "-c"]

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHON_VERSION=3.10
ENV CONTAINER_PORT=8000
ENV WD=/home

RUN apt-get update -y && apt-get dist-upgrade -y && apt-get upgrade -y && apt-get install -y python$PYTHON_VERSION wget
RUN cd $WD && wget https://bootstrap.pypa.io/get-pip.py && python$PYTHON_VERSION get-pip.py && rm get-pip.py
COPY src/ $WD/
RUN cd $WD && pip install -r requirements.txt

WORKDIR $WD
EXPOSE $CONTAINER_PORT
CMD ["bash", "-c", "uvicorn main:app --host 0.0.0.0 --port $CONTAINER_PORT"]
