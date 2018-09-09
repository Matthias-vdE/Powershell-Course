<#
1 Make a one-to-one connection with a remote computer (or with localhost if
you have only one computer). Launch Notepad.exe. What happens? #>

Enter-PSSession -ComputerName localhost

#If this fails, remember you need winrm quickconfig first
#If it still fails, you may need to provide credentials:
$cred = Get-Credential
Enter-PSSession -ComputerName -Credential $cred
notepad.exe

<#
2 Using Invoke-Command, retrieve a list of services that aren’t started from one or
two remote computers (it’s OK to use localhost twice if you have only one
computer). Format the results as a wide list. (Hint: it’s OK to retrieve results and
have the formatting occur on your computer—don’t include the Formatcmdlets
in the commands that are invoked remotely.) #>

Invoke-Command –scriptblock {get-service | where {$_.status -eq "stopped"}} -computername Server01,Server02 | format-wide -Column 4

<#
3 Use Invoke-Command to get a list of the top 10 processes for virtual memory
(VM) usage. Target one or two remote computers, if you can; if you have only
one computer, target localhost twice. #>

Invoke-Command -scriptblock {get-process | sort VM -Descending | Select-first 10} –computername Server01,Server02

<#
4 Create a text file that contains three computer names, with one name per line.
It’s OK to use the same computer name, or localhost, three times if you have
access to only one computer. Then use Invoke-Command to retrieve the 100 newest
Application event log entries from the computer names listed in that file. #>

Invoke-Command -scriptblock {get-eventlog -LogName Application -Newest 100} -ComputerName (Get-Content computers.txt)

<#
5 Using Invoke-Command, query one or more remote computers to display the
properties ProductName, EditionID, and CurrentVersion from the registry key
HKEY_Local_Machine\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ .
(Hint: this requires you to get the property of an item.) #>

invoke-command –scriptblock{get-itemproperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\' | Select ProductName,EditionID,CurrentVersion} -computername Server01,Server02