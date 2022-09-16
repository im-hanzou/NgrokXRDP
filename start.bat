@echo off
title NGROK x RDP
:: change xxx to ur ngrok authtoken 

ngrok.exe config add-authtoken xxx
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="remote desktop" new enable=yes
ngrok.exe tcp 3389

:: open https://dashboard.ngrok.com/tunnels/agents and check your tunnel. Use xxx.tcp.xxx.ngrok.io:port to connect remote desktop
