FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends transmission-daemon

CMD ["/usr/bin/transmission-daemon", "-f", "-g", "/etc/transmission-daemon"]
