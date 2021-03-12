# certbot-dns-yandex

These shell scripts can be used to obtain Letsencrypt certificates for 3rd level domain, delegated to Yandex.

Requirements
============

* certbot
* curl
* jq
* Yandex Connect account

Usage
=====

1) rename config.sh.examlpe to config.sh
2) put your Yandex Connect API key into config.sh
3) put your domain name into renew.sh
4) run renew.sh
5) wait for 20 minutes