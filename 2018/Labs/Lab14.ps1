<#
1 Create a background job that queries the Win32_BIOS (Get-WmiObject Win32_BIOS) information from two
computers (use localhost twice if you have only one computer to experiment
with). #>

Invoke-Command {Get-WmiObject Win32_BIOS} -Computername localhost,$env:computername -AsJob

<#
2 When the job finishes running, receive the results of the job into a variable. #>

$results = Receive-Job -ID 1 -Keep

<#
3 Display the contents of that variable. #>

$results

<#
4 Export the variable’s contents to a CliXML file. #>

$results | Export-CliXML c:\temp\bios.xml