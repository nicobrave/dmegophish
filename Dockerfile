FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

COPY . /app

RUN apt-get update --fix-missing --allow-releaseinfo-change && \
    apt-get install -y --no-install-recommends openssl ca-certificates nginx && \
    chmod +x ./gophish && \
    chmod +x ./start.sh && \
    rm -rf /var/lib/apt/lists/*

# Copia la configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["./start.sh"]
