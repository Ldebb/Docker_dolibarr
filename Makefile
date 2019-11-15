all:


build:
	docker build -t dolibar .

run:   
	docker run -i -t -p 8080:80 dolibar
