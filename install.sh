#!/bin/bash
# ============================================================
#   OSINT VM Setup Script — Web/Domain Reconnaissance
#   Author: Cypher
#   Tested on: Ubuntu 22.04.5
# ============================================================

echo -e "\e[1;34m============================================================\e[0m"
echo -e "\e[1;34m     OSINT VM TOOL INSTALLER — WEB/DOMAIN RECON USE CASE     \e[0m"
echo -e "\e[1;34m============================================================\e[0m\n"

# ------------------------------------------------------------
# STEP 1 — Update & Dependencies
# ------------------------------------------------------------
echo -e "\e[1;33m[1/10] Updating system packages and dependencies...\e[0m"
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y python3 python3-pip git curl jq golang
echo -e "\e[1;32m[✔] Dependencies installed successfully.\e[0m\n"
sleep 1

# ------------------------------------------------------------
# TOOL 1 — WHOIS
# ------------------------------------------------------------
echo -e "\e[1;33m[2/10] Installing WHOIS — Domain ownership lookup tool...\e[0m"
sudo apt install -y whois
echo -e "\e[1;32m[✔] WHOIS installed successfully.\e[0m\n"
sleep 1

# ------------------------------------------------------------
# TOOL 2 — DIG
# ------------------------------------------------------------
echo -e "\e[1;33m[3/10] Installing DIG (dnsutils) — DNS record enumeration...\e[0m"
sudo apt install -y dnsutils
echo -e "\e[1;32m[✔] DIG installed successfully.\e[0m\n"
sleep 1

# ------------------------------------------------------------
# TOOL 3 — DNSRecon
# ------------------------------------------------------------
echo -e "\e[1;33m[4/10] Installing DNSRecon — DNS record mapping tool...\e[0m"
sudo apt install -y dnsrecon
echo -e "\e[1;32m[✔] DNSRecon installed successfully.\e[0m\n"
sleep 1

# ------------------------------------------------------------
# TOOL 4 — WhatWeb
# ------------------------------------------------------------
echo -e "\e[1;33m[5/10] Installing WhatWeb — Web technology fingerprinting...\e[0m"
sudo apt install -y whatweb
echo -e "\e[1;32m[✔] WhatWeb installed successfully.\e[0m\n"
sleep 1

# ------------------------------------------------------------
# TOOL 5 — Sublist3r
# ------------------------------------------------------------
echo -e "\e[1;33m[6/10] Installing Sublist3r — Subdomain enumeration via search engines...\e[0m"
git clone https://github.com/aboul3la/Sublist3r.git ~/Sublist3r
cd ~/Sublist3r
sudo pip3 install -r requirements.txt
sudo ln -sf ~/Sublist3r/sublist3r.py /usr/local/bin/sublist3r
cd ~
echo -e "\e[1;32m[✔] Sublist3r installed successfully.\e[0m\n"
sleep 1

# ------------------------------------------------------------
# TOOL 6 — Assetfinder
# ------------------------------------------------------------
echo -e "\e[1;33m[7/10] Installing Assetfinder — Finds related subdomains/assets...\e[0m"
go install github.com/tomnomnom/assetfinder@latest
sudo ln -sf ~/go/bin/assetfinder /usr/local/bin/assetfinder
echo -e "\e[1;32m[✔] Assetfinder installed successfully.\e[0m\n"
sleep 1

# ------------------------------------------------------------
# TOOL 7 — Amass
# ------------------------------------------------------------
echo -e "\e[1;33m[8/10] Installing Amass — Advanced subdomain & DNS mapping tool...\e[0m"
sudo snap install amass
echo -e "\e[1;32m[✔] Amass installed successfully.\e[0m\n"
sleep 1

# ------------------------------------------------------------
# TOOL 8 — Waybackurls
# ------------------------------------------------------------
echo -e "\e[1;33m[9/10] Installing Waybackurls — Extract archived URLs from Wayback Machine...\e[0m"
go install github.com/tomnomnom/waybackurls@latest
sudo ln -sf ~/go/bin/waybackurls /usr/local/bin/waybackurls
echo -e "\e[1;32m[✔] Waybackurls installed successfully.\e[0m\n"
sleep 1

# ------------------------------------------------------------
# TOOL 9 — Httprobe
# ------------------------------------------------------------
echo -e "\e[1;33m[10/10] Installing Httprobe — Check which subdomains are alive...\e[0m"
go install github.com/tomnomnom/httprobe@latest
sudo ln -sf ~/go/bin/httprobe /usr/local/bin/httprobe
echo -e "\e[1;32m[✔] Httprobe installed successfully.\e[0m\n"
sleep 1

# ------------------------------------------------------------
# FINAL — Verification
# ------------------------------------------------------------
echo -e "\e[1;34m============================================================\e[0m"
echo -e "\e[1;34m Verifying Installed Tools \e[0m"
echo -e "\e[1;34m============================================================\e[0m"

tools=(whois dig dnsrecon sublist3r assetfinder amass waybackurls whatweb httprobe)
for tool in "${tools[@]}"; do
    echo -n "Checking $tool: "
    if command -v $tool >/dev/null 2>&1; then
        echo -e "\e[32mInstalled\e[0m"
    else
        echo -e "\e[31mNot Found\e[0m"
    fi
done

echo -e "\n\e[1;34m[✔] Installation Completed Successfully!\e[0m"