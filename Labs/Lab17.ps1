Function Get-RandomPassword {
    <#
    .SYNOPSIS
    Generates a random password.
    .DESCRIPTION
    Generates a random password, containg both letters, numbers and special characters.
    Based on the ASCII table ranging from characters 33 to 126. Basicly everything except special control characters.
    .EXAMPLE
    PS C:\> Get-RandomPassword -Length 15
    This generates a random password of 15 characters.
    .PARAMETER Length
    Length specifies the length of the generated password. Default is 10.
    .PARAMETER AlphaNumericOnly
    Switch parameter to specify whether the password generated should be alphanumerical only or not (no special characters).
    #>
    Param (
        [int]$Length = 10,
        [switch]$AlphaNumericOnly
    )

    if ($AlphaNumericOnly -eq $false) {
        $min = 33
        $max = 127
    }
    else {
        $min_numbers = 48
        $max_numbers = 58
        $min_uppercase = 65
        $max_uppercase = 91
        $min_lowercase = 97
        $max_lowercase = 123
    }

    $password = ""
    if ($AlphaNumericOnly -eq $true) {
        for ($counter = 1; $counter -le $length; $counter++) {
            $randomcharset = Get-Random -Min 1 -Max 4
            if ($randomcharset -eq 1) {
                $random = Get-Random -Minimum $min_numbers -Maximum $max_numbers
                $password += [char]$random   
            }
            elseif ($randomcharset -eq 2) {
                $random = Get-Random -Minimum $min_uppercase -Maximum $max_uppercase
                $password += [char]$random     
            }
            else {
                $random = Get-Random -Minimum $min_lowercase -Maximum $max_lowercase
                $password += [char]$random  
            }
        }
    }
    else {
        for ($counter = 1; $counter -le $length; $counter++) {
            $random = Get-Random -Minimum $min -Maximum $max
            $password += [char]$random
        }
    }
    return $password
}

Function Get-PasswordStrength {
    <#
    .SYNOPSIS
    Checks the strength of a password.
    .DESCRIPTION
    Checks the strength of a password. Solely based on the length.
	Graded from 0 (very bad, less than 3) to 5 (very good, more than 15). 
    .EXAMPLE
    PS C:\> Get-PasswordStrength -Password 123
    This password will get a strength rating of 0.
    .EXAMPLE
    PS C:\> Get-PasswordStrength -Password abc1234
    This password will get a strength rating of 2.
    .PARAMETER Password
    Specify the password to check as a string.
    #>
    Param (
        [Parameter(Mandatory = $True)]
        [String]$Password
    )
    $Strength = 0
    if ($Password.Length -le 3) {
        $Strength = 0
    }
    elseif (($Password.Length -gt 3) -and ($Password.Length -le 6)) {
        $Strength = 1
    }
    elseif (($Password.Length -gt 6) -and ($Password.Length -le 9)) {
        $Strength = 2
    }
    elseif (($Password.Length -gt 9) -and ($Password.Length -le 12)) {
        $Strength = 3
    }
	elseif (($Password.Length -gt 12) -and ($Password.Length -le 15)) {
        $Strength = 4
    } 
	else {
		$strength = 5
	}
	if ($Password -match '^[a-zA-Z0-9]+$') {
		If ($Strength -gt 0) {
			$Strength -= 1;
		}
	}
    return $Strength
}

#Tests
Get-RandomPassword
Get-RandomPassword -AlphaNumericOnly

$password1 = Get-RandomPassword -Length 3
$rating1 = Get-PasswordStrength $password1
$password2 = Get-RandomPassword -Length 7
$rating2 = Get-PasswordStrength $password2
$password3 = Get-RandomPassword -Length 20 -AlphaNumericOnly
$rating3 = Get-PasswordStrength $password3

Write-Output "Password $password1 has a rating of $rating1"
Write-Output "Password $password2 has a rating of $rating2"
Write-Output "Password $password3 has a rating of $rating3"