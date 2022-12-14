yum remove -y docker*
yum remove containerd.io
yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

rpm -ivh /tmp/cri-dockerd-0.2.6-3.el7.x86_64.rpm 
systemctl start cri-docker


