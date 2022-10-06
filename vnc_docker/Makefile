.PHONY: build-vnc run-vnc

build-vnc:
	docker build -t vnc_docker .

run-vnc:
	docker run -d --name vnc -p 5900:5900 vnc_docker

