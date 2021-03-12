#!/bin/sh

_DIR="$(dirname "$0")"

certbot certonly -d your-third-level-domain-here.your-second-level-domain-here.com \
--agree-tos --renew-by-default --manual \
--manual-auth-hook $_DIR/authenticator.sh \
--manual-cleanup-hook $_DIR/cleanup.sh \
--preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory \
--register-unsafely-without-email
