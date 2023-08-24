## [PProxy](https://pypi.org/project/pproxy/)

1. First You need to install it via `pip`
   ```
   pip3 install -U pproxy
   ```
2. Then Convert `Socks5` proxy to `http` Proxy
   ```
   pproxy -l http://0.0.0.0:8080 -r socks5://<Socks5-Server-IP>:<Socks-Server-Port> -v > $PWD/pproxy.log &
   ```