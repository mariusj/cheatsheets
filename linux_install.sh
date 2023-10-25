# after install
sudo apt-get update && sudo apt-get dist-upgrade
sudo apt-get install ubuntu-restricted-extras
sudo apt-get remove --purge thunderbird rhythmbox
sudo apt-get remove --purge gnome-mahjongg gnome-mines gnome-sudoku aisleriot
sudo apt-get remove --purge cheese
sudo apt-get remove --purge gnome-calendar
sudo apt-get autoremove

sudo apt install cups
sudo apt install lynx

sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt-get install oracle-java8-installer


sudo ufw enable
sudo ufw allow ssh
sudo ufw limit ssh
sudo ufw allow Samba

# cups
sudo ufw allow 631/tcp
sudo cupsctl --remote-any
sudo cupsctl --share-printers
sudo nano /etc/cups/cupsd.conf
sudo systemctl restart cups.service


# ZFS

# list disks
sudo ls -l /dev/disk/by-id

# create pool
sudo zpool create pool-big ata-Samsung_SSD_870_QVO_8TB_S5SSNF0W510365K
sudo zpool status

# create file system
sudo zfs create pool-big/nas
zfs list

# attach mirror
sudo zpool attach pool-big ata-Samsung_SSD_870_QVO_8TB_S5SSNF0W510365K ata-Samsung_SSD_870_QVO_8TB_S5SSNF0W510354H


# docker
sudo addgroup --system docker
sudo adduser --system --no-create-home --ingroup docker docker
sudo usermod -G docker -a `whoami`



# samba
sudo nano /etc/samba/smb.conf
sudo service smbd reload


# portainer
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

# jellyfin
sudo mkdir -p /srv/jellyfin/{config,cache}
docker pull jellyfin/jellyfin:latest
docker run -d -v /srv/jellyfin/config:/config -v /srv/jellyfin/cache:/cache -v /pool-big/nas:/media --net=host jellyfin/jellyfin:latest

cd /pool-big/nas/media-stack/torrent
mkdir {audio,books,,movies,music,podcasts,prowlarr,series,software}

cd /pool-big/nas/media-stack/usenet
mkdir audio books movies music podcasts prowlarr series software incomplete intermediate queue tmp scripts


docker-compose --file media-stack.yml --project-name media_stack --env-file docker-compose.env up

# minidlna
sudo vi /etc/minidlna.conf
sudo service minidlna force-reload
sudo service minidlna restart


# start at 7am

sudo crontab -e

0 2 * * * /usr/sbin/rtcwake -m off -s 18000

# monitor cpu temp
sensors
watch sensors

# disable suspend
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
