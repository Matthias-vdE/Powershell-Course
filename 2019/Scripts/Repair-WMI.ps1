<#
.SYNOPSIS
This script will repair a computer's interal WMI database.

.DESCRIPTION
Based on the guide from Dell: https://support.software.dell.com/vworkspace/kb/88861
Runs a number of cmd commands to delete and rebuild the entire WMI database.
Warning: Only use in case of serious WMI issues.

.PARAMETER computername
The computer namen to process. Default: Localhost.

.EXAMPLE
Repair-WMI -Computername 'SERVER2' 
#>

param (
    [String]$computername = 'localhost'
)

Try 
{
    $session = New-PSSession -computername $computername
    Invoke-Command -session $session -ScriptBlock {& net stop winmgmt /y}
    Invoke-Command -session $session -ScriptBlock {& cd C:\Windows\System32\wbem}
    Invoke-Command -session $session -ScriptBlock {& ren repository repository.old}
    Invoke-Command -session $session -ScriptBlock {& net start winmgmt /y}
    Invoke-Command -session $session -ScriptBlock {& cmd /C "for /f %s in ('dir /b *.mof') do mofcomp %s"}
    Invoke-Command -session $session -ScriptBlock {& cmd /C "for /f %s in ('dir /b en-us\*.mfl') do mofcomp en-us\%s"}
    Invoke-Command -session $session -ScriptBlock {& cmd /C "rd repository.old /S /Q"}
    
    Write-Output "WMI Repaired"
}
Catch 
{
    $ErrorMessage = $_.Exception.Message
    Write-Output "Something went wrong: $ErrorMessage"
}
Finally 
{
    Remove-PSSession $session
}