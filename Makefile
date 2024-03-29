TAG=$(shell git describe --always --tags)


deploy: push
	helm upgrade personal-web-page . --set image.tag=$(TAG)


push: build
	docker push volodymyrsavchenko/personalsite:$(TAG)

build:
	python src/build.py && cp -rfv src/images src/files src/styles build/html
	docker build . -t volodymyrsavchenko/personalsite:$(TAG)


run:
	docker run --rm --name ps -p 8080:80 volodymyrsavchenko/personalsite:$(TAG)


watch:
	inotify-hookable --watch-directories src/ -c 'python src/build.py && cp -rfv src/images src/files src/styles build/html'
