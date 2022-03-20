WORKDIR_PATH=/nerf
REPO_PATH:=$(dir $(abspath $(firstword $(MAKEFILE_LIST))))
IMAGE_TAG=pvphan/nerf:0.1
RUN_FLAGS = \
	--rm \
	--volume=${REPO_PATH}:${WORKDIR_PATH} \
	--volume=${REPO_PATH}/data:${WORKDIR_PATH}/data:ro \
	--volume=${REPO_PATH}/logs:/tmp/logs \
	--volume=${REPO_PATH}/.output:/tmp/.output \
	--runtime=nvidia \
	${IMAGE_TAG}

shell: image downloaddata
	docker run -it ${RUN_FLAGS} \
		bash

image:
	docker build --tag ${IMAGE_TAG} .

downloaddata:
	./downloaddata.sh

