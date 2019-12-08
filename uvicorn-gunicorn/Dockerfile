FROM python:3.7-alpine3.10

ARG PIP_INDEX_URL=https://mirrors.aliyun.com/pypi/simple

RUN echo http://mirrors.ustc.edu.cn/alpine/v3.10/main > /etc/apk/repositories \
  && echo http://mirrors.ustc.edu.cn/alpine/v3.10/community >> /etc/apk/repositories \
  && apk update \
  && apk add --no-cache --virtual .build-deps gcc libc-dev make \
  && pip install uvicorn gunicorn --index-url=$PIP_INDEX_URL
    # && apk del .build-deps gcc libc-dev make

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

COPY ./gunicorn_conf.py /gunicorn_conf.py

COPY ./start-reload.sh /start-reload.sh
RUN chmod +x /start-reload.sh

COPY ./app /app
WORKDIR /app/

ENV PYTHONPATH=/app

EXPOSE 80

# Run the start script, it will check for an /app/prestart.sh script (e.g. for migrations)
# And then will start Gunicorn with Uvicorn
CMD ["/start.sh"]
