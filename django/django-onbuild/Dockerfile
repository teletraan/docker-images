FROM python:3.7.1-alpine3.8

ENV PYTHONUNBUFFERED 1

RUN echo http://mirrors.ustc.edu.cn/alpine/v3.8/main > /etc/apk/repositories \
  && echo http://mirrors.ustc.edu.cn/alpine/v3.8/community >> /etc/apk/repositories \
  && apk update \
  # psycopg2 dependencies
  && apk add --no-cache --virtual build-deps gcc python3-dev musl-dev \
  && apk add --no-cache postgresql-dev \
  # Pillow dependencies
  && apk add --no-cache jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev \
  # CFFI dependencies
  && apk add --no-cache libffi-dev py-cffi \
  && addgroup -S django \
  && adduser -S -G django django

ONBUILD COPY ./requirements /requirements

ONBUILD RUN pip install --no-cache-dir \
    --index-url=https://mirrors.aliyun.com/pypi/simple \
    -r /requirements/production.txt \
  && rm -rf /requirements

ONBUILD COPY . /app

ONBUILD COPY ./scripts /scripts

ONBUILD RUN chmod -R +x /scripts && chown -R django /scripts && sh /scripts/build.sh && apk del build-deps

ONBUILD USER django

WORKDIR /app

ENTRYPOINT ["/scripts/entrypoint"]