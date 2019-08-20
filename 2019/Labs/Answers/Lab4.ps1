<#
1 Display a list of running processes. #>

Get-Process

<#
2 Display the 100 most recent entries from the Application event log. (Don’t use
Get-WinEvent for this. We’ve shown you another command that will do this
task.) This is for Windows operating systems only. #>

Get-EventLog -LogName Application -Newest 100

<#
3 Display a list of all commands that are of the cmdlet type. (This is tricky—we’ve
shown you Get-Command, but you’re going to have to read the help to find out
how to narrow down the list as we’ve asked.) #>

Get-Command -CommandType Cmdlet

<#
4 Display a list of all aliases. #>

Get-Alias

<#
5 Make a new alias, so you can run np to launch Notepad from a PowerShell
prompt. This is for Windows only unless you’ve installed wine on Linux. #>

New-Alias -Name "np" -Value "notepad.exe" -Description "Opens notepad."

<#
6 Display a list of services that begin with the letter M. Again, read the help for the
necessary command—and don’t forget that the asterisk (*) is a near-universal
wildcard in PowerShell. Note that this will work only on Windows operating
systems. #>

Get-Service -Name "M*"

<#
7 Display a list of all Windows Firewall rules. You’ll need to use Help or Get
-Command to discover the necessary cmdlet. Again, this will work only on Windows
operating systems. #>

Get-NetFirewallRule -All

<#
8 Display a list only of inbound Windows Firewall rules. You can use the same
cmdlet as in the previous task, but you’ll need to read its help to discover the
necessary parameter and its allowable values. Once more, Windows operating
systems only for this one. #>

Get-NetFirewallRule -Direction Inbound