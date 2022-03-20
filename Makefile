WORKDIR_PATH=/nerf
REPO_PATH:=$(dir $(abspath $(firstword $(MAKEFILE_LIST))))
OUTPUT_PATH=${REPO_PATH}/.output
IMAGE_TAG=pvphan/nerf:0.1
RUN_FLAGS = \
	--rm \
	--volume=${REPO_PATH}:${WORKDIR_PATH}:ro \
	--volume=${REPO_PATH}/data:${WORKDIR_PATH}/data:ro \
	--volume=${OUTPUT_PATH}:/tmp/output \
	--runtime=nvidia \
	${IMAGE_TAG}

shell: image downloaddata
	docker run -it ${RUN_FLAGS} \
		bash

image:
	docker build --tag ${IMAGE_TAG} .

downloaddata:
	./downloaddata.sh

