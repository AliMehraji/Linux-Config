#! /bin/bash

docker run -d -p 54678:9000 -p 54678:9000/udp --name ssr --restart=always -v /etc/shadowsocks-r:/etc/shadowsocks-r teddysun/shadowsocks-r
