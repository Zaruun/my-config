#==============================================================
# Script created by build.ps1 - any changes will be overwriten 
#==============================================================
 
# Update PowerShell to lastest by Microsoft Script
iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI -Quiet"
 
# Install WSL and Ubuntu 22.04
wsl --install -d Ubuntu-22.04
 
# Uninstall (PL language)

winget uninstall "MSN Pogoda”
winget uninstall "Cortana”
winget uninstall "Solitaire & Casual Games”
winget uninstall "Microsoft Pay”
winget uninstall "Xbox TCUI”
winget uninstall "Pomocnik konsoli Xbox”
winget uninstall "Xbox Game Bar Plugin”
winget uninstall "Xbox Game Bar”
winget uninstall "Xbox Identity Provider”
winget uninstall "Xbox Game Speech Window”
 
# Install programs by winget

#Browsers
winget install -e --id Google.Chrome
winget install -e --id Mozilla.Firefox
winget install -e --id Brave.Brave

# PDF
winget install -e --id geeksoftwareGmbH.PDF24Creator
winget install -e --id Adobe.Acrobat.Reader.32-bit

# IDE
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Microsoft.VisualStudio.2022.Community

# VPN
winget install -e --id WireGuard.WireGuard
winget install -e --id Cloudflare.Warp

# Microsoft
winget install -e --id Microsoft.Office
winget install -e --id Microsoft.Teams
winget install -e --id Microsoft.SQLServerManagementStudio
winget install -e --id Microsoft.PowerToys
winget install -e --id Microsoft.WindowsTerminal

# Password Managers
winget install -e --id Bitwarden.Bitwarden
winget install -e --id DominikReichl.KeePass

# Work
winget install -e --id Devolutions.RemoteDesktopManager
winget install -e --id Insecure.Nmap
winget install -e --id WinSCP.WinSCP
winget install -e --id LSoftTechnologies.ActiveDiskImage
winget install -e --id 7zip.7zip

# Everythink else
winget install -e --id alexx2000.DoubleCommander
winget install -e --id DeepL.DeepL
winget install -e --id Greenshot.Greenshot
winget install -e --id PuTTY.PuTTY
winget install -e --id Docker.DockerDesktop
