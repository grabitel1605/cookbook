<#
.SYNOPSIS
    Automatically downloads specified version of Firefox ESR, creates a new update.xml document, and restarts the webserver hosting the updates.
.EXAMPLE
    .\FirefoxUpdate.ps1
.NOTES
    Author: Jamison Fortner
    Last Edit: 02/12/2020
    Version 1.0 - Initial Release  
#>

#Self-hosted Firefox update website name
$ServerName = "Firefox Update Service"

# Setting up the inital values for the website URL.
$FFUpdateURL = "https://archive.mozilla.org/pub/firefox/releases/{0}esr/"
$FFSpecificArch = "update/win64/en-US/firefox-{0}esr.complete.mar"
$FFChecksumURL = "https://archive.mozilla.org/pub/firefox/releases/{0}esr/update/SHA512SUMS"
$FFUpdateFile = "firefox-{0}esr.complete.mar"

#File size variable
$FileSize

#Checksum variable
$Checksum

#XML Document template variable
$XMLDocument = @"
<?xml version="1.0" encoding="UTF-8"?>
<updates>
	<update type="major" displayVersion="{0}" appVersion="{1}" buildID ="{2}">
		<patch type="complete" URL="https://itc-wsus-1.itcdefense.com:8000/{3}" hashFunction="sha512" hashValue="{4}" size="{5}"/>
	</update>
</updates>
"@

#Getting date
$Date = Get-Date -Format "yyyyMMddHHmm"

#Prompting user to give Firefox version number.
$Version = Read-Host -Prompt "Please specify the version number. Do not put 'esr' at the end of the version number."
$Version_ESR = $Version + "esr"

#Adding the version number into the URL variables.
$FFUpdateURL = $FFUpdateURL -f $Version
$FFSpecificArch = $FFSpecificArch -f $Version
$FFUpdateFile = $FFUpdateFile -f $Version
$UpdateURL = $FFUpdateURL + $FFSpecificArch
$ChecksumURL = $FFChecksumURL -f $Version

#Creating this variable to be used to eliminate the length of the FFSpecificArch plus one.
$DeleteLength = 1 + $FFSpecificArch.Length

#Stopping the Firefox Update website
Stop-IISSite -Name $ServerName

#Moving to C:\Firefox-Updates
Set-Location C:\Firefox-Updates

#Deleting everything out of the Firefox update server folder so it can house the new update.
Remove-Item *

#Getting the update.
wget $UpdateURL 

#Getting the hash values downloaded.
wget $FFChecksumURL -Outfile hashvalues.txt

#Looking through the hashvalues.txt file to find the correct hash value.
foreach($line in [System.IO.File]::ReadLines("C:Firefox-Updates\hashvalues.txt"))
{ 
    if ($line -match $FFSpecificArch)
    {
        $Checksum = $line.Substring(0, $line.Length-$DeleteLength)
        break
    }
}

#Getting length of update .mar file
$FileSize = (Get-ChildItem $FFUpdateFile).length

#Creating the XML document
$XMLDocument -f $Version, $Version_ESR, $Date, $FFUpdateFile, $Checksum, $FileSize | Out-File "update.xml"

#Restarting the website
Start-IISSite -Name $ServerName
