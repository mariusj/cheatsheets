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
cat /etc/os-release
uname -a

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

# what listens on 80 port
lsof -i :80 | grep LISTEN

# cop ssh file to server
ssh-copy-id user@host
ssh-copy-id -i ~/.ssh/mykey user@host
