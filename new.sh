# Create the authorized_keys file if it doesnt already exist
if [ ! -f "~/.ssh/authorized_keys" ]; then
  touch "$AUTHORIZED_KEYS"
fi

# Add keys
echo "# Neon" >> ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCBPMmBWhJMJWlJqnEObPdjbYWgFYZDNtsGFVisqOoDgIaMz/Dq2oimPytdiH69i5AwLlbvaRi6iKJK5+DmOmxZ2f9LNp949sv/7RKPbg6LxkzN5gLtC9mXxr9+oCGYuF71vVkRFhJqoOjqPJrnY0OWFE/dZ/LSFamwdxE1fZmsf6vdR4Bpx1EXg/LFGrVvtTxe7Zi9yXDDNYC2k+M2HTlbu7HNlWEjHHnNZBC1qSZwjjaRJ7r71B9pPuuF4BEvBPRF1YOAXuRTPPS9M4wnvouO5CQ3bOz6JCqbG8oypV5z1wDOFAy1RgPND63inPycYbkvoM0J+Pw5vTVyIOzsZbeh" >> ~/.ssh/authorized_keys
echo "# Plactrix" >> ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDb2OrJyyIIzXQNJamg9Xp1/t4qusN+BO6EdNpu/8CcakTrcDXWzKnNriaJTX1sBO3+xM8akSKkcTYoryZPVfNk6C2PXfO5DqDCgD09yYbcuY5PeR+h1j5PzYq45sLhnUh598JjzmOec+a1yUEVc7MirwPh0TeQgzFWzW4pXNFFhzkG1m2cmyhsTI/n6/rJGZEUO3b6fb5lC0uZgZcUg+VJq4Bfj67XlNhHVpl+loGVaO0eqAR8p5NAAvb2gSzNlJ95X7UVN9gKmByYgjkfet/DNWYo3iNnEfV3Ndlft4iuomDG/mooK+sakxBPJUhy/S7QFj1yXKEdA97M9vVrJiQaQMjNERC8zrhtlfruyHb/TFg6fehazdFLoo/CaSvn9J0v2UGbiNSi3Jq+d9Zz4hVLA4azUiRFxzig/mbwmplo3yETdY6QaBCWLnV1kk++YwZmHmTJ/UBTGz6UXVafBr+5dB6LLMKcEg/z1JFrTCHRbm23PP4ej53e1jImZv8YZZM= ramdo@DESKTOP-KAELAN" >> ~/.ssh/authorized_keys
echo "SSH Keys added."

# Disable root password auth
sed -i 's/^#PermitRootLogin\s\+yes/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
sed -i 's/^#PasswordAuthentication\s\+yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication\s\+yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^#PubkeyAuthentication\s\+yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^PubkeyAuthentication\s\+no/PubkeyAuthentication yes/' /etc/ssh/sshd_config
echo "Root password authentication disabled."
systemctl restart sshd
