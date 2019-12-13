#!/usr/bin/bash
#FellFreeToRecode
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'
LIMITATOR=5
clear
BANNERS () {
printf "${white}
 ██████╗ ██████╗ ███████╗███╗   ███╗ ██████╗ ██████╗ ██╗   ██╗
██╔════╝ ██╔══██╗██╔════╝████╗ ████║██╔═══██╗██╔══██╗╚██╗ ██╔╝
██║  ███╗██████╔╝█████╗  ██╔████╔██║██║   ██║██████╔╝ ╚████╔╝ 
██║   ██║██╔══██╗██╔══╝  ██║╚██╔╝██║██║   ██║██╔══██╗  ╚██╔╝  
╚██████╔╝██║  ██║███████╗██║ ╚═╝ ██║╚██████╔╝██║  ██║   ██║   
 ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝ 
                      Mass Port Scanner\n
"
}
BANNERS
OPTIONS () {
printf "${red}[>]${white} List                    :${lightgreen} "
read list
printf "${red}[>]${white} Port                    :${lightgreen} "
read port
site=$(cat $list)
}
OPTIONS
printf "Now Checking...\n"
for site in $(cat $list);
do
((cthread=cthread%LIMITATOR)); ((cthread++==0)) && wait
if timeout 3 bash -c "</dev/tcp/${site}/${port} &>/dev/null"
then
  printf "${white}[+]${site} Port is ${lightgreen} open\n"
  echo "$site:$port" >> result.txt
else
  printf "${white}[+] ${site} Port is ${red} closed\n"
fi
done
printf "Save as result.txt...\n"
