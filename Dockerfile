FROM ubuntu

WORKDIR /opt/app
COPY . .
RUN apt update && apt install -y coreutils findutils jq sqlite3 build-essential make
RUN make build && make install

ENTRYPOINT [ "/bin/bash" ]