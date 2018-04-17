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
4. Download the git prompt script from `https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh`.

## Copy dotfiles
```bash
cp dotfiles/* ~/
```
Adjust `.bash_aliases` according to the directory structure.

## Adjust `.bashrc`
1. Append the contents of the repositories `.bashrc` file.
2. Comment out the "HISTSIZE=.." and "HISTFILESIZE=.." lines

## Install stuff
- GPG
