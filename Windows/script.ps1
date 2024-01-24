#==============================================================
# Script created by build.ps1 - any changes will be overwriten 
#==============================================================
 
# Set dark theme
start-process -filepath "C:\Windows\Resources\Themes\dark.theme"
 
# Update PowerShell to lastest by Microsoft Script
iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI -Quiet"
 
# Install WSL and Ubuntu 22.04
wsl --install -d Ubuntu-22.04
 
winget list
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
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Google.Chrome 
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Mozilla.Firefox
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Brave.Brave

# PDF
winget install -e --accept-source-agreements --accept-package-agreements --silent --id geeksoftwareGmbH.PDF24Creator
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Adobe.Acrobat.Reader.32-bit

# IDE
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Microsoft.VisualStudioCode
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Microsoft.VisualStudio.2022.Community

# VPN
winget install -e --accept-source-agreements --accept-package-agreements --silent --id WireGuard.WireGuard
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Cloudflare.Warp

# Microsoft
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Microsoft.Office
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Microsoft.Teams
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Microsoft.SQLServerManagementStudio
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Microsoft.PowerToys
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Microsoft.WindowsTerminal

# Password Managers
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Bitwarden.Bitwarden
winget install -e --accept-source-agreements --accept-package-agreements --silent --id DominikReichl.KeePass

# Work
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Devolutions.RemoteDesktopManager
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Insecure.Nmap
winget install -e --accept-source-agreements --accept-package-agreements --silent --id WinSCP.WinSCP
winget install -e --accept-source-agreements --accept-package-agreements --silent --id LSoftTechnologies.ActiveDiskImage
winget install -e --accept-source-agreements --accept-package-agreements --silent --id 7zip.7zip

# Everythink else
winget install -e --accept-source-agreements --accept-package-agreements --silent --id alexx2000.DoubleCommander
winget install -e --accept-source-agreements --accept-package-agreements --silent --id DeepL.DeepL
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Greenshot.Greenshot
winget install -e --accept-source-agreements --accept-package-agreements --silent --id PuTTY.PuTTY
winget install -e --accept-source-agreements --accept-package-agreements --silent --id Docker.DockerDesktop
 
# lid close action when on battery
powercfg -setdcvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 1

# lid close action when plugged in
powercfg -setacvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0

powercfg -SetActive SCHEME_CURRENT

# https://winaero.com/how-to-change-default-lid-close-action-on-windows-10/
# ACTION_ID	Action
# 0	Do nothing
# 1	Sleep
# 2	Hibernate
# 3	Shut down
 
# FastStartupDisable
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Name HiberbootEnabled -Value 0
