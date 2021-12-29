build: 
	docker build -t pgweb:latest .

run:
	docker run -d --name pgweb -p 8081:8081 pgweb:latest

all: build run 