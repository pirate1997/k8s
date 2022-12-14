for i in `kubeadm config images list`; do
  imageName=${i#registry.k8s.io/}
  echo == docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
  docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName

  echo == docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName registry.k8s.io/$imageName
  docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName registry.k8s.io/$imageName
  ##注意cordns是一级目录，而kubeadm在二级目录
  echo == docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
  docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
done;

