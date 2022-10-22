FROM ubuntu
RUN apt update && \
    apt install curl --yes && \
    apt install vim --yes
