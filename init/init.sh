kubeadm reset
systemctl stop kubelet
systemctl stop docker
rm -rf /var/lib/cni/
rm -rf /var/lib/kubelet/*
rm -rf /etc/cni/
ifconfig cni0 down
ifconfig flannel.1 down
ifconfig docker0 down
ifconfig weave down
ifconfig vxlan-6784 down
ifconfig vethwe-datapath down
ifconfig vethwe-bridge down
ifconfig datapath down
ifconfig
rm -rf $HOME/.kube
kubeadm init  --pod-network-cidr=10.244.0.0/16 --upload-certs

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

sysctl net.bridge.bridge-nf-call-iptables=1
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

kubectl get pod -n kube-system -w

# kubectl create -f kubernetes-dashboard.yaml 可选