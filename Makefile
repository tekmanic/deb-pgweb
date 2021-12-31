all: build run 

build: 
	docker build -t deb-pgweb:latest .

run:
	docker run -d --name deb-pgweb -p 8081:8081 deb-pgweb:latest

clean:
	docker kill deb-pgweb
	docker rm -f deb-pgweb