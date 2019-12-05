FROM python:3.7-alpine3.10

ENV PYTHONUNBUFFERED 1

RUN echo http://mirrors.ustc.edu.cn/alpine/v3.10/main > /etc/apk/repositories \
  && echo http://mirrors.ustc.edu.cn/alpine/v3.10/community >> /etc/apk/repositories \
  && apk update \
  # psycopg2 dependencies
  && apk add --no-cache --virtual build-deps gcc python3-dev musl-dev \
  && apk add --no-cache postgresql-dev \
  # Pillow dependencies
  && apk add --no-cache jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev \
  # CFFI dependencies
  && apk add --no-cache libffi-dev py-cffi \
  && addgroup -S django \
  && adduser -S -G django django \
  # netifaces dependencies
  && apk add --no-cache linux-headers

ONBUILD COPY ./requirements.txt requirements.txt
ONBUILD COPY ./requirements requirements

ONBUILD COPY ./packages /app/packages

ONBUILD ARG COMPILE=-1 

ONBUILD ARG PIP_INDEX_URL=https://mirrors.aliyun.com/pypi/simple

ONBUILD RUN pip install --no-cache-dir \
    --index-url=$PIP_INDEX_URL \
    -r requirements.txt \
  && rm -rf /app/packages

ONBUILD COPY . /app

ONBUILD COPY ./scripts /scripts

ONBUILD RUN chown -R django:django /scripts && chown -R django:django /app \
        && chmod -R +x /scripts && COMPILE_CODES=$COMPILE sh /scripts/build.sh 
        # apk del build-deps

ONBUILD USER django

WORKDIR /app

ENTRYPOINT ["/scripts/entrypoint"]
