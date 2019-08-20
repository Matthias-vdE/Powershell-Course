<# 
1 Run Update-Help and ensure that it completes without errors, so that you have
a copy of the help on your local computer. You need an internet connection,
and the shell needs to run under elevated privileges (which means Administrator
must appear in the shell window’s title bar). #>

Update-Help

<# 
2 Windows-only: can you find any cmdlets capable of converting other cmdlets’
output into HTML? #>

help html
Get-Command -Noun html

<#
3 Partially Windows-only: are there any cmdlets that can redirect output into a
file, or to a printer? #>

Get-Command -Noun file,printer

<#
4 How many cmdlets are available for working with processes? (Hint: remember
that cmdlets all use a singular noun.) #>

Get-Command -Noun Process
Help *Process

<#
5 What cmdlet might you use to write to an event log? (This one’s possible on non-
Windows operating systems, but you’ll get a different answer.) #>

Get-Command -Verb write -Noun eventlog
Help *log

<#
6 You’ve learned that aliases are nicknames for cmdlets; what cmdlets are available
to create, modify, export, or import aliases? #>

Help *alias
Get-Command -Noun Alias

<#
7 Is there a way to keep a transcript of everything you type in the shell, and save
that transcript to a text file? #>

Help transcript

<#
8 Windows-only: it can take a long time to retrieve all of the entries from the
Security event log. How can you get only the 100 most recent entries? #>

Help Get-EventLog -Parameter Newest

<#
9 Windows-only: is there a way to retrieve a list of the services that are installed on
a remote computer? #>

Help Get-Service -Parameter Computername

<#
10 Is there a way to see what processes are running on a remote computer? (You can
find the answer on non-Windows operating systems, but the command itself
might not work for you.) #>

Help Get-Process -Parameter Computername

<#
11 Examine the help file for the Out-File cmdlet. The files created by this cmdlet
default to a width of how many characters? Is there a parameter that would
enable you to change that width? #>

Help Out-File -Full
Help Out-File -Parameter Width

<#
12 By default, Out-File overwrites any existing file that has the same filename as
what you specify. Is there a parameter that would prevent the cmdlet from overwriting
an existing file? #>

Help Out-File -Full
Help Out-File -Parameter NoClobber

<#
13 How could you see a list of all aliases defined in PowerShell?
#>

Get-Alias

<#
14 Using both an alias and abbreviated parameter names, what is the shortest command
line you could type to retrieve a list of running processes from a computer
named Server1? #>

PS -C Server1

<#
15 How many cmdlets are available that can deal with generic objects? (Hint:
remember to use a singular noun like object rather than a plural one like objects.) #>

Get-Command -Noun Object

<#
16 This chapter briefly mentioned arrays. What help topic could tell you more
about them? #>
Help about_arrays
Help *array*