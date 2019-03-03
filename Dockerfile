FROM sensu/sensu

RUN apk add curl
COPY http_check.sh /usr/local/bin/http_check.sh
COPY file_check.sh /usr/local/bin/file_check.sh
