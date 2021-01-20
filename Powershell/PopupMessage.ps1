Function remote_message{

$server = read-host -prompt 'Input PC name';
$message = read-host -prompt 'Enter the message';
$cred = Get-Credential;

Invoke-WmiMethod -Class win32_process -Credential $cred -ComputerName $server -Name create -ArgumentList  "c:\windows\system32\msg.exe * $message" }

remote_message