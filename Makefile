WIN_SRC_PATH=C:\Users\dealmaha\Documents\dev\src
SSH_KEY_PATH=C:\Users\dealmaha\.ssh
SSH_KEY_NAME=id_rsa
IMAGE_NAME=dev
CONTAINER_NAME=dev_cntr

build:
	docker build -t $(IMAGE_NAME) .

bgrun:
	docker run --name $(CONTAINER_NAME) --rm -it -d -v $(WIN_SRC_PATH):/app/src $(IMAGE_NAME) /bin/bash

cpy-ssh:
	docker cp $(SSH_KEY_PATH) $(CONTAINER_NAME):/root/.ssh
	docker exec $(CONTAINER_NAME) chmod 700 /root/.ssh/$(SSH_KEY_NAME)

attach:
	docker exec -it $(CONTAINER_NAME) bash

run: bgrun cpy-ssh attach

rm-cntr:
	docker rm $(CONTAINER_NAME)
