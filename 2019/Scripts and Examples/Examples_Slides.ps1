# 12 
Get-Service
Dir C:\

# 13 
$PSVersionTable

# 17 
Get-Help *log*
Help Get-EventLog

# 21 
Help Get-EventLog -ShowWindow

# 25 
Get-Help Get-EventLog -Online

# 31 
Get-Verb

# 32 
Get-Alias

# 33 
Show-Command Get-EventLog

# 38 
Get-PSProvider
cd HKCU:
cd Software
dir

# 39 
Get-PSDrive
cd cert:
cd localmachine
cd ca
dir

# 42 
cd HKCU:
cd Software
New-Item "ad*"
Get-Item "ad*"
Get-Item -LiteralPath "ad*"

# 46 
Get-Process | Export-CSV process.csv 
Import-CSV process.csv

# 47 
Get-Process | Out-GridView
Get-Service | ConvertTo-Html | Out-file services.html 

# 48 
notepad.exe
Get-Process -name notepad | Stop-Process
Get-Process | Stop-Process -WhatIf

# 53 
Get-Content Env:\PSModulePath

# 54
Register-PSRepository -Default
Find-Module Tesla

# 60
Get-Process | Get-Member

# 63
Get-Process | Select-Object -Property ProcessName,ID,VM
Get-Process | Select-Object -Property ProcessName,ID,VM | Sort-Object ID

# 66
cd $PSHOME
DotNetTypes.Format.ps1xml

# 67
Get-Process | Format-Table -Property * -AutoSize

# 68
Get-Service | Sort-Object Status | Format-Table -groupBy Status

# 69
Get-Service | Format-List *

# 70
get-service | format-wide -Column 4

# 71
Get-Process | Format-Table Name,@{name=‘VM (MB)’;expression={$_.VM / 1MB -as [int]}} -AutoSize

# 76
Get-Service -Name e*,s*

# 81
Get-Service | Where-Object {$_.Status -eq "Running"}

#99
Start-Job {dir} -Name DirJob
Get-Job
Receive-Job DirJob

# 115
$myVar = "Hello there"
$myVar = "GENERAL KENOBI"

# 116
$var = "localhost"
'what does $var contain?'
"what does $var contain?"

# 120
$services = get-services
$firstname = "$services[0].Name"
$firstname
$firstname = "$($services[0].Name)"

# 121
$int = Read-Host "Please give a number"
$int * 10
$int | gm
$int = [int]$int
$int * 10
$int | gm

 # 128
[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
$text = [Microsoft.VisualBasic.Interaction]::Inputbox("Message","Title","Default")
$text

# 130
write-output "Hello" | where-object { $_.length -gt 10 }
write-host "Hello" | where-object { $_.length -gt 10 }

# 138
Get-Process
Get-Service
.\PipelineExample.ps1

# 139
$myVar = "This is a var in the global scope."
$myVar
.\ScopeExample.ps1
$myVar