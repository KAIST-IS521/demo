FROM debian:latest

# =========Install your package=========
COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
make \
gcc  \
xinetd
# ======================================

RUN mkdir -p /var/ctf
COPY flag /var/ctf/

# ======Build and run your service======
ADD /service /src
COPY echo_service /etc/xinetd.d/

RUN cd /src; make
WORKDIR /src

RUN echo "echo_service 4000/tcp" >> /etc/services

RUN service xinetd restart
ENTRYPOINT [ "xinetd", "-dontfork" ]
