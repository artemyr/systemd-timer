CONTAINER_NAME=test-art-timer
IMAGE_NAME=ubuntu-systemd-demo

up: stop rm
	docker build -t ubuntu-systemd-demo .
	docker run -d --privileged --cgroupns=host -v /sys/fs/cgroup:/sys/fs/cgroup:rw --name $(CONTAINER_NAME) $(IMAGE_NAME)
	echo "🚀 Запустил контейнер $(CONTAINER_NAME)...";
	make in

down: stop rm

stop:
	@if [ "$$(docker ps -q -f name=$(CONTAINER_NAME))" ]; then \
		echo "🛑 Останавливаю контейнер $(CONTAINER_NAME)..."; \
		docker stop $(CONTAINER_NAME); \
	else \
		echo "Контейнер $(CONTAINER_NAME) не запущен."; \
	fi

rm:
	@if [ "$$(docker ps -a -q -f name=$(CONTAINER_NAME))" ]; then \
		echo "🗑 Удаляю контейнер $(CONTAINER_NAME)..."; \
		docker rm $(CONTAINER_NAME); \
	else \
		echo "Контейнер $(CONTAINER_NAME) не найден."; \
	fi

in:
	docker exec -it $(CONTAINER_NAME) bash