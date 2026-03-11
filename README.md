# 🛠️ Hardened Pop!_OS Development Environment
## 📖 Project Overview
This repository contains the Infrastructure-as-Code (IaC) and configuration scripts used to deploy my primary development and security research environment. Built on Pop!_OS, this setup balances high-performance "Vibe Coding" in Cursor/Unity with a hardened security posture suitable for a cybersecurity professional.

Why this exists:
As I pivot into cybersecurity at age 29, I believe in defense-by-design. This project automates the "boring stuff" while ensuring my kernel, network, and application layers are secured from Day 1.

## 🛡️ Security Features
Kernel Hardening: Custom sysctl configurations to prevent IP spoofing and ignore ICMP redirects.

Network Defense: Default-deny firewall policy using UFW, pre-configured for VR development (SteamVR/Oculus) and secure SSH.

Audit Logging: Integrated Lynis for automated system security auditing.

Application Sandboxing: Configurations for Firejail to isolate web-facing applications.

Minimal Surface Area: Automated removal of unnecessary "bloatware" services to reduce the attack surface.

## 🚀 Tech Stack
OS: Pop!_OS (Ubuntu-based, Linux 6.x+)

Tools: Cursor (AI Editor), Unity/C#, SteamVR

Automation: Bash / Ansible

Security: UFW, Lynis, Fail2Ban, FailSafe-SSH

#🛠️ Installation & Setup
Bash
## Clone the repository
git clone https://github.com/YOUR_USERNAME/hardened-pop-devbox.git

## Navigate to the scripts directory
cd hardened-pop-devbox/scripts

## Run the hardening audit
chmod +x audit.sh
./audit.sh

## Apply the hardened configuration
sudo ./deploy.sh
# 📈 Roadmap / Future Work
[ ] Phase 2 Integration: Add support for Unikraft build environments.

[ ] RISC-V Emulation: Scripting the QEMU environment for low-level architectural research.

[ ] Automated Backups: Encrypted off-site sync for Unity projects.

# 🤝 Acknowledgments
Inspired by the NFAR (National Foundation for Autism Research) vocational curriculum.

Security baselines derived from CIS Benchmarks and CyberHire San Diego recommendations.
