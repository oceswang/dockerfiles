# OpenVPN Client docker container
Build commond:
```Bash
docker build . -t openvpn_client
```
start use below commond:
```Bash		
docker run -it --cap-add NET_ADMIN --cap-add NET_RAW --device=/dev/net/tun -v /data/openvpn/config:/usr/local/openvpn/config -v /data/openvpn/log:/usr/local/openvpn/log --name vpn openvpn_client
```		
