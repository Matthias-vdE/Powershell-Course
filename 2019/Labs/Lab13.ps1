<#
1 Run a commandlet that queries the Win32_BIOS (Get-WmiObject Win32_BIOS) information from your
computer, and store the results in a variable. #>

$results = Get-WmiObject Win32_BIOS

<#
2 Display the contents of that variable. #>

$results

<#
3 Export the variable’s contents to a CliXML file. #>

$results | Export-CliXML c:\temp\bios.xml