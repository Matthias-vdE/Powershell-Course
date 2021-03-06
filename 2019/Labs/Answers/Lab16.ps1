<# 1. Import data 
#>

<# 
Run the script
#>

<#
2. Get user data from AD use Out-GridView
#>

Get-AdUser -Filter * | Out-GridView

<#
3. Create OU AXXESTRAINEE
#>

New-ADOrganizationalUnit -Name AXXESTRAINEE

<#
4. use filter to find users with name Cheyenne
#>

Get-AD-User -Filter {GivenName -eq "Cheyenne"}

<#
5. Create Global Group Cheyenne and add all Cheyenne's in it. Place these in OU AXXESTRAINEE
#>

New-ADGroup -Name "Cheyenne" -Path "OU=AXXESTRAINEE,DC=AxxesTrainee,DC=com" -GroupScope Global
Add-ADGroupMember -Identity "Cheyenne" -Members (Get-ADUser -Filter {GivenName -eq "Cheyenne"})

<#
6. Create Global Group Carlie and add all Carlie's in it. Place these in OU AXXESTRAINEE
#>

New-ADGroup -Name "Carlie" -Path "OU=AXXESTRAINEE,DC=AxxesTrainee,DC=com" -GroupScope Global
Add-ADGroupMember -Identity "Carlie" -Members (Get-ADUser -Filter {GivenName -eq "Carlie"})

<#
7. Create Group Sales and add groups Cheyenne and Carlie into it. Place these in OU AXXESTRAINEE
#>

New-ADGroup -Name "Sales" -Path "OU=AXXESTRAINEE,DC=AxxesTrainee,DC=com" -GroupScope Global
Add-ADGroupMember -Identity "Sales" -Members Cheyenne,Carlie

<#
8. Show the group members of Sales and its nested groups
#>

Get-ADGroupMember "Sales" -Recursive

<#
9. Find users with Phone number starting with 387 and show then in a table with Name and Telephone number
#>

Get-ADUser -Filter {telephoneNumber -Like "(387)*"} -Properties telephoneNumber | Select name,telephoneNumber

<#
10. Change password of all users starting with a Z 
#>

Get-ADUser -Filter {GivenName -Like "Z*"} | ForEach-Object{ Set-ADAccountPassword -Identity $_.Name -NewPassword (ConvertTo-SecureString "Temp123" -AsPlainText -Force) }

<#
11. Create users from list of 5 self invented users 
#>

$Users = Import-Csv ADImport.csv
foreach ($User in $Users){

    New-ADUser -Name "$($User.GivenName) $($User.Surname)" -GivenName $User.GivenName -Surname $User.Surname -OtherAttribute @{telephoneNumber=$User.TelephoneNumber} -AccountPassword (ConvertTo-SecureString ($User.Password) -AsPlainText -Force) -Enabled $true
}

<#
12. Get users and create email adress with first and last name
#>

Get-ADUser -Filter * | ForEach-Object { Set-ADUser -Identity $_.Name -EmailAddress ("$($_.GivenName).$($_.Surname)@axxestrainee.com")}