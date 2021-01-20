<#
.Synopsis

###################################################################
#Description	: LanSweeper Agent Remote Installer                                                                                      
#Author       	: Aaron Dehne, Richard Goddard, Jamison Fortner                                              
#Email         	: helpdeskd@itcdefense.com                                         
###################################################################

.Description

    Installs LanSweeper Agent from an elevated prompt to a single1 remote workstation. 

.Example

    #Example of how to use this cmdlet

.Example

    #Another example of how to use this cmdlet
#>

$computerName = Read-Host -Prompt "Enter Computer Name"
$user = Read-Host -Prompt "Enter your admin username"
$cred = Get-Credential $user


    If (Test-Connection -ComputerName $computerName -Quiet)
    {
        try {
            $session = New-PSSession -ComputerName $computerName -Credential $cred
            $file = '\\itc-server\users\software\LSAgent\lsa-windows.exe'
            Write-Host 'Attempting to copy file from remote share.'
            Copy-Item -Path $file -ToSession $session -Destination 'c:\lsa-windows.exe'
            If (Invoke-Command -ComputerName $computername {Test-Path 'c:\lsa-windows.exe' -PathType Leaf})
            {
                Write-Host 'File written successfully.';
                    Invoke-Command -Session $session -ScriptBlock {
                    Start-Process c:\lsa-windows.exe -ArgumentList '--server nis1.itcdefense.com --port 9524 --agentkey e76ba9f9-a040-4926-af92-e971aeddee51 --mode unattended' -Wait;
                    $file = Test-Path 'c:\lsa-windows.exe' -PathType Leaf;
                    Write-host "File Exists: $file";
                    Write-Host "Deleting file!";
                    del "C:\lsa-windows.exe";
                    $file = Test-Path 'c:\lsa-windows.exe' -PathType Leaf;
                    Write-host "File Exists: $file";
                    }
            }
            Write-Host "Installation Complete!"
        }
        catch {
            Write-Output "This computer's connection has failed:" $computerName
            Write-Output "A list of failed computer names will be in Failed.txt"
            $computerName | Out-File -Append -FilePath .\Failed.txt
        }
            
        Remove-PSSession $session
    }
    Else {
        Write-Output "This computer did not successfully connect: $computerName"
    }
