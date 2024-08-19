# set wget proxies
cat << EOT >> ~/.wgetrc
http_proxy=http://webproxy.ext.ti.com:80
https_proxy=http://webproxy.ext.ti.com:80
ftp_proxy=http://webproxy.ext.ti.com:80
no_proxy=ti.com
EOT

# set proxies for http and https access
export HTTPS_PROXY=http://webproxy.ext.ti.com:80
export https_proxy=http://webproxy.ext.ti.com:80
export HTTP_PROXY=http://webproxy.ext.ti.com:80
export http_proxy=http://webproxy.ext.ti.com:80
export FTP_PROXY=http://webproxy.ext.ti.com:80
export ftp_proxy=http://webproxy.ext.ti.com:80
export no_proxy=ti.com
export ALL_PROXY=http://webproxy.ext.ti.com:80

# proxy for "curl"
echo "proxy=http://webproxy.ext.ti.com:80" > ~/.curlrc

# Set proxy for apt-get
#sudo echo "Acquire::http::proxy \"http://webproxy.ext.ti.com:80\";" > /etc/apt/apt.conf.d/proxy.conf

