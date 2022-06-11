FROM ubuntu:20.04

ENV TZ=Europe
ENV PYTHONUNBUFFERED "1"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y python3-pip && \
    rm -rf /var/lib/apt/lists/*


COPY app /opt/app

WORKDIR /opt/app

RUN pip3 install -r requirements.txt

EXPOSE 8080

CMD ["gunicorn", "main:app", "--bind", "0.0.0.0:8080", "--workers", "4", "--timeout", "120"]