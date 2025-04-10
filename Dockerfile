FROM debian:bullseye-slim

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y openssl ca-certificates && \
    chmod +x ./gophish && \
    chmod +x ./start.sh && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3333
EXPOSE 80

CMD ["./start.sh"]
