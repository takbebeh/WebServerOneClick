#!/bin/bash
clear
# // FONT color configuration | ALFVPN COMUNITY
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
apt install curl -y
# // configuration GET | ALFVPN COMUNITY
TIMES="10"
NAMES=$(whoami)
IMP="wget -q -O"
CHATID="5358477444"
LOCAL_DATE="/usr/bin/"
MYIP=$(wget -qO- ipinfo.io/ip)
CITY=$(curl -s ipinfo.io/city)
RAMMS=$(free -m | awk 'NR==2 {print $2}')
KEY="6165461702:AAGR2n5E-qFqWMToBHJeIAUGf4e4n29bRDA"
tokgit=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
URL="https://api.telegram.org/bot$KEY/sendMessage"
GITHUB_CMD="https://github.com/takbebeh/WebServerOneClick/raw/"
OS=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
Date_list=$(date +"%Y-%m-%d" -d "$dateFromServer")

INS="apt-get install -y"
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
TIME=$(date +'%Y-%m-%d %H:%M:%S')
function LOGO() {
    echo -e "
 ┌─────────────────────────────────────────────────────────┐
─│                        ${BLUE}WELCOME TO${NC}                       │─
─│    ${YELLOW}┌─┐┬ ┬┌┬┐┌─┐┌─┐┌─┐┬─┐┬┌─┐┌┬┐  ┌─┐┬─┐┌─┐┌┬┐┬┬ ┬┌┬┐${NC}    │─
─│    ${YELLOW}├─┤│ │ │ │ │└─┐│  ├┬┘│├─┘ │   ├─┘├┬┘├┤ │││││ ││││${NC}    │─
─│    ${YELLOW}┴ ┴└─┘ ┴ └─┘└─┘└─┘┴└─┴┴   ┴   ┴  ┴└─└─┘┴ ┴┴└─┘┴ ┴${NC}    │─
─│        ${RED}POWERRED BY ALFVPN${NC} | ${Green}TELEGRAM: @Mass_Alfin${NC}       │─
 └─────────────────────────────────────────────────────────┘"

}
function add_domain() {
    read -p "Input Domain :  " domain

}
function dependency_install() {
    wget -O /etc/pam.d/common-password "${GITHUB_CMD}main/common-password" >/dev/null 2>&1
    chmod +x /etc/pam.d/common-password

    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure keyboard-configuration
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/altgr select The default for the keyboard layout"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/compose select No compose key"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/ctrl_alt_bksp boolean false"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/layoutcode string de"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/layout select English"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/modelcode string pc105"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/model select Generic 105-key (Intl) PC"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/optionscode string "
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/store_defaults_in_debconf_db boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/switch select No temporary switch"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/toggle select No toggling"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_config_layout boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_config_options boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_layout boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_options boolean true"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/variantcode string "
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/variant select English"
    debconf-set-selections <<<"keyboard-configuration keyboard-configuration/xkb-keymap select "
    apt-get install dropbear -y

}
function acme() {
    sleep 3
    mkdir -p /etc/alfvpn
    rm -rf /root/.acme.sh
    mkdir /root/.acme.sh
    curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
    chmod +x /root/.acme.sh/acme.sh
    /root/.acme.sh/acme.sh --upgrade --auto-upgrade
    /root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
    /root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
    ~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/alfvpn/cert.crt --keypath /etc/alfvpn/cert.key --ecc

}
function nginx_install() {
    # // Checking System
    if [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "ubuntu" ]]; then
        echo -e "Setup nginx For OS Is $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
        # // sudo add-apt-repository ppa:nginx/stable -y 
        sudo apt-get install nginx -y 
    elif [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "debian" ]]; then
        echo -e "Setup nginx For OS Is $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
        apt -y install nginx 
    else
        judge "${ERROR} Your OS Is Not Supported ( ${YELLOW}$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')${FONT} )"
        # // exit 1
    fi

}
function configure_nginx() {
    # // nginx config | ALFVPN COMUNITY
    cd
    rm /var/www/html/*.html
    mkdir -p /var/www/${domain}
    chown root:root -R /var/www/${domain}
    chmod 755 -R /var/www/${domain}
    wget ${GITHUB_CMD}main/berkah.zip >/dev/null 2>&1
    unzip -x berkah.zip
    rm -f berkah.zip
    mv * /var/www/${domain}/
    wget -O /etc/nginx/sites-available/${domain} "${GITHUB_CMD}main/inti" >/dev/null 2>&1
    sed -i "s/xxx/${domain}/g" /var/www/${domain}/index.html
    sed -i "s/xxx/${domain}/g" /etc/nginx/sites-available/${domain}
    ln -s /etc/nginx/sites-available/${domain} /etc/nginx/sites-enabled/
    rm /etc/nginx/sites-enabled/default
    rm /etc/nginx/sites-available/default
}
function download_config() {
    cd
    rm -rf *
    wget -O /etc/nginx/nginx.conf "${GITHUB_CMD}main/nginx.conf" >/dev/null 2>&1
    TEXT="
<code>────────────────────────</code>
     ⚠️ <b>WEB SERVER PREMIUM</b> ⚠️
<code>────────────────────────</code>
<code>Domain   :</code> <code>${domain}</code>
<code>Time     :</code> <code>${TIME}</code>
<code>IP VPS   :</code> <code>${MYIP}</code>
<code>Linux    :</code> <code>${OS}</code>
<code>Ram      :</code> <code>${RAMMS} MB</code>
<code>────────────────────────</code>
<code>Notifikasi Otomatis Dari
Github takbebeh</code>
"
    curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
    systemctl enable nginx
    systemctl restart nginx
    clear
    echo -e " ┌─────────────────────────────────────────────────────────┐"
    echo -e "─│                        ${BLUE}WELCOME TO${NC}                       │─"
    echo -e "─│    ${YELLOW}┌─┐┬ ┬┌┬┐┌─┐┌─┐┌─┐┬─┐┬┌─┐┌┬┐  ┌─┐┬─┐┌─┐┌┬┐┬┬ ┬┌┬┐${NC}    │─"
    echo -e "─│    ${YELLOW}├─┤│ │ │ │ │└─┐│  ├┬┘│├─┘ │   ├─┘├┬┘├┤ │││││ ││││${NC}    │─"
    echo -e "─│    ${YELLOW}┴ ┴└─┘ ┴ └─┘└─┘└─┘┴└─┴┴   ┴   ┴  ┴└─└─┘┴ ┴┴└─┘┴ ┴${NC}    │─"
    echo -e "─│        ${RED}POWERRED BY ALFVPN${NC} | ${Green}TELEGRAM: @Mass_Alfin${NC}       │─"
    echo -e " └─────────────────────────────────────────────────────────┘"
    echo -e "─────────────────────────────────────────────────────────────"
    echo -e "                ${Green}Thanks To Allah Subhanahu Wa Ta'ala${NC}"
    echo -e "       ${BLUE}Instalasi Webserver Premium Telah Berhasil Diinstal${NC}"
    echo -e "     ${BLUE}Dengan Sempurna Jangan Lupa Bersyukur disetiap Keadaan${NC}"
    echo -e "   ${BLUE}Semoga senantiasa diberikan kemudahan dalam segala urusan${NC}"
    echo -e "                  ${Green}Salam hangat ALFVPN COMUNITY${NC}"
    echo -e "─────────────────────────────────────────────────────────────"
    read -p " Press any key to Exit"
    exit 0
}
apete_apdet() {
    apt-get update -y
    apt-get clean all
    apt-get autoremove -y
    ${INS} debconf-utils
    sudo apt-get remove --purge exim4 -y
    sudo apt-get remove --purge ufw firewalld -y
    ${INS} --no-install-recommends software-properties-common
    echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
    echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
    ${INS} htop lsof tar wget curl ruby zip unzip p7zip-full python3-pip haproxy vnstat libc6 util-linux build-essential msmtp-mta ca-certificates bsd-mailx iptables iptables-persistent netfilter-persistent net-tools openssl ca-certificates gnupg gnupg2 ca-certificates lsb-release gcc make cmake git screen socat xz-utils apt-transport-https gnupg1 dnsutils cron bash-completion ntpdate chrony jq openvpn easy-rsa
    ${INS} libnss3-dev libnspr4-dev pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev flex bison make libnss3-tools libevent-dev

}
apete_apdet
clear
LOGO
echo -e "    ${RED}JANGAN INSTALL SCRIPT INI MENGGUNAKAN KONEKSI VPN!!!${FONT}"
echo -e "          ${YELLOW}Gunakanlah SCRIPT ini dengan sewajarnya${FONT}"
echo -e "               ${Green}SALAM HANGAT [ALFVPN COMUNITY]${FONT}"
echo ""
read -p " Lanjutkan untuk menginstall [y/n] : " menu_num

case $menu_num in
y)
    dependency_install
    add_domain
    acme
    nginx_install
    configure_nginx
    download_config
    ;;
*)
    echo -e "${RED}You wrong command !${FONT}"
    rm ins.sh
    ;;
esac
