FROM golang:1.10.1-alpine

COPY install-dep.sh /app/install-dep.sh

RUN chmod +x /app/install-dep.sh && source /app/install-dep.sh

CMD ["go"]
