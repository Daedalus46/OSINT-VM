# 🛰️ OSINT Web/Domain Reconnaissance Machine  
### *Automated Recon Toolkit for Web, DNS, and Subdomain Intelligence*  
### **Tested on: Ubuntu 22.04.5 LTS (Jammy Jellyfish)**  
Ubuntu Releases website : https://releases.ubuntu.com/

Ubuntu 22.04.05 LTS Direct Download: https://releases.ubuntu.com/jammy/ (Download Desktop Image for VM) 

#### NOTE : Check tickbox of Unintended installation when installing your ubuntu in VM to get sudo privileges.

---

## 📌 Overview

This repository contains an automated **OSINT (Open Source Intelligence)** machine designed for **Web & Domain Reconnaissance**.  
It uses open-source tools to gather intelligence about domains, DNS infrastructure, subdomains, technologies, archived URLs, and more.

The framework focuses strictly on **passive, ethical, and legal OSINT techniques** using publicly accessible information.

---

## 🧩 Architecture & Workflow

```
User → OSINT VM → install.sh → osint.sh → Results Folder → Analysis
```

### Components
- **install.sh** – Automatically installs all required OSINT tools  
- **osint.sh** – Runs a full automated reconnaissance scan  
- **osint_results/** – Directory where all recon data is saved  
- **README.md** – Documentation (this file)

---

## 🔧 Tools Included (Purpose + Author Reference)
<div align="center">

| Tool | Purpose | Author / Organization |
|------|---------|------------------------|
| **WHOIS** | Domain ownership lookup | IANA / ICANN |
| **DIG (dnsutils)** | DNS queries & record extraction | Internet Systems Consortium (ISC) |
| **DNSRecon** | DNS enumeration & DNS record mapping | Carlos Perez (DarkOperator) |
| **WhatWeb** | Web technology fingerprinting | Andrew Horton (urbanadventurer) |
| **Sublist3r** | Subdomain discovery via OSINT search engines | Ahmed Aboul-Ela |
| **Assetfinder** | Find related subdomains/assets | Tomnomnom |
| **Amass** | Advanced DNS mapping & subdomain enumeration | OWASP Foundation |
| **Waybackurls** | Extract archived URLs from the Wayback Machine | Tomnomnom |
| **Httprobe** | Probe discovered domains to check if alive | Tomnomnom |

</div>

---

## 🛠️ Installation Requirements

✔ Fully compatible with **Ubuntu 22.04.5 LTS (Jammy)**  
✔ Requires:
- Python 3  
- Golang  
- Git  
- Curl  
- Snap (for Amass)  

---

## 📝 Installation Instructions

### 1. Clone Repository
```bash
git clone https://github.com/Daedalus46/OSINT-VM.git
cd <repo-folder> 
```
Example
```bash
cd Desktop/cloned_repository
```

### 2. Make installer executable
```bash
chmod +x install.sh
```

### 3. Run installer
Run install.sh two times for better results.
```bash
sudo bash install.sh
./install.sh 
```
---

## 📸 Installation Preview
When Installed it should give something like this
<p align="center">
  <img width="563" height="272" alt="image" src="https://github.com/user-attachments/assets/508acd2a-8121-4165-93d9-cafeaee594fa" />
<br><br>

---

# 🚀 Usage

Run a full reconnaissance scan:

```bash
chmod +x osint.sh
./osint.sh <domain>
```

Example:

```bash
./osint.sh tesla.com
```

All results will automatically be saved inside:

```
~/osint_results/<domain>/
```

---

# 📁 Output Structure (Outfile Directory Tree)

When you scan a domain (example: tesla.com), the tool generates:

```
osint_results/
└── tesla.com/
    ├── whois.txt                # WHOIS data
    ├── dig_ns.txt               # Nameserver records
    ├── dig_any.txt              # ANY DNS records
    ├── dig_mx.txt               # Mail server records
    ├── whatweb.txt              # Web fingerprinting results
    ├── whatweb_verbose.txt      # Aggressive fingerprinting
    ├── sublist3r.txt            # Subdomains (OSINT-based)
    ├── amass.txt                # Passive subdomain enumeration
    ├── dnsrecon.txt             # DNS enumeration & record mapping
    ├── assetfinder.txt          # Related subdomains/assets
    ├── waybackurls.txt          # Archived URLs from Wayback Machine
    └── httprobe.txt             # Live/active domain probe results
```

This structure keeps all data organized for easy analysis or reporting.

---

# 📸 Recon Output 
<p align="center">
  <img width="355" height="122" alt="image" src="https://github.com/user-attachments/assets/f93a7321-be23-40fd-843a-3d7bb27ceef0" />
<p align="center">
  <img width="687" height="193" alt="image" src="https://github.com/user-attachments/assets/b6a138d5-8eb9-4032-9a94-26ad5e40898d" />
<br><br>

---

# ⚖ Ethical Usage & Guidelines

- Only scan domains you **own** or have **explicit permission** to test  
- All included tools perform **passive information gathering**  
- No intrusion, exploitation, or unauthorized access is performed  
- All techniques rely solely on publicly available information  
- Must be used responsibly according to cyber ethics and legal standards  

---

# 📂 Repository Structure

```
├── install.sh            # Installation script
├── osint.sh              # Main OSINT automation script
├── osint_results/        # Output/results directory
├── README.md             # Documentation
```

---

# 🤝 Contribution

Pull requests and suggestions are welcome.  
Please follow ethical OSINT practices when contributing.

---

# 🛡 Disclaimer

This project is for **educational and ethical cybersecurity research** only.  
The developer is **not responsible for any misuse**.

