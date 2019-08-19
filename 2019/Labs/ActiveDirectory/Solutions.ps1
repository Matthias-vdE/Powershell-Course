New-ADGroup -Name "Cheyenne" -Path "OU=AXXESTRAINEE,DC=AxxesTrainee,DC=com" -GroupScope Global
Add-ADGroupMember -Identity "Cheyenne" -Members (Get-ADUser -Filter {GivenName -eq "Cheyenne"})

New-ADGroup -Name "Carlie" -Path "OU=AXXESTRAINEE,DC=AxxesTrainee,DC=com" -GroupScope Global
Add-ADGroupMember -Identity "Carlie" -Members (Get-ADUser -Filter {GivenName -eq "Carlie"})

New-ADGroup -Name "Sales" -Path "OU=AXXESTRAINEE,DC=AxxesTrainee,DC=com" -GroupScope Global
Add-ADGroupMember -Identity "Sales" -Members Cheyenne,Carlie

Get-ADGroupMember "Sales" -Recursive

Get-ADUser -Filter {telephoneNumber -Like "(387)*"} | Out-GridView

Get-ADUser -Filter {telephoneNumber -Like "(387)*"} -Properties telephoneNumber | Select name,telephoneNumber

Get-ADUser -Filter {GivenName -Like "Z*"} | ForEach-Object{ Set-ADAccountPassword -Identity $_.Name -NewPassword (ConvertTo-SecureString "Temp123" -AsPlainText -Force) }

Get-ADUser -Filter * | ForEach-Object { Set-ADUser -Identity $_.Name -EmailAddress ("$($_.GivenName).$($_.Surname)@axxestrainee.com")}