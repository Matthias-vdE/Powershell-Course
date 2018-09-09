<#
1 In the Registry, go to HKEY_CURRENT_USER\software\microsoft\Windows\
-currentversion\explorer. Locate the Advanced key, and set its DontPrettyPath
property to 1. #>

cd HKCU:\software\microsoft\Windows\currentversion\explorer
Set-Location advanced
Set-ItemProperty -Path . -Name DontPrettyPath -Value 1

<#
2 Create a new directory called C:\Labs. #>

mkdir C:\Labs
New-Item -Path C:\Labs -ItemType Directory

<#
3 Create a zero-length file named C:\Labs\Test.txt (use New-Item). #>

New-Item -Path C:\Labs\Test.txt -ItemType File

<#
4 Is it possible to use Set-Item to change the contents of C:\Labs\Test.txt to
TESTING? Or do you get an error? If you get an error, why? #>

# No, the Filesystem Provider does not support this.

<#
5 Using the Environment provider, display the value of the system environment
variable %TEMP%. #>

Get-Item env:temp
Dir env:temp

<#
6 What are the differences between the -Filter, -Include, and -Exclude parameters
of Get-ChildItem? #>

# Include and Exclude must be used with –Recurse or if querying a container.
# Filter uses the PSProvider’s filter capability, which not all providers support.
# For example, you could use DIR –filter in the filesystem but not in the Registry— although you could use DIR –include in the Registry to achieve almost the same type of filtering result.