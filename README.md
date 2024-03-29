# Python Developer Environment

This project is made to quickly set up a docker container with ssh access to collab on a python project.

## Connection

To use the environment, you need to know the it's ip, port, username, and password.

Come up with rememberable server alias, create a config for the server, run keygen on your machine and send it to a server, using this scripts:

> Linux Bash

```bash
mkdir -p ~/.ssh
ssh-keygen -t rsa
echo "Host [SERVER_ALIAS]\n  HostName [SERVER_IP]\n  User [SERVER_USER]\n  Port [PORT]" >> ~/.ssh/config
cat ~/.ssh/id_rsa.pub | ssh [SERVER_ALIAS] 'mkdir -p ~/.ssh; cat >> ~/.ssh/authorized_keys'
```

> Windows Powershell

```ps1
mkdir $env:USERPROFILE\.ssh -ea 0
ssh-keygen -t rsa
Add-Content -Path "$env:USERPROFILE\.ssh\config" -Value "Host [SERVER_ALIAS]`n  HostName [SERVER_IP]`n  User [SERVER_USER]`n  Port [PORT]`n"
cat $env:userprofile\.ssh\id_rsa.pub | ssh [SERVER_ALIAS] 'mkdir -p ~/.ssh; cat >> ~/.ssh/authorized_keys'
```

Now you can easily connect to your environment using `ssh [SERVER_ALIAS]`.

## Setup

In order to run the environment, you need to have [docker](https://docs.docker.com/engine/install/) installed on your target server (server that will handle your development environment).

> TODO write setup instructions
