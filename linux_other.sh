# other apps

sudo apt install git golang


# mp3 tag editor
sudo apt install puddletag picard

# kodi
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:team-xbmc/ppa
sudo apt-get update
sudo apt-get install kodi

sudo apt install kodi-audioencoder-lame kodi-audioencoder-flac
sudo apt install kodi-visualization-goom kodi-visualization-projectm kodi-visualization-shadertoy xbmc-visualization-fishbmc

cd /usr/lib/x86_64-linux-gnu/addons
sudo mv visualization.* /usr/lib/kodi/addons/

sudo adduser --disabled-password --disabled-login --gecos "" kodi
sudo usermod -a -G cdrom,audio,video,plugdev,users,dialout,dip,input,netdev  kodi



create a new service file under /etc/systemd/system, call it kodi.service and copy the following code into the file: 
==============
[Unit]
Description = Kodi Media Center

# if you don't need the MySQL DB backend, this should be sufficient
After = systemd-user-sessions.service network.target sound.target

# if you need the MySQL DB backend, use this block instead of the previous
# After = systemd-user-sessions.service network.target sound.target mysql.service
# Wants = mysql.service

[Service]
User = kodi
Group = kodi
Type = simple
#PAMName = login # you might want to try this one, did not work on all systems
ExecStart = /usr/bin/xinit /usr/bin/dbus-launch --exit-with-session /usr/bin/kodi-standalone -- :0 -nolisten tcp vt7
Restart = on-abort
RestartSec = 5

[Install]
WantedBy = multi-user.target
==============


systemctl start kodi

systemctl stop kodi


sudo apt-get install xserver-xorg-legacy
sudo dpkg-reconfigure xserver-xorg-legacy

# and choose "Anyone". You'll also need edit the file /etc/X11/Xwrapper.config and add the following to a new line at the end of the file:

needs_root_rights=yes

sudo systemctl enable kodi




#### DOCKER


sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install docker-engine
sudo groupadd docker
sudo usermod -aG docker $USER
sudo service docker start
sudo docker run hello-world
sudo systemctl enable docker

sudo nano /etc/default/ufw
# set
DEFAULT_FORWARD_POLICY="ACCEPT"

sudo ufw reload
sudo ufw allow 2375/tcp


###### VIRTUALBOX


echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" | sudo tee /etc/apt/sources.list.d/docker.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install virtualbox-5.1
sudo apt-get install dkms



###### auto turn off & wake up
sudo crontab -e

0 2 * * * /usr/sbin/rtcwake -m off -s 18000




# torrent
sudo apt-get install rtorrent
cp /usr/share/doc/rtorrent/rtorrent.rc ~/.rtorrent.rc
nano .rtorrent.rc

sudo adduser --disabled-password --disabled-login --gecos "" rtorrent   
sudo usermod -a -G plugdev,users,input,netdev,media  rtorrent           

sudo nano /etc/systemd/system/rtorrent.service



sudo cp ~/.rtorrent.rc /home/rtorrent/
sudo chown rtorrent /home/rtorrent/.rtorrent.rc
sudo chgrp rtorrent /home/rtorrent/.rtorrent.rc
systemctl --user enable rt
sudo systemctl --user enable rt
sudo systemctl --user enable rtorrent
sudo systemctl --user start rtorrent
sudo userdel rtorrent


sudo adduser --disabled-password  rtorrent
sudo systemctl --user start rtorrent
  

  
 