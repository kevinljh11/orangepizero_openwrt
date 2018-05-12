nohup /root/kcptun/client_linux_arm7  -r "xxx:11054" -l ":20006" -key test -mtu 1350 -sndwnd 9 -rcvwnd 700 -crypt none -mode fast2 -dscp 0 -datashard 10 -parityshard 3 -autoexpire 0 -nocomp > /root/kcptun/kcptun_ua.log 2>&1 &
nohup /root/kcptun/client_linux_arm7  -r "xxx:17517" -l ":20003" -key test -mtu 1350 -sndwnd 9 -rcvwnd 1024 -crypt none -mode fast2 -dscp 0 -datashard 10 -parityshard 3 -autoexpire 0 -nocomp > /root/kcptun/kcptun_uk.log 2>&1 &
sleep 5
cd /opt/bin
nohup /opt/bin/ssr-local -c /root/ssr/ssr_ua.json > /root/ssr/ssr_ua.log 2>&1 &
nohup /opt/bin/ssr-local -c /root/ssr/ssr_uk.json > /root/ssr/ssr_uk.log 2>&1 &
