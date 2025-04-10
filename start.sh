#!/bin/bash
# Genera certificados auto-firmados si no existen y arranca Gophish

if [ ! -f gophish_admin.crt ] || [ ! -f gophish_admin.key ]; then
    openssl req -x509 -newkey rsa:4096 -nodes -out gophish_admin.crt -keyout gophish_admin.key -days 365 -subj "/CN=gophish"
fi

./gophish
