FROM alpine:3.7

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

RUN apk add --no-cache python3 python3-dev gcc musl-dev

WORKDIR /app
COPY . /app

RUN pip3 install --no-cache -r /app/requirements.txt
ENTRYPOINT ["python3", "post_app.py"]

