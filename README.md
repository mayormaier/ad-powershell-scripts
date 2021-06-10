# powershell-scripts
powershell scrips used for batch sysadmin tasks in microsoft active directory

<br>

<img src=https://ad4noobs.justin-p.me/explain_ad.png alt="AD Meme">

## Summary
- `remove-ad-computers.ps1` Permanantly removes and deletes computers from Active Directory.
- `disable-ad-computers.ps1` Disables computers within AD and *optionally* moves them to the "disabled computers" OU. *see the note below for additional steps required to allow this functionality. It is disabled by default.*
- `disable-ad-users.ps1` Disables user accounts within AD and *optionally* moves them to the "disabled users" OU. *see the note below for additional steps required to allow this functionality. It is disabled by default.*
- **NEW** `remove-programs.ps1` Uninstalls programs on a specific machine. *Coming soon: Uninstall a list of progrms on multiple machines at once!*

## Running AD Management Scripts
1. Create a text file with the users or computers that need to be managed. Each usename or hostname should be on its own line. 
    - If you are *removing* computers from AD, name the file `deletecomputers.txt`
    - If you are *deleting* computers from AD, name the file `removecomputers.txt` 
    - If you are disabling users within AD, name the file `removeusers.txt`
2. Log in to the remote Domain Controller as a domain administrator.
3. Copy the appropriate PowerShell script and text file for the action being completed onto the remote DC’s desktop.
4. Run a new PowerShell window as administrator
5. In the new powershell window:
    - If you are removing computers from AD: type `C:\users\[admin username]\Desktop\remove-ad-computers.ps1`
    - If you are disabling computers from AD: type `C:\users\[admin username]\Desktop\disable-ad-computers.ps1` 
    - If you are disabling users within AD: type `C:\users\[admin username]\Desktop\disable-ad-users.ps1`
6. Run the command and prosper!

**NOTE:** In order to activate the movement of users between Organizational Units in AD, you must __first__ uncomment the command that moves them, and __second__ paste the appropriate `distinguishedName` of the *Disabled Users* OU. This applies to scrips that disable AD Users or Commputers, but do not remove them.

## Running Uninstallation Script
1. Create a text file with a lsit of programs that need to be removed from a machine. Name the file `removeprog.txt`.
2. Log into an administrator account on the computer that you are managing.
3. Copy the `remove-programs.ps1` script and the `removeprog.txt` file onto the administrator's desktop. 
4. Run a new PowerShell window as an administrator.
5. In the window, type `C:\users\[admin username]\Desktop\remove-programs.ps1`
6. Run the command and go out for lunch. This process might take a while.
