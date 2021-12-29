build: 
	docker build -t deb-pgweb:latest .

run:
	docker run -d --name deb-pgweb -p 8081:8081 deb-pgweb:latest

all: build run 