<#
1 Create a one-time background job to find all the PowerShell scripts on the C:
drive. Any task that might take a long time to complete is a great candidate for a
job. #>

Start-Job {dir c:\ -recurse -filter '*.ps1'}

<#
2 You realize it would be helpful to identify all PowerShell scripts on some of your
servers. How would you run the same command from task 1 on a group of
remote computers? #>

Invoke-Command -ScriptBlock {dir c:\ -recurse -filter '*.ps1'} -Computername (Get-Content c:\servers.txt) -AsJob

<#
3 Create a background job that will get the latest 25 errors from the system event
log on your computer and export them to a CliXML file. You want this job to
run every day, Monday through Friday, at 6 a.m., in order for it to be ready for
you to look at when you come in to work. #>

$Trigger = New-JobTrigger -At "6:00AM" -DaysOfWeek "Monday", "Tuesday","Wednesday","Thursday","Friday" –Weekly
$command = { Get-EventLog -LogName System -Newest 25 -EntryType Error | Export-Clixml c:\Errors.xml} 
Register-ScheduledJob -Name "Get 25 System Errors" -ScriptBlock $Command -Trigger $Trigger

<#
4 What cmdlet would you use to get the results of a job, and how would you save
the results in the job queue? #>

Receive-Job -ID 1 -Keep