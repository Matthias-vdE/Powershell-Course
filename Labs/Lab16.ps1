<#
.Synopsis
Get drives based on percentage free space
.Description
This command will get all local drives that have less than the specified
percentage of free space available.
.Parameter Computername
The name of the computer to check. The default is localhost.
.Parameter MinimumPercentFree
The minimum percent free diskspace. This is the threshhold. The default value
is 10. Enter a number between 1 and 100.
.Example
PS C:\> Get-Disk -minimum 20
Find all disks on the local computer with less than 20% free space.
.Example
PS C:\> Get-Disk -comp SERVER02 -minimum 25
Find all local disks on SERVER02 with less than 25% free space.
#>
Param (
$Computername='localhost',
$MinimumPercentFree=10
)
#Convert minimum percent free
$minpercent = $MinimumPercentFree/100
Get-WmiObject -class Win32_LogicalDisk -computername $computername -filter "drivetype=3" | 
Where { $_.FreeSpace / $_.Size -lt $minpercent } | 
Select -Property DeviceID,FreeSpace,Size