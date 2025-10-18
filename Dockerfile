FROM jrei/systemd-ubuntu:22.04

# Устанавливаем необходимые пакеты
RUN apt update && apt install -y vim bash sudo

# Создаём простую службу
COPY hello.service /etc/systemd/system/hello.service
COPY hello.timer /etc/systemd/system/hello.timer

# Активируем службу при старте контейнера
RUN systemctl enable hello.timer

# Запускаем systemd при старте контейнера
CMD ["/sbin/init"]
