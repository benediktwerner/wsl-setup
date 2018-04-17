# My WSL Setup

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
Adjust `.bash_aliases` according to the directory structure.

## Adjust `.bashrc`
Append the contents of the repositories `.bashrc` file.

## Install stuff
- GPG
