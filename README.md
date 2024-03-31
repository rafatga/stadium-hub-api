# ✨ Stadium Hub Api

- [Environment](#environment)
- [Installation](#installation)
- [Deploy](#deploy)


## Environments
- http://stadium-hub-api.loc (local)
- http://stadium-hub-api.loc:9011 (local)

## Installation

### System requirements
- Php 8.2
- Php (exif, bcmath, gd, xsl, intl, gettext, zip, opcache, pdo_mysql) extension

### Local docker installation:
- Clone project
```
git clone -b develop https://github.com/rafatga/stadium-hub-api
```
- (Step 0)
```
[mac] -> /etc/hosts
[ubuntu] -> /etc/hosts
[windows] -> C:\Windows\system32\drivers\etc\hosts

127.0.0.1       stadium-hub-api.loc
```
- (Step 1)
```
make bootup
```
- (Step 2)
```
make start
```
- (Step 3)
```
Host: 127.0.0.1
Database: stadium-hub-api
Username: boss
Password: root
Port: 3307
```
- (Step 4) (optional)
```
make enter -> it-code-1
```
- (Step 7)
```
make open | browser -> http://stadium-hub-api.loc:9011
```
- (Step 8)
```
make stop
```

## Deploy
- This is an example of how I usually deploy my php projects
- - (Step 1)
```
Configure Configure SSH Key-Based Authentication on your server
example -> https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server
```
- (Step 2)
```
Merge develop into main branch
```
- (Step 3)
```
run command in your local machine
make deploy
```