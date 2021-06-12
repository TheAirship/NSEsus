# NSEsus

NSEsus is a very basic, very janky Shell script that emulates a vulnerability scanner by automating and reporting on the results of certain Nmap Scripting Engine (NSE) scripts. This is not meant to replace a proper vulnerability scanner in any way, but it may be helpful when a proper scanner can't be deployed.

NSEsus checks for HTTP vulnerabilities on TCP 80, SMTP vulnerabilities on TCP 25, and SMB vulnerabilities on TCP 139 and 445. Nmap is required for this script to operate properly.

## Usage

NSEsus accepts two positional arguments.

- **IP Address / Range** (*Required*) - NSEsus accepts IP addresses or address ranges in most Nmap-usable formats, as defined in [Nmap documentation](https://nmap.org/book/man-target-specification.html). Any target specification that requires an extra parameter (e.g., list scanning or -iL) is not supported without modifying the script. 

- **NSE Script Directory** (*Optional*) - NSEsus was written on a system running Kali and by default uses the path to NSE scripts on that distro (/usr/share/nmap/scripts). If your Nmap scripts directory is in another location, you can pass the full path to the directory as the second positional argument.

## About / License

I threw this script together while working on the OSCP certification. This initial release contains some minor improvements, but the core remains largely unchanged.

Licensed under [Apache 2.0](https://github.com/TheAirship/NSEsus/blob/main/LICENSE)
Bugs and issues can be submitted on the [Issues Page](https://github.com/TheAirship/NSEsus/issues)  
Questions, feedback, feature requests: infosec@theairship.cloud
