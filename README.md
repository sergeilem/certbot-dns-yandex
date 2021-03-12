# certbot-dns-yandex

These shell scripts can be used to obtain Letsencrypt certificates for 3rd level domain, delegated to Yandex.

Requirements
============

* certbot
* curl
* [jq](https://github.com/stedolan/jq)
* Yandex Connect account
* Yandex Connect API key, get it here: https://pddimp.yandex.ru/api2/admin/get_token

Dependencies installation
=========================

Alpine linux:
```shell
apk add certbot curl jq
```
CentOS 8:
```
dnf install certbot curl jq
```

Usage
=====

1) Rename config.sh.examlpe to config.sh.
2) Put your domain name into config.sh.
3) Put your Yandex Connect API key into config.sh.
4) Run renew.sh.
5) Wait for 20 minutes.
