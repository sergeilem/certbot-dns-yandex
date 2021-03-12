#!/bin/sh

_DIR="$(dirname "$0")"

source "$_DIR/config.sh"

# Input: CERTBOT_DOMAIN, for example: "service.corp.com"
# Get 2nd level domain with tld, as in example: "corp.com"
DOMAIN=$(expr match "$CERTBOT_DOMAIN" '.*\.\(.*\..*\)')
# Get 3rd level domain (without 2nd and top level, as in example - "service")
THIRDLEVELDOMAIN=$(expr match "$CERTBOT_DOMAIN" '\(.*\)\..*\..*')
# Make acme subdomain, as in example - "_acme-challenge.service")
SUBDOMAIN="_acme-challenge.$THIRDLEVELDOMAIN"

# Create TXT record
echo "Run list domains for $DOMAIN"
curl -s -X POST "https://pddimp.yandex.ru/api2/admin/dns/add" \
  -H "PddToken: $API_KEY" \
  -d "domain=$DOMAIN&type=TXT&content=$CERTBOT_VALIDATION&ttl=60&subdomain=$SUBDOMAIN" > $_DIR/create.json

RECORD_ID=$(jq '.record.record_id' $_DIR/create.json)
echo "Found record ID: $RECORD_ID"
rm -f $_DIR/create.json

echo $RECORD_ID > $_DIR/$CERTBOT_DOMAIN

# Sleep to make sure the change has time to propagate over to DNS
echo "Sleep 20 minutes until DNS propagated...."
sleep 1200
exit
