# Setup

```sh
# wsdd is the discovery feature for windows
sudo apt install samba avahi-daemon wsdd
sudo smbpasswd -a max
```

### PS2 Settings
```sh
# PS2 Settings
#client min protocol = CORE
#ntlm auth = yes
#client max protocol = NT1
#server max protocol = SMB3
#server min protocol = LANMAN1
#strict sync = no
#keepalive = 0
#allow insecure wide links = yes
# need to also disable any min protocols below
```