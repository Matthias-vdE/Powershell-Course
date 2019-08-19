<#
1 Create a new Self-Signed Certificate
#>

New-SelfSignedCertificate -DnsName "www.axxes.com" -CertStoreLocation "cert:\LocalMachine\My" -Type CodeSigningCert

<#
2 Create a simple PowerShell script (.ps1 extension). This can also be a single command like Get-Service.
#>

notepad MyScript.ps1

<#
3 Try to run the script. What is your current Execution Policy?
#>

.\MyScript.ps1
Get-ExecutionPolicy

<#
4 Set the Execution Policy to AllSigned. Try to run the script again.
#>

Set-ExecutionPolicy AllSigned
.\MyScript.ps1

<#
5 Use the certificate from step 1 to sign your script, then try running it again.
If you get an error when signing, ensure that the certificate is in the Trusted Root of your user's certificate store.
#>

$cert = @(Get-ChildItem cert:\LocalMachine\My -codesigning)[0]
Set-AuthenticodeSignature -Certificate $cert -FilePath MyScript.ps1
.\MyScript.ps1

<#
6 
Open the file with a text editor. Notice hwo the file has been changed.
Try making a change and running it again. Why does this happen?
#>

<#
This happens because signing a script also places a hash at the end of the file which ensures the integrity.
If the file has been modified in any way, the signature will be invalid. That is the security of signing scripts.
#>