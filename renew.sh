#!/bin/sh

_DIR="$(dirname "$0")"
source "$_DIR/config.sh"

certbot certonly -d $YOUR_DOMAIN \
--agree-tos --renew-by-default --manual \
--manual-auth-hook $_DIR/authenticator.sh \
--manual-cleanup-hook $_DIR/cleanup.sh \
--preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory \
--register-unsafely-without-email
