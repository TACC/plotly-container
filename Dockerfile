FROM python:3.7-slim

ENV PYTHONUNBUFFERED=TRUE

EXPOSE 8050

WORKDIR /app
COPY ./requirements.txt /app

RUN pip install -r requirements.txt

COPY . /app

CMD ["gunicorn", "--preload", "-w 16", "-b :8050",  "-t 200", "app:server"]
