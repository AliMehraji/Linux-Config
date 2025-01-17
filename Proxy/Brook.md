# [Brook](https://github.com/txthinking/brook) Server And Client

## Server

```bash
joker brook server --listen :<Brook-PORT> -p <Password>
```

## Client

### CLI

```bash
joker brook client -s <Server-IP>:<Server-Brook-PORT> -p <Password> --socks5 127.0.0.1:<Local-Socks5-Port>
```

### systemd service

```conf
[Unit]
Description=Brook Client Service
After=network.target nss-lookup.target network-online.target

[Service]
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE CAP_SYS_PTRACE CAP_DAC_READ_SEARCH
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE CAP_SYS_PTRACE CAP_DAC_READ_SEARCH
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/root/.nami/bin/brook --log /tmp/brook-socks5.log --tag wssserver:germany wssclient --wssserver wss://<domain>:<port> --password <Password> --tlsfingerprint chrome --socks5 0.0.0.0:10808
Restart=on-failure
RestartSec=10s
LimitNOFILE=infinity

[Install]
WantedBy=multi-user.target
```
