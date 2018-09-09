<#
1 Display a table of processes that includes only the process names, IDs, and
whether they’re responding to Windows (the Responding property has that
information). Have the table take up as little horizontal room as possible, but
don’t allow any information to be truncated. #>

Get-Process | Format-Table Name,ID,Responding -AutoSize -Wrap

<#
2 Display a table of processes that includes the process names and IDs. Also
include columns for virtual and physical memory usage, expressing those values
in megabytes (MB). #>

Get-Process | Format-Table Name,ID,@{Name='VirtualMB';Expression={$_.VM/1MB}},@{Name='PhysicalMB';Expression={$_.WorkingSet/1MB}} -AutoSize

<#
3 Use Get-EventLog on Windows to display a list of available event logs. (Hint:
you need to read the help to learn the correct parameter to accomplish that.)
Format the output as a table that includes, in this order, the log display name
and the retention period. The column headers must be LogName and RetDays. #>

Get-EventLog -List | Format-Table @{n='LogName';e={$_.LogDisplayName}},@{n='RetDays';e={$_.MinimumRetentionDays}} -AutoSize

<#
4 Display a list of services so that a separate table is displayed for services that are
started and services that are stopped. Services that are started should be displayed
first. (Hint: use a -groupBy parameter.) #>

Get-Service | Sort Status -Descending | Format-Table -groupBy Status

<#
5 Display a four-column-wide list of all directories in the root of the C: drive. #>

dir c:\ | fw -column 4

<#
6 Create a formatted list of all .exe files in C:\Windows displaying the name, version
information, and file size. PowerShell uses the length property, but to
make it clearer, your output should show Size. #>

dir c:\windows\*.exe | fl Name,VersionInfo,@{n='Size';e={$_.Length}}