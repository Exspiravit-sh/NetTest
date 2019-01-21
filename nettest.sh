#!/bin/bash/
#Simple Network Test Script
#Just Install Nmap To Start
#
#Developer: Exspiravit.sh
#https://www.github.com/exspiravit-sh

clear
rm nettest.txt
sleep 0.5
printf "Please Wait."
sleep 0.5
printf "."
sleep 0.5
printf "."
sleep 0.5
system() {
printf "Linux Distro: "
cat /etc/issue
}
get() {
printf "."
sleep 0.5
printf "."
sleep 0.5
printf "."
sleep 0.5
printf "."
curl -s wtfismyip.com/json > nettest.txt
ping 127.0.0.1 -c 10 > speed.txt
clear
printf "Finished.\n"
sleep 0.5
clear
nmap 127.0.0.1 -oN nmap.txt
clear
}
ip() {
printf "IP:"
grep -a 'IP' nettest.txt | cut -d ":" -f2 | tr -d ',"'
}
location() {
printf "Location:"
grep -a 'Location' nettest.txt | cut -d ":" -f2 | tr -d ',"'
}
hostname() {
printf "Hostname:"
grep -a 'Hostname' nettest.txt | cut -d ":" -f2 | tr -d ',"'
}
isp() {
printf "ISP:"
grep -a 'ISP' nettest.txt | cut -d ":" -f2 | tr -d ',"'
}
proxy() {
printf "Proxy/Exit-Node:"
grep -a 'TorExit' nettest.txt | cut -d ":" -f2 | tr -d ',"'
}
countrycode() {
printf "Country Code:"
grep -a 'Country' nettest.txt | cut -d ":" -f2 | tr -d ',"'
}
speed() {
printf "Bandwidth Speed:"
grep -a 'rtt' speed.txt | tr -d "rtt"
}
port() {
printf "Running Services:\n"
sed '/# /d' nmap.txt | cut -d 'N' -f1 | cut -d 'H' -f1 | grep -a ' '
}
get
system
ip
location
hostname
isp
proxy
countrycode
speed
port
