#!/bin/bash
rm ~/.wgetrc

unset HTTPS_PROXY
unset https_proxy
unset HTTP_PROXY
unset http_proxy
unset FTP_PROXY
unset ftp_proxy
unset no_proxy
unset ALL_PROXY

rm ~/.curlrc
