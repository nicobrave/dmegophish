FROM alpine:3.18

WORKDIR /app

COPY . /app

RUN apk update && apk upgrade && \
    apk add --no-cache bash openssl ca-certificates && \
    chmod +x ./gophish && \
    chmod +x ./start.sh

EXPOSE 3333
EXPOSE 80

CMD ["./start.sh"]
