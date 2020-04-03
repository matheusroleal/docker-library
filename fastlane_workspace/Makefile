image=matheusroleal/fastlane-workspace:v1

build:
	docker build . -t ${image} -f Dockerfile

run: 
	docker run -it ${image} /bin/bash

publish:
	docker push ${image}
