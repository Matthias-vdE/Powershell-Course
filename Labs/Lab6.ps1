<#
1. Create two similar, but different, text files. Try comparing them by using Diff. Run
something like this: Diff -reference (Get-Content File1.txt) -difference
(Get-Content File2.txt). If the files have only one line of text that’s different,
the command should work. #>

"I am the walrus" | Out-File file1.txt
"I'm a believer" | Out-File file2.txt
$f1 = Get-Content .\File1.txt
$f2 = Get-Content .\File2.txt
Diff $f1 $f2

<#
2 What happens (on Windows) if you run Get-Service | Export-CSV services
.csv | Out-File from the console? Why does that happen? #>

# You will get an error because you didn't specify a filename for Out-File.
# But even if you do, Out-File does nothing because the file gets created by Export-CSV.

<#
3 Apart from getting one or more services and piping them to Stop-Service,
what other means does Stop-Service provide for you to specify the service or
services you want to stop? Is it possible to stop a service without using Get
-Service at all? #>

# Stop-Service has a -Name parameter.
Stop-Service -Name spooler

<#
4 What if you want to create a pipe-delimited file instead of a comma-separated
(CSV) file? You’d still use the Export-CSV command, but what parameters
would you specify? #>

Export-CSV services.csv -Delimiter "|"

<#
5 Is there a way to eliminate the # comment line from the top of an exported CSV
file? That line typically contains type information, but what if you want to omit
that from a particular file? #>

Export-CSV -NoTypeInformation

<#
6 Export-CliXML and Export-CSV both modify the system because they can create
and overwrite files. What parameter would prevent them from overwriting
an existing file? What parameter would ask whether you were sure before proceeding
to write the output file? #>

Export-CSV -NoClobber
Export-CSV -Confirm

<#
7 Windows maintains several regional settings, which include a default list separator.
On U.S. systems, that separator is a comma. How can you tell Export-CSV to
use the system’s default separator rather than a comma? #>

Export-CSV -UseCulture