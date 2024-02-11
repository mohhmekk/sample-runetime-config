.PHONY: clean

DEPLOYMENT_ENV?=dev
DOCKER_IMAGE=sample-react-config-image
DOCKER_CONTAINER=sample-react-config-container

init: dist

clean:clean-container clean-image
	rm -rf out \
	rm -rf build \
	rm -rf node_modules

dist:
	mkdir -p out

clean-container:
	docker rm -f ${DOCKER_CONTAINER} || exit 0 ;

clean-image:
	docker rmi ${DOCKER_IMAGE} || exit 0 

build: clean dist docker-build

docker-build: clean
	docker build -t ${DOCKER_IMAGE} . ; \
	docker create --name ${DOCKER_CONTAINER} -p 80:80 -e DEPLOYMENT_ENV=$(DEPLOYMENT_ENV) ${DOCKER_IMAGE}

run: clean-container
	docker run --name ${DOCKER_CONTAINER} -p 80:80 -e DEPLOYMENT_ENV=$(DEPLOYMENT_ENV) ${DOCKER_IMAGE}
