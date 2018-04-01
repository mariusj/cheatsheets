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


git config --global user.email "mariusz.jakubowski.79@gmail.com"
git config --global user.name "Mariusz Jakubowski"


git stash
git pull
git stash apply

# Display all information about files/ directories
ls –al

# Show the path of current directory
pwd

# Create a directory
mkdir directory-name

# Forcefully remove directory recursively
rm -rf directory-name

# Copy dir1 to dir2
cp -r dir1 dir2

# Rename source to dest
mv file1 file2

# Create symbolic link to file-name
ln –s /path/to/file-name link-name 

# display all processes
ps aux

# change permission recursively
chmod -R u+x,g+w,o+r directory-name

# Change owner of the file
chown owner-user file
chown www-data:www-data file

# system information
uname -a

# start/stop x server
sudo systemctl stop lightdm.service
sudo systemctl start lightdm.service

# untar file
tar -xzvf file.tar.gz

# search
grep pattern files
find / -name 'index*'

# file transfer
scp file.txt server2:/tmp

# Synchronize source to destination
rsync -a /home/apps /backup/

# Show free space on mounted filesystems
df -h

# Mount a device
mount device-path mount-point


# install oracle java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default

# show CPU temperature
acpi -t


# install NFS share

sudo apt install nfs-common

sudo mount -t nfs server_name:/export/video /var/www/video
sudo umount /var/www/video/

# add this line to /etc/fstab 
# server_name:/export/video /var/www/video nfs rw 0 0

sudo mount -a


# nginx reload
sudo service nginx reload
systemctl status nginx.service


# what listens on 80 port
lsof -i :80 | grep LISTEN


# supervisor
sudo supervisorctl status
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl restart losowanie


journalctl -xe


# jira
sudo apt-get install postgresql postgresql-contrib

sudo -i -u postgres

createuser --interactive
createdb -E UNICODE -l C -T template0 jiradb

psql
GRANT ALL PRIVILEGES ON DATABASE jiradb TO jiradbuser;
alter user jiradbuser with password 'password';
\q

ln -s /etc/nginx/sites-available/jira /etc/nginx/sites-enabled/



