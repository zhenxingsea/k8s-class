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