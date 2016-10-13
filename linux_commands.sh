# after install
sudo apt-get update && sudo apt-get dist-upgrade
sudo apt-get install ubuntu-restricted-extras
sudo apt-get remove --purge thunderbird rhythmbox

sudo ufw enable
sudo ufw allow ssh
sudo ufw limit ssh
sudo ufw allow Samba


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

