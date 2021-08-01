# ghost-now
Host a ghost blog in minutes with automated DB backups(Docker, S3, Mailgun, Mysql, nginx)

This repository is a template for self hosting docker ghost blog.
- Uses docker for ghost deployment.
- Uses Mysql as database.
- Amazon S3 for storing images/content and db backups.
- Mailgun for mailing services.
- Nginx as reverse proxy.

## Requirements
- [X] Docker 
- [X] Docker compose
- [X] AWS CLI version 2 for backups([installation](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)).
- [X] AWS s3 buckets one for storage and one for backup. AWS access key and secret with s3 access.
- [X] Mailgun account(For mailing services).

## Ghost Setup
Installing and running this template is very simple.

- Clone this repository.
- Setup the ghost enviornment variables in docker-compose.yml
- Now for starting ghost and other services. Simply run:

        sudo bash start.sh

## Backup Setup
Once the ghost server is running you can setup backups for ghost's db (Mysql in this case).

- Setup this repository path in backup.sh.
  - Example: If the repo was cloned in home(linux) just replace the variable repositorypath in backup.sh with ~/ghost-now or /home/USER/ghost-now
- Replace the backup s3 bucket name in backup.sh.
- Setup a cronjob for automated backups.
    Open crontab:

        crontab -e

    And paste:

        0 0 * * * bash ~/ghost/backup.sh 2>&1 | logger -t mysql-backup
    
    This would take backups at 12 midnight every day. You can configure the execution intervals for the cron job if you want to increse or decrease backup frequency.
-  You can check if there are any errors with cronjob with: 
        
        grep 'mysql-backup'  /var/log/syslog

    This command will filter your cron job outputs.
> TIP -  you can increase the frequency of cron jobs while testing by replacing the crontab line with this:
>
>           * * * * * bash ~/ghost/backup.sh 2>&1 | logger -t mysql-backup
>This would run every minute and it would be easier to debug if there are any errors.

## Questions?

[Open an Issue](https://github.com/avy-sha/ghost-now/issues/new) and let's chat!