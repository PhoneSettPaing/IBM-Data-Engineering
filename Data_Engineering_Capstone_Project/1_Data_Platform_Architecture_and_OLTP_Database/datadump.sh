#!/bin/sh
# The above line tells the interpreter this code needs to be run as a shell script.

# This will be printed on to the screen. In the case of cron job, it will be printed to the logs.
echo "Pulling Database: This may take a few minutes"
# Create a backup
if mysqldump --user=root --password='NzQzNS12YXN0ZXJz' sales sales_data > sales_data.sql ; then
 echo 'sales_data.sql created'
else
 echo 'Error sales_data.sql was not created!'
 exit
fi