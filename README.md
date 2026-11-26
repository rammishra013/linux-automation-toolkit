# Linux Automation Toolkit

## Overview

This project automates common Linux administration
tasks using Bash scripting.

## Objectives

- Monitor server health
- Monitor disk usage
- Check Linux service status
- Automate backups
- Clean old files in a designated test directory
- Schedule automation using Cron

## Technologies

- Ubuntu Linux
- Bash
- Git
- GitHub
- Cron
- Tar
- Systemctl

## Project Structure

```text
linux-automation-toolkit/
├── scripts/
├── config/
├── logs/
├── backups/
├── docs/
├── tests/
├── README.md
└── .gitignore


Scripts
health_check.sh
Checks hostname, uptime, CPU load, memory and disk.

disk_alert.sh
Checks disk usage and generates a warning when the configured threshold is reached.

service_check.sh
Checks whether a specified Linux service is running.

backup.sh
Creates a timestamped compressed backup and validates the archive.

log_cleanup.sh
Removes eligible old files from the designated test directory based on retention settings.

Execution--------------------
./scripts/health_check.sh
./scripts/disk_alert.sh
./scripts/service_check.sh nginx
./scripts/backup.sh
./scripts/log_cleanup.sh


Automation
Cron is used to schedule periodic execution of the scripts.

Validation
- Script execution tested
- Disk alert condition tested
- Service failure tested
- Backup archive verified
- Restoration tested
- Cleanup behavior tested
- Cron execution verified

Security
- Generated logs and backups excluded from Git
- Scripts operate on designated lab directories
- No credentials stored in the repository
- Destructive cleanup restricted to the test directory

Future Improvements
- Email alert integration
- Slack alert integration
- Configurable thresholds
- Better exit-code handling
- JSON reporting
- Ansible integration
- Prometheus monitoring
