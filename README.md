# NSEsus

NSEsus is a very basic, very janky Shell script that emulates a vulnerability scanner by automating and reporting on the results of certain common Nmap Scripting Engine (NSE) scripts. This is not meant to replace a proper vulnerability scanner in any way, but it may be helpful in identifying common vulns when a proper vuln scanner can't be deployed.

## Usage

NSEsus accepts two positional arguments.

- **IP Address / Range** (*Required*) - NSEsus 

- **NSE Script Directory** (*Optional*) - NSEsus was written on a system running Kali and by default uses the path to NSE scripts on that distro (/usr/share/nmap/scripts). If your Nmap scripts directory is in another location, you can pass the full path to the script as the second positional argument.

## About / License
