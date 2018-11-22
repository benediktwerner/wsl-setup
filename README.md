# My WSL Setup

## Setup script
You can also simply run the `setup.sh` script to get started.

## Silence the bell (at least sometimes ...)
```bash
echo 'set bell-style none' >> ~/.inputrc
```

## Get the newest git version
### Install git
```bash
add-apt-repository ppa:git-core/ppa
apt update
apt install git
```

### Configure git
1. Set name, email and key
2. Set line endings
3. Set gpgsign = true

## Copy dotfiles
```bash
cp dotfiles/* ~/
```
Adjust `.aliases` according to the directory structure.

## Adjust `.bashrc`
1. Append the contents of the repositories `.bashrc` file.
2. Comment out the "HISTSIZE=.." and "HISTFILESIZE=.." lines

## Install vagrant
1. Install VirtualBox on *Windows*
2. Download vagrant for *Debian* (64bit)
3. Install vagrant on *WSL*: `dpkg -i vagrant_..._64.deb`
4. Add VirtualBox to the path: `export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox`
5. Set `$VAGRANT_WSL_ENABLE_WINDOWS_ACCESS=1`

## Install MySQL / MariaDB
1. `zypper in mariadb mariadb-tools`
2. `sudo /usr/lib/mysql/mysql-systemd-helper install`
3. Ensure `/var/lib/mysql` is owned by the MySQL user
4. To start mysql if systemd is not available use the `start-mysql` alias from `.alias`

## GPG
1. `sudo zypper in pinentry`
2. `gpg2 --import <key-file>`
3. `gpg2 --import <secret-key-file>`

### To export keys
1. gpg2 -a --output gpg-key.asc --export
2. gpg2 -a --output gpg-secret-key.asc --export-secret-keys
