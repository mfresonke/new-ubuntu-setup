### UPS Setup

[Good Guide](https://opensource.com/article/21/12/linux-apcupsd)

`sudo apt install apcupsd`
`sudo vim /etc/apcupsd/apcupsd.conf`
Comment out `DEVICE` (needs to autodetect)

### Drive Spindown Setup

See capabilites of drive (may wake it up) - look: `sudo hdparm -I /dev/sdc` 
See status (on/off) of drive: `sudo hdparm -C /dev/sdc`

`sudo vim /etc/hdparm.conf`

```
/dev/disk/xxxx {
    spindown_time = 240
}
```