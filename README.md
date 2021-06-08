# powershell-scripts
powershell scrips used for sysadmin tasks in microsoft active directory

## Running AD Management Scripts
1. Create a text file with the users or computers that need to be managed. Each usename or hostname should be on its own line. 
    - If you are removing computers from AD, name the file `deletecomputers.txt` 
    - If you are disabling users within AD, name the file `removeusers.txt`
2. Log in to the remote Domain Controller as `nst`.
3. Copy the appropriate PowerShell script and text file for the action being completed onto the remote DC’s desktop.
4. Run a new PowerShell window as administrator
5. In the new powershell window:
    - If you are removing computers from AD: type `C:\users\nst\Desktop\remove-ad-computers` 
    - If you are disabling users within AD: type `C:\users\nst\Desktop\disable-ad-users`
6. Run the command and prosper!

**NOTE:** In order to activate the movement of users between Organizational Units in AD, you must __first__ uncomment the command that moves them, and __second__ paste the appropriate `distinguishedName` of the *Disabled Users* OU. 
