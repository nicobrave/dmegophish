FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app
COPY . /app

# Paso 1: Limpia y actualiza la lista de paquetes con opciones para evitar problemas de caducidad
RUN rm -rf /var/lib/apt/lists/* && apt-get clean && \
    apt-get update --fix-missing --allow-releaseinfo-change -o Acquire::Check-Valid-Until=false

# Paso 2: Instala las dependencias necesarias y otorga permisos
RUN apt-get install -y --no-install-recommends openssl ca-certificates nginx && \
    chmod +x ./gophish ./start.sh && \
    rm -rf /var/lib/apt/lists/*

# Copia la configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["./start.sh"]
