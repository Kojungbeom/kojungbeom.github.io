---
title:  Ubuntu 18.04 LTS 네트워크 설정
excerpt: Ubuntu 18.04 LTS 네트워크 설정
date: 2020-09-02 12:00:00
categories:
  - Ubuntu
tags:
  - Ubuntu
lastmod : 2020-09-02 12:00:00
---

# Ubuntu 18.04 LTS 네트워크 설정

### DNS 확인

```
$ nslookup server
$ nslookup
> server
```



### Hostname 설정

#### 설정파일로 변경

```
$ hostname
$ sudo vim /etc/hostname
$ sudo reboot
```

- hostname을 변경

#### 명령어로 변경하기

```
$ hostnamectl set-hostname "Host_name"
$ sudo reboot
```



### 고정 IP설정

```
$ sudo vim /etc/netplan/*.yaml
```

```
# Let NetworkManager manage all devices on this system
network:
  ethernets:
      enp0s31f6:
              dhcp4: no
              dhcp6: no
              #optional: true
              addresses: [192.x.x.x/xx]
              gateway4 : 192.x.x.x
              nameservers:
                      addresses: [8.8.8.8,8.8.4.4]

  version: 2
```

```
$ sudo netplan apply
$ ip addr
$ ip route
$ ifconfig
```

[서브넷 계산표](https://mani4u.tistory.com/88)



### 자동 IP설정

```
# Let NetworkManager manage all devices on this system
network:
    ethernets:
        enp0s3:
            addresses: []
            dhcp4: true
            optional: true
    version: 2
```

```
$ sudo netplan apply
$ ip addr
$ ip route
$ ifconfig
```



### Route 확인$ route -n

#### route

```
$ route
$ route -n
```

#### netstat -r

```
$ netstat -r

$ netstat -rn
```

#### ip

```
ip route list
```

