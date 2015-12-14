# new-ubuntu-setup
Commands/Scripts/Etc for setup of a new Ubuntu Machine

## Software Through Apt-Get
- `sudo apt-get update && sudo apt-get install -y git golang build-essentials htop tmux vim gdebi python-software-properties`
- `sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt-get autoremove && sudo update-grub`

## PPAs
### Git
- `sudo apt-add-repository ppa:git-core/ppa && sudo apt-get update && sudo apt-get install git`

### Oracle Java
- `sudo add-apt-repository ppa:webupd8team/java && sudo apt-get update`
- Install latest Java (at this time `sudo apt-get install oracle-java8-installer`)

## Outside Software
- [Google Chrome](https://www.google.com/chrome/browser/desktop/)
- [Atom](https://atom.io/)
- [Sublime](http://www.sublimetext.com/3)

# Preferences

## System Preferences Tasks
- Security & Privacy -> Search -> Uncheck Use Web

## Application Preferences
### Terminal
- Turn on infinite scrollback.

### Git
- Tell git who I am
- `git config --global user.email "max@fresonke.com"`
- `git config --global user.name "Max Fresonke"`
