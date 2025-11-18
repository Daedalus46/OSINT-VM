#!/bin/bash
# ============================================================
#   OSINT Recon Demo Script — Web/Domain Reconnaissance
#   Author: Cypher
# ============================================================

domain=$1

if [ -z "$domain" ]; then
    echo -e "\e[31mUsage: bash demo_osint_recon.sh <domain>\e[0m"
    exit 1
fi

# Create a folder to store results
mkdir -p ~/osint_results/$domain
cd ~/osint_results/$domain

echo -e "\n\e[1;33m[*] Starting OSINT Reconnaissance on: $domain\e[0m"
sleep 1


# ========================================
# WHOIS
# ========================================
echo -e "\n\e[1;32m[+] WHOIS Lookup...\e[0m"
whois $domain | tee whois.txt
sleep 1


# ========================================
# DIG RECORDS
# ========================================
echo -e "\n\e[1;32m[+] DIG - NS Records...\e[0m"
dig $domain NS +noall +answer | tee dig_ns.txt
sleep 1

echo -e "\n\e[1;32m[+] DIG - ANY Records...\e[0m"
dig $domain ANY +noall +answer | tee dig_any.txt
sleep 1

echo -e "\n\e[1;32m[+] DIG - MX Records...\e[0m"
dig $domain MX +noall +answer | tee dig_mx.txt
sleep 1


# ========================================
# WhatWeb
# ========================================
echo -e "\n\e[1;32m[+] WhatWeb Scan...\e[0m"
whatweb $domain | tee whatweb.txt
sleep 1

echo -e "\n\e[1;32m[+] WhatWeb Aggressive Scan...\e[0m"
whatweb -v $domain | tee whatweb_verbose.txt
sleep 1


# ========================================
# Sublist3r
# ========================================
echo -e "\n\e[1;32m[+] Subdomain Enumeration (Sublist3r)...\e[0m"
python3 ~/Sublist3r/sublist3r.py -d $domain -o sublist3r.txt
sleep 1


# ========================================
# Amass
# ========================================
echo -e "\n\e[1;32m[+] Amass Passive Enumeration...\e[0m"
amass enum -passive -d $domain | tee amass.txt
sleep 1


# ========================================
# DNSRecon
# ========================================
echo -e "\n\e[1;32m[+] DNSRecon Enumeration...\e[0m"
dnsrecon -d $domain | tee dnsrecon.txt
sleep 1


# ========================================
# Assetfinder
# ========================================
echo -e "\n\e[1;32m[+] Assetfinder Enumeration...\e[0m"
assetfinder $domain | tee assetfinder.txt
sleep 1


# ========================================
# Waybackurls (Limited to 100 URLs)
# ========================================
echo -e "\n\e[1;32m[+] Fetching Wayback URLs (limited to 100)...\e[0m"
echo $domain | waybackurls | head -n 100 | tee waybackurls.txt
sleep 1


# ========================================
# Httprobe
# ========================================
echo -e "\n\e[1;32m[+] Checking domain with Httprobe...\e[0m"
echo $domain | httprobe | tee httprobe.txt
sleep 1


# ========================================
# DONE
# ========================================
echo -e "\n\e[1;34m[✔] Recon Complete! Results saved in: ~/osint_results/$domain/\e[0m"
echo -e "\e[1;36mCheck all .txt files for full analysis.\e[0m"