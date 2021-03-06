<#
For this lab, you have only one task: Run the Networking troubleshooting pack.

When you successfully do so, you’ll be asked for an Instance ID. Hit Enter, run a Web Connectivity check, and ask for help connecting to a specific web page. 
Use www.pluralsight .com/browse/it-ops as your test URL. We hope you get a “No problems were detected” report, meaning you ran the check successfully.

To accomplish this task, you need to discover a command capable of getting a troubleshooting pack, and another capable of executing a troubleshooting pack. 
You also need to discover where the packs are located and how they’re named. 
Everything you need to know is in PowerShell, and the help system will find it for you. #>

get-module *trouble* -list
import-module TroubleShootingPack
get-command -Module TroubleShootingPack
help get-troubleshootingpack –full
help Invoke-TroubleshootingPack -full
dir C:\windows\diagnostics\system
$pack=get-troubleshootingpack C:\windows\diagnostics\system\Networking
Invoke-TroubleshootingPack $pack
Enter
1
2
https://www.pluralsight.com/browse/it-ops
