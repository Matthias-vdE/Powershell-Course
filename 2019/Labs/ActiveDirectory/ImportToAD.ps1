$Users = Import-Csv ADImport.csv

foreach ($User in $Users){

    New-ADUser -Name "$($User.GivenName) $($User.Surname)" -GivenName $User.GivenName -Surname $User.Surname -OtherAttribute @{telephoneNumber=$User.TelephoneNumber} -AccountPassword (ConvertTo-SecureString ($User.Password) -AsPlainText -Force) -Enabled $true
}
