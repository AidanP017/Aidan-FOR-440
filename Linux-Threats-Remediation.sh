# Remediation of users
sudo userdel svc_backup
sudo userdel admin_temp
sudo userdel webadmin


# Remediation of groups
sudo groupdel remoteadmins
sudo groupdel backupoperators_custom


# Remediation of network ports
sudo systemctl stop 209108
sudo kill -9 209108

sudo systemctl stop 209111
sudo kill -9 209111

sudo systemctl stop 209114
sudo kill -9 209114 

sudo rm /var/run/listener_4444.pid
sudo rm /var/run/listener_8888.pid
sudo rm /var/run/listener_31337.pid


# Remediation of services
sudo systemctl stop system-update-custom
sudo systemctl disable system-update-custom
sudo rm /etc/systemd/system/system-update-custom.service
sudo rm /opt/system_services/update_service.sh
sudo rmdir /opt/system_services
sudo systemctl daemon-reload


# Remediation of tasks
sudo pkill -f system_maintenance.sh
sudo rm /opt/scheduled_tasks/system_maintenance.sh
sudo pkill -f data_backup.sh
sudo rm /opt/scheduled_tasks/data_backup.sh


# Remediation of processes
sudo kill -9 209188
sudo rm -f /opt/updater/suspicious_updater.sh

sudo kill -9 209189
sudo rm -f /opt/collector/data_collector.sh

sudo rm /var/run/suspicious_updater.pid
sudo rm /var/run/data_collector.pid


# Remediation of files
sudo rm /tmp/system_config.txt
sudo rm /opt/credentials.txt


# Remediation of SUIDs
sudo chmod u-s /tmp/find_backup
sudo rm /tmp/find_backup


# Remediation of history of malicious commands
sudo rm /root/.bash_history

# Remediation of artifact log
sudo rm /home/champuser/Downloads/ThreatHuntingLab_Artifacts.txt
