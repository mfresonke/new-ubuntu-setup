# new-ubuntu-setup
Commands/Scripts/Etc for setup of a new Ubuntu Machine

## Add PPAs
### Git
- `sudo apt-add-repository ppa:git-core/ppa && sudo apt-get update`

### Oracle Java
- `sudo add-apt-repository ppa:webupd8team/java && sudo apt-get update`

## Install Command Line Software Through Apt-Get
- `sudo apt update && sudo apt install -y git build-essential htop tmux vim gdebi-core zsh xz-utils tree zip unzip pv`

## Other Cool, But Less Necessary Cmd Line Software
- `sudo apt install -y mosh golang hddtemp lm-sensors checkinstall pixz`
## Install GUI Software with Apt-Get
` sudo apt update && sudo apt install -y gparted gdebi vlc steam-installer`

## Setup [zsh](https://github.com/mfresonke/max-prezto-config)
tl;dr:
- run `zsh` and press (2)
- Blindly Run Commands:
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

## Setup CPU Sensors 
`sudo service kmod start && sudo sensors-detect`

## Upgrade Rest of System
- `sudo apt update && sudo apt full-upgrade -y && sudo apt remove --auto-remove -y && sudo update-grub`
- Additionally, if desired, you can add on `&& sudo reboot`

## Install Optional Software
### Oracle Java
- Install latest Java (at this time `sudo apt-get install oracle-java8-installer`)

## Outside Software
- [Google Chrome](https://www.google.com/chrome/browser/desktop/)
- [Atom](https://atom.io/)
- [Sublime](http://www.sublimetext.com/3)
- [Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
- [Skype](https://www.skype.com/en/get-skype/)

# Configuration

## Ubuntu Desktop
### Disable Automount
`gsettings set org.gnome.desktop.media-handling automount-open false`

## Set Swappiness For "Perceived Performance"
`sudo bash -c "echo 'vm.swappiness = 10' >> /etc/sysctl.conf" && sudo sysctl -p`

### System Preferences Tasks
- Security & Privacy -> Search -> Uncheck Use Web
- Software & Updates -> Updates -> 
   - Check for Updates: Daily
   - When there are Security Updates: Download and Install Automatically
   - Other Updates: Every Two Weeks (I hate being annoyed by the gui updater)

## Application Preferences
### Terminal
- Turn on infinite scrollback.

### Go
#### Configure $GOPATH and add progs to $PATH (hint: use .zshrc)
- `mkdir $HOME/go`
- `export GOPATH=$HOME/go`
- `export PATH=$PATH:$GOPATH/bin`
- New zsh config includes these. All have to do is create go folder in $HOME.

#### Obtain New(est) Version of Go ([Details](https://github.com/niemeyer/godeb))
- `go get gopkg.in/niemeyer/godeb.v1/cmd/godeb`
- `godeb list`
- (Find Version Desired)
- `godeb download <version>`
- `sudo apt-get purge -y golang && sudo apt-get autoremove -y`
- `sudo gdebi go-<version>.deb`

### Git
- Tell git who I am
- `git config --global user.email "m**@f******.com"`
- `git config --global user.name "Max Fresonke"`

### Atom
- Install `go-plus` package.

### Sublime
- Install [Package Manager](https://packagecontrol.io/installation)
