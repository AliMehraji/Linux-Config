#### Direct SSH Tunnel To Server: 
```
ssh -p <Server-SSH-PORT> -CnfND 0.0.0.0:<Socks5-Port> <UserName>@<Server-IP>
```
#### Jump SSH Tunnel (Like Iran To Foreign Country)

Random-Socks5-Port: 65297 

```
ssh -qfCL 0.0.0.0:65297:localhost:65297 <UserName>@<Iran-Server-IP> -p <Iran-Server-SSH-PORT> -t ssh -qCfND localhost:65297 <USerName>@<Foreign-Server-IP> -p <Foreign-Server-SSH-PORT>
```

