#!/bin/bash

# take backup of sshd
backup_sshd() {
    current_date=$(date +%d%b%Y)
    cp /usr/sbin/sshd "/usr/sbin/sshd_bkp_${current_date}"
}

#restore sshd binary from backup
restore_sshd() {
    cp -f /usr/sbin/sshd.bak /usr/sbin/sshd
}

# restart SSH service
restart_ssh() {
    /etc/init.d/ssh restart
}

# Function to display SSH version
display_ssh_version() {
    /usr/sbin/sshd -V
}

# clean apt cache
clean_apt_cache() {
    apt-get clean all
}

# update apt package
update_apt_packages() {
    apt-get update
}

# reinstall openssh-server package
reinstall_openssh_server() {
    apt-get --reinstall install openssh-server
}

# openssh-server packages
display_installed_openssh() {
    dpkg -l | grep openssh-ser
}

# restart sshd service using systemctl
restart_sshd_service() {
    systemctl restart sshd
}

# SSH client version
display_ssh_client_version() {
    ssh -V
}

# all steps
main() {
    backup_sshd
    restore_sshd
    restart_ssh
    display_ssh_version
    clean_apt_cache
    update_apt_packages
    reinstall_openssh_server
    display_installed_openssh
    restart_sshd_service
    display_ssh_client_version
}

# Call the main function
main
