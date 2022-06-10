cat <<EOF > $HOME/.ssh/config
host bastion
   HostName `cat public-ip.txt`
   User ubuntu
   identityFile $HOME/.ssh/BastionKey.pem
   StrictHostKeyChecking=no
host private_instance
   HostName  `cat private-ip.txt`
   user  ubuntu
   ProxyCommand ssh bastion -W %h:%p
   identityFile $HOME/.ssh/BastionKey.pem
   StrictHostKeyChecking=no
EOF