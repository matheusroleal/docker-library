image = matheusroleal/nodejs-workspace

build:
	docker build . -t ${image} -f Dockerfile

run: 
	docker run -it ${image} bash

publish:
	docker push ${image}
