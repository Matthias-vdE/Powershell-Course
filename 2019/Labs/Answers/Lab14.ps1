<#
1 Use Write-Output to display the result of 100 multiplied by 10. #>

Write-Output (100*10)

<#
2 Use Write-Host to display the result of 100 multiplied by 10. #>

Write-Host (100*10)

<#
3 Prompt the user to enter a name, and then display that name in yellow text. #>

$name = Read-Host "Enter a name"
Write-Host $name -ForegroundColor Yellow

<#
4 Prompt the user to enter a name, and then display that name only if it’s longer
than five characters. Do this all with a single PowerShell expression—don’t use
a variable. #>

Read-Host "Enter a name" | Where {$_.length -gt 5}