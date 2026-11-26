# Linux Automation Toolkit Runbook

## Health Check

Run:

./scripts/health_check.sh

Review:

logs/health_check.log

## Disk Monitoring

Run:

./scripts/disk_alert.sh

Review:

logs/disk_alert.log

## Service Monitoring

Run:

./scripts/service_check.sh nginx

Review:

logs/service_check.log

## Backup

Run:

./scripts/backup.sh

Review:

logs/backup.log

Backup files are stored under:

backups/

## Log Cleanup

Run:

./scripts/log_cleanup.sh

Review:

logs/log_cleanup.log

Cleanup is restricted to the designated lab directory.

## Cron

View scheduled tasks:

crontab -l

Check Cron service:

sudo systemctl status cron

Check Cron logs:

sudo grep CRON /var/log/syslog

## Troubleshooting

Check script permissions.

Check source directory paths.

Run scripts manually.

Use bash -x for debugging.

Check Cron logs and service logs.
