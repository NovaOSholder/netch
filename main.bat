@echo off

title NETCH 1.0 by Lyrex

echo REMEMBER: Pinging is NOT sending DDoS/DoS, its just checking the IP address of the target. By the  way, this script is for Windows only.
echo !!USE AT YOUR OWN RISK, EDUCATIONAL PURPOSES ONLY!!

goto :ascii

:ascii

chcp 65001 >nul

echo.
echo ███╗   ██╗███████╗████████╗ ██████╗██╗  ██╗
echo ████╗  ██║██╔════╝╚══██╔══╝██╔════╝██║  ██║
echo ██╔██╗ ██║█████╗     ██║   ██║     ███████║
echo ██║╚██╗██║██╔══╝     ██║   ██║     ██╔══██║
echo ██║ ╚████║███████╗   ██║   ╚██████╗██║  ██║
echo ╚═╝  ╚═══╝╚══════╝   ╚═╝    ╚═════╝╚═╝  ╚═╝

echo NETCH 1.0 type help for commands

goto :main

:main

set /p command="Enter command: "
if "%command%"=="ping" goto :ping
if "%command%"=="ping --v4" goto :pingv4
if "%command%"=="ipcheck" goto :ipcheck
if "%command%"=="arp --c" goto :arpc
if "%command%"=="mac" goto :mac
if "%command%"=="pping" goto :pping
if "%command%"=="nlookup" goto :nlookup
if "%command%"=="lport" goto :lport
if "%command%"=="routerchc" goto :routerchc
if "%command%"=="ntbn" goto :ntbn
if "%command%"=="connectionchc" goto :connectionchc
if "%command%"=="sping" goto :sping
if "%command%"=="help" goto :help

echo Invalid command. Type 'help' for a list of commands.
goto :main

:ping
set /p target=Enter target IP or domain:
ping %target%

goto :main

:pingv4
set /p targetv4=Enter target IPv4:
ping -4 %targetv4%

goto :main

:ipcheck
ipconfig

goto :main

:arpc
arp -a
goto :main

:mac
getmac
goto :main

:pping
set /p pping="Enter target IP or domain to path ping: "
pathping %pping%
goto :main

:nlookup
set /p lookup="Enter target IP or domain to lookup: "
nslookup %lookup%
goto :main

:lport
netstat -an
goto :main

:routerchc
set /p rchc="Enter target IP for tracert: "
tracert %rchc%
goto :main

:ntbn
set /p ntbn="Enter target IP for NetBIOS shared names: "
nbtstat -A %ntbn%
goto :main

:connectionchc
netstat -an
goto :main

:sping
set /p sping="Enter target IP to ping sweep: "
for /l %%i in (1,1,254) do (
    ping -n 1 %sping%.%%i | find "TTL="
)
goto :main

:help
echo Available commands:
echo ping - Ping a target IP or domain
echo ping --v4 - Ping a target IPv4 address
echo ipcheck - Check your IP configuration
echo arp --c - Display the ARP cache
echo mac - Display MAC addresses
echo pping - Path ping a target IP or domain
echo nlookup - Perform a DNS lookup on a target IP or domain
echo lport - List all listening ports
echo routerchc - Trace route to a target IP
echo ntbn - Check NetBIOS shared names for a target IP
echo connectionchc - Check current connections
echo sping - Perform a ping sweep on a target IP range
echo help - Display this help message
goto :main
