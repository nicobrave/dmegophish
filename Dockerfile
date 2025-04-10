FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

COPY . /app

# Limpia y actualiza primero las listas de paquetes
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get update --fix-missing --allow-releaseinfo-change -o Acquire::Check-Valid-Until=false

# Instala las dependencias necesarias
RUN apt-get install -y --no-install-recommends openssl ca-certificates nginx && \
    chmod +x ./gophish ./start.sh && \
    rm -rf /var/lib/apt/lists/*

# Copia la configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["./start.sh"]
