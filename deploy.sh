#!/bin/bash

# --- Hardened Pop!_OS Dev-Box Deployment Script ---
# Author: Gilead
# Purpose: Automate security hardening and dev tool installation for Pop!_OS
# --------------------------------------------------

set -e # Exit on error

echo "🛡️ Starting Hardened Deployment for Pop!_OS..."

# 1. Update and Clean System
echo "📦 Updating system packages..."
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y

# 2. Network Hardening (UFW)
echo "🔥 Configuring Firewall..."
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
# Allow common dev ports (Oculus/SteamVR/Local Dev)
sudo ufw allow 8080/tcp # Local Web Dev
sudo ufw allow 22/tcp   # SSH (Consider changing port for extra security)
sudo ufw enable

# 3. Kernel Hardening (Sysctl)
echo "🧠 Applying Kernel Hardening..."
sudo tee /etc/sysctl.d/99-hardened.conf <<EOF
# Ignore ICMP redirects (Prevent MITM)
net.ipv4.conf.all.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0
# Prevent IP Spoofing
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
# Disable Magic SysRq
kernel.sysrq = 0
EOF
sudo sysctl -p /etc/sysctl.d/99-hardened.conf

# 4. Dev Tool Verification (Cursor & Unity)
echo "🛠️ Verifying Development Tools..."
if command -v cursor &> /dev/null; then
    echo "✅ Cursor is installed."
else
    echo "⚠️ Cursor not found. Reminder: Download the AppImage and link to /usr/local/bin"
fi

# 5. Security Auditing Tool
echo "🔍 Installing Lynis for Security Auditing..."
sudo apt install lynis -y

echo "✅ Deployment Complete!"
echo "Next Step: Run 'sudo lynis audit system' to see your security score."