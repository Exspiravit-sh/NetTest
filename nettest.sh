#!/bin/bash/
#Simple Network Test Script
#Just Install Nmap To Start
#
#Developer: Exspiravit.sh
#https://www.github.com/exspiravit-sh

clear
rm .nettest.txt
rm .speed.txt
rm .nmap.txt
sleep 0.5
printf "Please Wait."

check() {
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
clear
printf "\nPlease Run This Script As Root.\n"
exit
fi
}

logo() {
cat logo.ascii
}

system() {
printf "Linux Distro: "
cat /etc/issue
}

get() {
curl -s wtfismyip.com/json > .nettest.txt
ping 127.0.0.1 -c 10 > .speed.txt
clear
printf "Finished.\n"
sleep 0.5
clear
nmap 127.0.0.1 -oN .nmap.txt
clear
}

ip() {
printf "##############################################\n"
printf "IP:"
grep -a 'IP' .nettest.txt | cut -d ":" -f2 | tr -d ',"'
printf "Location:"
grep -a 'Location' .nettest.txt | cut -d ":" -f2 | tr -d ',"'
printf "Hostname:"
grep -a 'Hostname' .nettest.txt | cut -d ":" -f2 | tr -d ',"'
printf "ISP:"
grep -a 'ISP' .nettest.txt | cut -d ":" -f2 | tr -d ',"'
printf "Proxy/Exit-Node:"
grep -a 'TorExit' .nettest.txt | cut -d ":" -f2 | tr -d ',"'
printf "Country Code:"
grep -a 'Country' .nettest.txt | cut -d ":" -f2 | tr -d ',"'
printf "Bandwidth Speed:"
grep -a 'rtt' .speed.txt | tr -d "rtt"
printf "##############################################\n"
printf "Running Services:\n"
sed '/# /d' .nmap.txt | cut -d 'N' -f1 | cut -d 'H' -f1 | grep -a ' '
}

check
get
logo
system
ip
