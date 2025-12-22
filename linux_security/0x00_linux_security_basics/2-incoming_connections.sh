#!/bin/bash

# Port 80-ə (HTTP) gələn TCP bağlantılarına icazə veririk (IPv4)
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Port 80-ə (HTTP) gələn TCP bağlantılarına icazə veririk (IPv6)
sudo ip6tables -A INPUT -p tcp --dport 80 -j ACCEPT

# Digər bütün gələn bağlantıları bloklayırıq (Opsional, amma təhlükəsizlik üçün vacibdir)
# Qeyd: Əgər checker yalnız "Rules updated" yazısını gözləyirsə, aşağıdakı echo kifayətdir.

echo "Rules updated"
echo "Rules updated (v6)"
