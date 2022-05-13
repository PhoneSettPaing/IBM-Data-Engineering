#!/bin/sh
# The above line tells the interpreter this code needs to be run as a shell script.
# This will be printed on to the screen. In the case of cron job, it will be printed to the logs.
echo "Pulling Database: This may take a few minutes"
# Create a backup
if mysqldump --all-databases --user=root --password="MjI3NzAtdmFzdGVy" > all-databases-backup.sql ; then
 echo 'Sql dump created'
else
 echo 'pg_dump return non-zero code No backup was created!'
 exit
fi
#Create a directory named after current date in tmp directory
mkdir -p /tmp/mysqldumps/$(date +%Y%m%d)
# Move backup file to tmp directory
mv  all-databases-backup.sql /tmp/mysqldumps/$(date +%Y%m%d)/