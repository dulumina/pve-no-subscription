#!/bin/bash

# Menonaktifkan repositori yang mengandung kata 'deb' dan 'enterprise'
echo "Menonaktifkan repositori yang mengandung kata 'deb' dan 'enterprise'..."
for file in /etc/apt/sources.list.d/*; do
    if grep -q 'deb' "$file" && grep -q 'enterprise' "$file"; then
        # Memeriksa apakah baris sudah dikomentari
        if ! grep -q '^#' "$file"; then
            echo "Mengomentari repositori di $file..."
            sed -i 's/^deb/#deb/' "$file"
        else
            echo "Repositori di $file sudah dikomentari."
        fi
    fi
done

# Mengaktifkan repositori No-Subscription
echo "Mengaktifkan repositori No-Subscription..."
echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-no-subscription.list

# Memperbarui daftar paket
echo "Memperbarui daftar paket..."
apt update

echo "Proses selesai. Repositori telah diperbarui."
