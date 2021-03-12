#!/bin/sh

_DIR="$(dirname "$0")"

source "$_DIR/config.sh"

#Get 2nd level domain with tld
DOMAIN=$(expr match "$CERTBOT_DOMAIN" '.*\.\(.*\..*\)')

if [ -f $_DIR/$CERTBOT_DOMAIN ]; then
        RECORD_ID=$(cat $_DIR/$CERTBOT_DOMAIN)
        rm -f $_DIR/$CERTBOT_DOMAIN
fi

# Remove the challenge TXT record from the zone
if [ -n "${RECORD_ID}" ]; then

    RESULT=$(curl -s -X POST "https://pddimp.yandex.ru/api2/admin/dns/del" \
     -H "PddToken: $API_KEY" \
     -d "domain=$DOMAIN&record_id=$RECORD_ID")

fi
