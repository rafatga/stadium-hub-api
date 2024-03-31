# ✨ Stadium Hub Api

- [Environment](##environment)
- [Installation](##installation)
- [Starting Project](##Starting)
- [Deploy](##deploy)


## Environments
- http://api.stadium-hub.loc (traefik proxy local)
- http://api.stadium-hub.loc:8077 (local)

## Installation
### System requirements
- Docker

### Local docker installation:
- (Step 1) -> Clone project
```
git clone -b develop https://github.com/rafatga/stadium-hub-api
```
- (Step 2) -> host config
```
[mac] -> /etc/hosts
[ubuntu] -> /etc/hosts
[windows] -> C:\Windows\system32\drivers\etc\hosts

127.0.0.1       api.stadium-hub.loc
```
- (Step 3) -> Build docker image
```
make bootup
```
- (Step 4) -> Database config (make sure this match .env variables)
```
Host: 127.0.0.1
Database: stadium-hub-api
Username: boss
Password: root
Port: 3307
```

## Starting Project (Without traefik proxy)
### [1] Start project
```
make start
```
### [2] Stop project
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

## TODO
- Add CI/CD with GitHub Actions 
- Config PhpStorm debugger