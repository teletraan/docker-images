build-go111-ub18:
	docker build -t teletraan/golang:1.11-ubuntu18.04 ./go/ubuntu18.04

push-go111-ub18: build-go111-ub18
	docker push teletraan/golang:1.11-ubuntu18.04

build-go111-ub16:
	docker build -t teletraan/golang:1.11-ubuntu16.04 ./go/ubuntu16.04

push-go111-ub16: build-go111-ub16
	docker pusu teletraan/golang:1.11-ubuntu16.04