FROM sensu/sensu

RUN apk add curl
RUN apk add bc
RUN apk add bash
COPY check-cpu.sh /usr/local/bin/check-cpu.sh
COPY check-mem.sh /usr/local/bin/check-mem.sh
