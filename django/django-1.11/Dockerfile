FROM python:3.6-alpine

ENV PYTHONUNBUFFERED 1

COPY requirements.txt requirements.txt

RUN apk update \
  # psycopg2 dependencies
  && apk add --no-cache gcc python3-dev musl-dev \
    postgresql-dev jpeg-dev zlib-dev freetype-dev lcms2-dev \
    openjpeg-dev tiff-dev tk-dev tcl-dev libffi-dev py-cffi \
  # add django group and user
  && addgroup -S django && adduser -S -G django django \
  # install requirements
  && pip install --no-cache-dir -r requirements.txt \
  && rm -rf requirements.txt && rm -rf /var/lib/apt/lists/

CMD ["python3"]
