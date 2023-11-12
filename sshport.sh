mv /etc/ssh/sshd_config /etc/ssh/sshd_config_old
sed 's/#Port 22/Port 10190/' /etc/ssh/sshd_config_old >> /etc/ssh/sshd_config
echo "WARNING: AFTER YOU SEE THIS MESSAGE, YOU WILL HAVE TO RECONNECT TO THE SERVER."
systemctl restart ssh
systemctl restart sshd
