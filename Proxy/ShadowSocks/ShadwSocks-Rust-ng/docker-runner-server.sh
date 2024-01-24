#! /bin/bash

docker run -d -p 54679:9000 -p 54679:9000/udp --name ss-rust --restart=always -v /etc/shadowsocks-rust:/etc/shadowsocks-rust teddysun/shadowsocks-rust
