#!/usr/bin/env bash
apt-get install -y jq
wget https://github.com/ethersphere/bee/releases/download/v0.6.1/bee_0.6.1_amd64.deb
wget https://github.com/ethersphere/bee-clef/releases/download/v0.4.12/bee-clef_0.4.12_amd64.deb
wget -O cashout.sh https://gist.githubusercontent.com/ralph-pichler/3b5ccd7a5c5cd0500e6428752b37e975/raw/cashout.sh
sudo dpkg -i bee-clef_0.4.12_amd64.deb
sudo dpkg -i bee_0.6.1_amd64.deb
wget -O /etc/bee/bee.yaml_bak https://raw.githubusercontent.com/9840144/bee/main/bee.yaml
sudo bee-get-addr chmod +x cashout.shchown -R bee:bee /var/lib/bee
chown -R bee:bee /etc/bee
systemctl start bee
journalctl -u bee -f