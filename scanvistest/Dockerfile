FROM python:3.6.6

ENV PYTHONUNBUFFERED 1

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt --index-url=https://mirrors.aliyun.com/pypi/simple/ --no-cache-dir

CMD ["python"]