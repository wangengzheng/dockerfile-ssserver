FROM alpine:latest

ENV VERSION 1.0

RUN apk update -y && \
    apk add py-pip && \
    pip install --upgrade pip && \
    pip install shadowsocks && \     
    #fix https://github.com/shadowsocks/shadowsocks/issues/646
    sed -i "s/EVP_CIPHER_CTX_cleanup/EVP_CIPHER_CTX_reset/g" /usr/lib/python2.7/site-packages/shadowsocks/crypto/openssl.py
    
    

ENTRYPOINT ["/usr/bin/ssserver","--log-file=/var/log/shadowsocks.log"]
