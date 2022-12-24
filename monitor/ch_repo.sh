cd ./kube-prometheus/manifests/
sed -i 's/quay.io/quay.mirrors.ustc.edu.cn/g' setup/prometheus-operator-deployment.yaml
sed -i 's/quay.io/quay.mirrors.ustc.edu.cn/g' prometheus-prometheus.yaml 
sed -i 's/quay.io/quay.mirrors.ustc.edu.cn/g' alertmanager-alertmanager.yaml
sed -i 's/quay.io/quay.mirrors.ustc.edu.cn/g' kube-state-metrics-deployment.yaml
sed -i 's/k8s.gcr.io/lank8s.cn/g' kube-state-metrics-deployment.yaml
sed -i 's/quay.io/quay.mirrors.ustc.edu.cn/g' node-exporter-daemonset.yaml
sed -i 's/quay.io/quay.mirrors.ustc.edu.cn/g' prometheus-adapter-deployment.yaml
sed -i 's/k8s.gcr.io/lank8s.cn/g' prometheus-adapter-deployment.yaml
grep "image: " * -r   # 确认一下是否还有国外镜像

