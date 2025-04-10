FROM debian:bullseye-slim

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y openssl ca-certificates nginx && \
    chmod +x ./gophish && \
    chmod +x ./start.sh && \
    rm -rf /var/lib/apt/lists/*

# Copia la configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["./start.sh"]
