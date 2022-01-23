eval $(cat base.bash)
sudo cp certificate/cert.crt /usr/local/share/ca-certificates
sudo update-ca-certificates
sudo mkdir -p /etc/docker/certs.d/wsl:8080
sudo cp certificate/cert.crt /etc/docker/certs.d/wsl:8080
mkdir -p $HOME/.minikube/certs
cp certificate/cert.crt $HOME/.minikube/certs