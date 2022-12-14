/usr/lib/systemd/system/cri-docker.service 增加内容
ExecStart=/usr/bin/cri-dockerd --container-runtime-endpoint fd:// --pod-infra-container-image registry.aliyuncs.com/google_containers/pause:3.8

kubeadm config images list --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.25.0

kubeadm config images pull --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.25.0 --cri-socket unix:///var/run/cri-dockerd.sock


yum remove -y kube*
yum list kubeadm --showduplicates |sort -r
yum -y install kubeadm-1.25.0-0 kubelet-1.25.0-0 kubectl-1.25.0-0

kubeadm reset -f --cri-socket unix:///var/run/cri-dockerd.sock
rm -rf $HOME/.kube/config

kubeadm init \
--apiserver-advertise-address 192.168.0.210 \
--kubernetes-version v1.25.0  \
--pod-network-cidr 10.244.0.0/16 \
--service-cidr 10.96.0.0/12 \
--token-ttl 0 \
--cri-socket unix:///var/run/cri-dockerd.sock \
--image-repository registry.aliyuncs.com/google_containers \
--upload-certs

加入多个master,生成令牌
kubeadm init phase upload-certs --upload-certs

在其他master节点执行,加入master集群
kubeadm join k8s.magedu.org:6443 --token szteym.ie4hfabhfmp4w571
--discovery-token-ca-cert-hash sha256:61ba2d8406c49226ca4c404e4ac756096879d8937688cb67bfc3b030ffbd6la5 \
--control-plane \
--certificate-key G283f9fe8876dadbe392f3ed39292c93f36f20872b675377c46b3a85



