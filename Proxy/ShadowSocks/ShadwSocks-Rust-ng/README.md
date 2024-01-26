# ShadowSocks-Rust Guide

To get a Secure Password For every encryption method in config file use below:

> $ ssserver --help </br>
> -m, --encrypt-method <ENCRYPT_METHOD>
          > Server's encryption method [possible values: plain, none, aes-128-gcm, aes-256-gcm, chacha20-ietf-poly1305,
          > 2022-blake3-aes-128-gcm, 2022-blake3-aes-256-gcm, 2022-blake3-chacha20-poly1305]

```bash
ssservice genkey -m "aes-128-gcm"
```

Generated Password: copy and paste it in your server config file for `password`:

> Ky81bdd7q9k8hkQ1M8bp0Q==

## Server

Config File at `/etc/shadowsocks-rust/config.json`

```conf
{
    "server":"0.0.0.0",
    "server_ipv6":"::",
    "server_port":9000,
    "password":"Ky81bdd7q9k8hkQ1M8bp0Q==",
    "timeout":300,
    "method":"aes-256-gcm",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "fast_open":true,
    "obfs":"http_simple",
    "workers": 3
}
```

### Run Server via Docekr Container 

Notice:

> Enable IPV6 to Docker be able to use IPV6 , [Docker IPV6](https://docs.docker.com/config/daemon/ipv6/#use-ipv6-for-the-default-bridge-network)

```bash
docker pull teddysun/shadowsocks-rust
```

```bash
docker run -d -p 54679:9000 -p 54679:9000/udp --name ss-rust --restart=always -v /etc/shadowsocks-rust:/etc/shadowsocks-rust teddysun/shadowsocks-rust
```

## Client 

I rather not to use docker images as client, rather to install the `shadowsocks-rust` manually

### Cargo Installation

For RHEL (Fedora/Centos/OpenSuse , ...)

```bash
dnf install cargo
```

Or

```bash
yum install cargo
```

For Debian (debian/ubuntu , ...)

```bash
apt install cargo
```

### ShadowSocks-Rust installation

```bash
cargo install shadowsocks-rust
```

in case of Filterring use [ProxyChains-ng](https://github.com/rofl0r/proxychains-ng) for `cargo` command

> Config file for proxy chains is at `/etc/proxychains.conf`
> at the end of the file (ProxyList Section)
> add a proxy server to be able to use proxychains and install cargo packages 

```conf
[ProxyList]
# add proxy here ...
# meanwile
# defaults set to "tor"
#socks4 	127.0.0.1 9050
socks5 	127.0.0.1 10808
```

```bash
cargo install shadowsocks-rust
```

After installation , you must add `cargo` bin directory in to your `PATH`, So edit your `~/.bashrc` and add below line : 

```conf
export PATH=$HOME/.cargo/bin:$PATH
```

### Client config

place the Client config file  somewhere in your home mine is `~/ShadowSocks-rust/config.json`

```conf
{
    "server":"Your-Server-IP",
    "server_port":54679,
    "local_address": "0.0.0.0",
    "local_port":10808,
    "password":"Ky81bdd7q9k8hkQ1M8bp0Q==",
    "method":"aes-256-gcm",
    "fast_open": true,
    "obfs":"http_simple",
}
```

Run Client via `sslocal` executor 

```bash
sslocal --config $HOME/ShadowSocks-rust/config.json -d
```

Or  You Can add an alias for it in your `~/.bashrc`

```bash
alias shadowrust="sslocal --config $HOME/ShadowSocks-rust/config.json -d"
```

All is Done.

Links:

- [Config Format](https://shadowsocks.org/doc/configs.html)
- [Docker image](https://hub.docker.com/r/teddysun/shadowsocks-rust)
- [shadowsocks-rust github](https://github.com/shadowsocks/shadowsocks-rust)

Plugins:

- [Xray-plugin](https://github.com/teddysun/xray-plugin)
- [V2ray-Plugin](https://github.com/teddysun/v2ray-plugin)