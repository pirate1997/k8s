##初始化命令
kubeadm init --apiserver-advertise-address=192.168.0.210 \
--image-repository registry.cn-hangzhou.aliyuncs.com/google_containers \
--kubernetes-version=v1.23.4 --service-cidr=10.96.0.0/16 \
--pod-network-cidr=10.244.0.0/16

##重置从节点，node节点重置
kubeadm reset
systemctl stop kubelet
systemctl stop docker
rm -rf /var/lib/cni/
rm -rf /var/lib/kubelet/*
rm -rf /etc/cni/
##重启kubelet
systemctl restart kubelet
##重启docker
systemctl restart docker



kubeadm join 192.168.0.210:6443 --token e4wtci.nrj815kuvqi0mmzu --discovery-token-ca-cert-hash sha256:4cbfa33a98c82b89b6a5e3e2686edfff3b3763db82fe604d5dd2b04c48e8968e