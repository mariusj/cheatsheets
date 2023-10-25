

git config --global user.email "mariusz.jakubowski.79@gmail.com"
git config --global user.name "Mariusz Jakubowski"


git stash
git pull
git stash apply




# start/stop x server
sudo systemctl stop lightdm.service
sudo systemctl start lightdm.service



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



sudo apt install traceroute iotop
