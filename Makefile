build-go111-ub18:
	docker build -t teletraan/golang:1.11-ubuntu18.04 ./go/ubuntu18.04

push-go111-ub18: build-go111-ub18
	docker push teletraan/golang:1.11-ubuntu18.04

build-go111-ub16:
	docker build -t teletraan/golang:1.11-ubuntu16.04 ./go/ubuntu16.04

push-go111-ub16: build-go111-ub16
	docker pusu teletraan/golang:1.11-ubuntu16.04

build-django-onbuild:
	docker build -t dcr.teletraan.io/public/django-onbuild:1.1.5 -f django/django-onbuild/Dockerfile .

build-django-simple-onbuild:
	docker build -t dcr.teletraan.io/public/django-simple-onbuild:0.1.0 -f django/django-simple-onbuild/Dockerfile .

build-uvicorn-gunicorn:
	docker build -t dcr.teletraan.io/public/uvicorn-gunicorn:python3.7-alpine3.10 -f uvicorn-gunicorn/Dockerfile ./uvicorn-gunicorn
