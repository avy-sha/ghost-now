#!/bin/bash

# Replace the repositorypath value below with ghost-now path
repositorypath=/path/to/ghost-now
PATH="/usr/local/bin:$PATH"
backupfilename="ghost_prod-$(date +%Y%m%d).sql.gz"
sudo docker exec mysql /bin/bash -c "mysqldump --password=root db | gzip > /backups/$backupfilename"
aws s3 cp $repositorypath/mysql-backups/$name s3://S3_BACKUP_BUCKET/