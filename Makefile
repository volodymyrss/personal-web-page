build:
	docker build . -t volodymyrsavchenko/personalsite


run:
	docker run -p 8000:80 volodymyrsavchenko/personalsite
