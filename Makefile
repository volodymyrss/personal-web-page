TAG=$(shell git describe --always --tags)


deploy: push
	helm upgrade personal-web-page . --set image.tag=$(TAG)


push: build
	docker push volodymyrsavchenko/personalsite:$(TAG)

build:
	docker build . -t volodymyrsavchenko/personalsite:$(TAG)


run:
	docker run -p 8080:80 volodymyrsavchenko/personalsite
