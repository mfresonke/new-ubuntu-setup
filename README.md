# new-ubuntu-setup

Commands/Scripts/Etc for setup of a new Ubuntu Machine

## Install Command Line Software Through Apt-Get

-   `sudo apt update && sudo apt install -y git build-essential htop tmux vim gdebi-core zsh xz-utils tree zip unzip pv`

## Other Cool, But Less Necessary Cmd Line Software

-   `sudo apt install -y mosh golang hddtemp lm-sensors checkinstall pixz`

## Install GUI Software with Apt-Get

` sudo apt update && sudo apt install -y gparted gdebi vlc steam-installer`

## Setup [zsh](https://github.com/mfresonke/max-prezto-config)

tl;dr:

-   run `zsh` and press (2)
-   Blindly Run Commands:

### Via SSH

```
rm -Rf ~/.z*
git clone --recursive git@github.com:mfresonke/max-prezto-config.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh
```

### Via HTTPS

```
rm -Rf ~/.z*
git clone --recursive https://github.com/mfresonke/max-prezto-config.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh
```

## Setup [vim](https://github.com/mfresonke/vim)

Clone the repo and Symlink .vimrc

### Via SSH

```
git clone git@github.com:mfresonke/vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

### Via HTTPS

```
git clone https://github.com/mfresonke/vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

## Upgrade Rest of System

-   `sudo apt update && sudo apt full-upgrade -y && sudo apt remove --auto-remove -y`
-   Additionally, if desired, you can add on `&& sudo reboot`

## Add Desired SSH Keys

Add Desired Keys

`mkdir ~/.ssh && vim ~/.ssh/authorized_keys`

```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP62moLa6Pod/0Y1TUsTgHMCS+nRAwNzfMbak9p1RjQ8 Max Pubkey
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIvJ3/ZQC1hlqJWWvF3rLZ6Z2drCO8cZFJsf7l1W6K/L Max Work Pubkey
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJYYJDuT934Iv6d8tJgpKDOKu1BzVI9EfpWXcU18yZmF Max iPhone Pubkey
```

Harden OpenSSH

`sudo vim /etc/ssh/sshd_config`

```
PasswordAuthentication no
# Only allow user max
AllowUsers max
MaxAuthTries 3
# If desired
X11Forwarding yes
```

## Setup Git

-   Tell git who I am
-   `git config --global user.email "m@f"`
-   `git config --global user.name "Max Fresonke"`

# Advanced Configuration

## Linux Server

### Setup Fail2Ban

`sudo apt install fail2ban -y`

Check /etc/fail2ban/jail.d/ to see if there are any distro defaults (ubuntu turns on ssh blocking by default)

For raspis/newer fail2ban installs (the ones that warn about 0.9.0)

`sudo vim /etc/fail2ban/jail.local` (new file)

```
[DEFAULT]

# needed for raspi
banaction = nftables-multiport
banaction_allports = nftables-allports

[sshd]
enabled = true
port    = ssh
maxretry = 6
findtime = 300
bantime = 3600
# Raspi opts - may not be needed
mode   = normal
backend = systemd
```

start er up

```
sudo systemctl start fail2ban
sudo systemctl enable fail2ban
```

check that it's working

```
sudo journalctl -xe | grep fail2ban
sudo fail2ban-client status sshd
```

### Unattended Upgrades

`sudo apt install unattended-upgrades -y`

things say to do this idk

`sudo dpkg-reconfigure --priority=low unattended-upgrades`

`sudo vim /etc/apt/apt.conf.d/50unattended-upgrades`

```
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-WithUsers "true";
Unattended-Upgrade::Automatic-Reboot-Time "02:00";
```

Test it out

`sudo unattended-upgrade -d -v --dry-run`

### DDNS

`sudo apt install ddclient`

`sudo vim /etc/ddclient.conf`

```
daemon=600 # check every 10 minutes
ssl=yes # use TLS
use=web # get IP with website below
web=ipify-ipv4

# Get a token here: https://dash.cloudflare.com
# Zone, DNS Read/Write
protocol=cloudflare, \
zone=domain.xyz, \
ttl=1,
password='APIKEY',
domain.xyz,sub.domain.xyz
```

## Linux Desktop

### Disable Automount

`gsettings set org.gnome.desktop.media-handling automount-open false`

## Development

Setup Go

-   `mkdir $HOME/go`

#### Obtain New(est) Version of Go ([Details](https://github.com/niemeyer/godeb))

-   `go get gopkg.in/niemeyer/godeb.v1/cmd/godeb`
-   `godeb list`
-   (Find Version Desired)
-   `godeb download <version>`
-   `sudo apt-get purge -y golang && sudo apt-get autoremove -y`
-   `sudo gdebi go-<version>.deb`v

# Helpful Commands

## Nmap to Find SSH Hosts

```sh
sudo nmap -sS --open -p 22 192.168.1.0/24
```
