# ~Script By SPC Burgess 2-3 FA S6 03/17/2021
# MOS: 25B & 25U
<#
#####################################################
    Big thanks to Reddit Friends / Sources
 for making this script possible. The goal here
 is to make things easier for IMO's. If you get
 a moment feel free to check out this code. If 
 I am still in the Army apon you reading this,
 feel free to reach out with any feedback. 

    Contact: drew.j.burgess.mil@mail.mil
#####################################################
#>


Function Draw-Test {
cls
# Call Sys ASM Functions
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

Add-Type -AssemblyName 'Microsoft.VisualBasic, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'

# enable rich visual styles in PowerShell console mode:
[System.Windows.Forms.Application]::EnableVisualStyles()

<#
#####################################################
            Front End Functions start Here 
#####################################################
#>

#This creates the form and sets its size and position
$objForm = New-Object System.Windows.Forms.Form 
$objForm.Text = "[SA/WA] Applications"
$objForm.Size = New-Object System.Drawing.Size(300,615)
$objForm.AcceptButton = $OKButton
$objForm.CancelButton = $CANCELButton
$objForm.StartPosition = "CenterScreen"
$objForm.FormBorderStyle = 'Fixed3D'
$objForm.MaximizeBox = $false
$Script:CANCELED=$False
[Bool]$ScriptStatus=$False 

$iconConverted2Base64 = [Convert]::ToBase64String((Get-Content "C:\temp\Launcher\Dependencies\icon\NewPanda.ico" -Encoding Byte))
$iconBase64           = $iconConverted2Base64
$iconBytes            = [Convert]::FromBase64String($iconBase64)
$stream               = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)
$stream.Write($iconBytes, 0, $iconBytes.Length);
$iconImage            = [System.Drawing.Image]::FromStream($stream, $true)
$objForm.Icon    = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())
# ico converter : https://cloudconvert.com/png-to-ico

#This is defines what Enter & escape do when pressed
$objForm.KeyPreview = $True
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Enter"){$HNorIPV4=$objTextBox1.Text;$title=$objDepartmentListbox.SelectedItem;$office=$objOfficeListbox.SelectedItem;$objForm.Close()}})
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Escape"){$Script:CANCELED=$True;$objForm.Close()}})

#Initial Script Status NOTE: I tried to make this a dynamic var, powershell is just to primitive to do that type of programming.  
$objScriptCheckInActive = New-Object System.Windows.Forms.Label
$objScriptCheckInActive.Location = New-Object System.Drawing.Size(80,495) 
$objScriptCheckInActive.Size = New-Object System.Drawing.Size(280,20) 
$objScriptCheckInActive.ForeColor = [System.Drawing.Color]::FromName("Blue")
$objScriptCheckInActive.Text = "Script Ready"
$objForm.Controls.Add($objScriptCheckInActive)
  

#This creates a label for the TextBox1
$objLabel1 = New-Object System.Windows.Forms.Label
$objLabel1.Location = New-Object System.Drawing.Size(10,20) 
$objLabel1.Size = New-Object System.Drawing.Size(280,20)
[String]$MandatoryWrite = "*" 
$objLabel1.ForeColor = [System.Drawing.Color]::FromName("Red")
$objLabel1.Text = "Enter Hostname or IPV4 Address $MandatoryWrite"
$objForm.Controls.Add($objLabel1) 

#This creates the TextBox1
$objTextBox1 = New-Object System.Windows.Forms.TextBox 
$objTextBox1.Location = New-Object System.Drawing.Size(10,40) 
$objTextBox1.Size = New-Object System.Drawing.Size(260,20)
$objTextBox1.TabIndex = 0 
$objForm.Controls.Add($objTextBox1)

#This creates a label for the TextBox2
$objLabel2 = New-Object System.Windows.Forms.Label
$objLabel2.Location = New-Object System.Drawing.Size(10,70) 
$objLabel2.Size = New-Object System.Drawing.Size(280,20) 
$objLabel2.Text = "Choose Applications to Install:"
$objForm.Controls.Add($objLabel2)

#This creates a label for script status
$objLabel3 = New-Object System.Windows.Forms.Label
$objLabel3.Location = New-Object System.Drawing.Size(10,495) 
$objLabel3.Size = New-Object System.Drawing.Size(280,20) 
$objLabel3.Text = "Script Status:"
$objForm.Controls.Add($objLabel3) 

#This creates a label for the POC (Point Of Contact)
$objLabelPOC = New-Object System.Windows.Forms.Label
$objLabelPOC.Location = New-Object System.Drawing.Size(17,560) 
$objLabelPOC.Size = New-Object System.Drawing.Size(280,20) 
$objLabelPOC.Text = "Point of Contact: 915-741-4627"
$objForm.Controls.Add($objLabelPOC)

#This creates a label for the Credits
$objLabelCredits = New-Object System.Windows.Forms.Label
$objLabelCredits.Location = New-Object System.Drawing.Size(15,545) 
$objLabelCredits.Size = New-Object System.Drawing.Size(280,20) 
$objLabelCredits.Text = "Application Created By SPC Burgess 2-3FA S6 v3.0"
$objForm.Controls.Add($objLabelCredits)   

#This Creates Button Accept
$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Size(10,515)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = "RUN"
$OKButton.Add_Click({
If (($Script:CANCELED -eq $True)) { # If script is exited with "cancel" button or "escape" key. 
    Write-Host "Script Exited all processes Successfully" -ForegroundColor Yellow
}
else {

# Just leaving my mark :D
Write-Host "************************************************************`n`n   Script Created By SPC Burgess 2-3 FA S6 Fort Bliss TX`n`n************************************************************" -ForegroundColor Cyan      
Write-Host "`n"
Sleep 2

    # Edit any of these directories in the event the Network Enterprise Center Changes there app locations.
    $GChromeDirectory = Get-Content -LiteralPath 'C:\temp\Launcher\Dependencies\Directories\google_chrome.txt' -Force
    $FireFoxDirectory = Get-Content -LiteralPath 'C:\temp\Launcher\Dependencies\Directories\firefox.txt'
    $MSTeamsDirectory = Get-Content -LiteralPath 'C:\temp\Launcher\Dependencies\Directories\teams.txt'
    $CitrixxDirectory = Get-Content -LiteralPath 'C:\temp\Launcher\Dependencies\Directories\Citrix.txt'
    $MedicalDirectory = Get-Content -LiteralPath 'C:\temp\Launcher\Dependencies\Directories\DCAM.txt'
    $GSSARMYDirectory =                          'C:\temp\GCSS_Army_Integrated_Installer_4_16_0.exe'
    $GEarthDirectory  = $null
    $ACROBATDCPRO     = Get-Content -LiteralPath 'C:\temp\Launcher\Dependencies\Directories\acrobatDCPro.txt'    
    $SHAREPOINTDESIGNER = Get-Content -LiteralPath 'C:\temp\Launcher\Dependencies\Directories\sharepoint_editor.txt'
    
If ($objDisableLogsCheckbox.Checked -eq $True) {
    [String]$Nothing = $null
    If ($HNorIPV4 -cne $Nothing) # If input is not equal to null data..
    {
        # DO NOT EDIT BELOW THIS LINE!!!!
        # Chrome 
        If ($objChromeCheckbox.Checked -eq $True)
        {
            Write-Host "Installing Google Chrome on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s -d -i $GChromeDirectory
            return "Chrome Installer finished on remote host : $Computers"; # Continue
        }
        # FireFox
        If ($objFireFoxCheckbox.Checked -eq $True) 
        {
            Write-Host "Installing FireFox on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s -d -i $FireFoxDirectory
            return "FireFox Installer finished on remote host : $Computers"; # Continue
        }
        # MS Teams
        If ($objMSTEAMSCheckbox.Checked -eq $True) 
        {
            Write-Host "Copying MS Teams to 'C:\temp' directory on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s -d -i $MSTeamsDirectory
            return "MS Teams finished copying on remote host : $Computers"; # Continue
        }
        # Citrix
        If ($objCitrixCheckbox.Checked -eq $True) 
        {
            Write-Host "Installing Citrix on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -c -f -s -d -i $CitrixxDirectory
            return "Citrix Installer finished on remote host : $Computers"; # Continue
        }
        # DCAM
        If ($objDCAMCheckbox.Checked -eq $True) 
        {
            Write-Host "Installing DCAM on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -c -f -s -d -i $MedicalDirectory
            return "DCAM Installer finished on remote host : $Computers"; # Continue
        }
        # GSS Army (WinGUI)
        If ($objWinGUICheckbox.Checked -eq $True) 
        {
            Write-Host "`nDownloading Data Please Wait..." -ForegroundColor Cyan
            xcopy "C:\temp\Launcher\Dependencies\Packages\GCSSArmyIntegratedInstaller4160.zip" "\\$Computers\C$\temp" /H /Y
            Write-Host "`nExtracting Data Please Wait..." -ForegroundColor Cyan
            Sleep 1
            PSEXEC \\$Computers -s Powershell -command Expand-Archive -Path "C:\temp\GCSSArmyIntegratedInstaller4160.zip" -DestinationPath "C:\temp"
            Write-Host "`nSuccessfully Extracted Data" -ForegroundColor Green 
            Sleep 1
            Write-Host "`nDeleting Zip Archive From Remote Host : $Computers" -ForegroundColor Cyan
            PSEXEC \\$Computers -s Powershell -command Remove-Item -Path "C:\temp\GCSSArmyIntegratedInstaller4160.zip" -Force
            Write-Host "Installing WinGUI on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s -d -i $GSSARMYDirectory
            Sleep 1 
            Write-Host "`nScript Finished, Script Ready!" -ForegroundColor Green
            return "WinGUI Installer requires interaction on remote host : $Computers"; # Continue
        }
        # Adobe Acrobat DC Pro
        If ($objAdobeDCPROCheckbox.Checked -eq $True) 
        {
            Write-Host "Installing Adobe DC Pro on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s -d -i $ACROBATDCPRO /A /R
            return "Adobe Installer finished on remote host : $Computers"; # Continue
        }
        # Share Pointer Designer
        If ($objSharePointDesigner2013Checkbox.Checked -eq $True) 
        {
            Write-Host "Installing Sharepoint Designer 2013 on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s -d -i $SHAREPOINTDESIGNER
            return "Sharepoint Designer 2013 Installer finished on remote host : $Computers"; # Continue
        }
        If ($objJoeSmithCheckbox.Checked -eq $True) 
        {
            Write-Host "`nCreating Joe.Smith Local Administrator on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s net user Joe.Smith 37Jek!*T4g37Jek /add /Y
            Write-Host "`nCreated Joe.Smith Local Administrator on remote Computer : $Computers" -ForegroundColor Green
            Sleep 2 
            Write-Host "`nApplying Permissions to Joe.Smith Local Administrator on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s net localgroup Administrators Joe.Smith /add
            Sleep 2
            $JoeSmithCreds = "USERNAME: .\Joe.Smith`nPASSWORD: 37Jek!*T4g37Jek`n`nHostname: $Computers"
            # Create File 
            Remove-Item -LiteralPath "C:\temp\Launcher\Logs\JoeSmith.txt"
            Sleep 2
            New-Item -Path "C:\temp\Launcher\Logs" -Name "JoeSmith.txt" -ItemType "file" -Force
            # Write Content To File
            Set-Content -Path "C:\temp\Launcher\Logs\JoeSmith.txt" -Value ($JoeSmithCreds)
            Sleep 4
            Write-Host "`n`n`nLogin Credentials Logged to JoeSmith.txt at Path : $Paths" -ForegroundColor Cyan 
            return "`nFinished Installing Joe Smith on remote host : $Computers"; # Continue  
        }
        # Google Earth 
        If ($objGEarthCheckbox.Checked -eq $True) 
        {
            #Write-Host "Google Earth Installer Started on remote Computer : $Computers" -ForegroundColor Cyan
            Write-Host "Google Earth Installer Currently unavailable`n" -ForegroundColor Yellow
            #C:\Windows\System32\PsExec.exe \\$Computers -s -d -i $GEarthDirectory
            return "Remote Process Canceled on remote host : $Computers"; # Continue
        }
      return "No applications selected program safely exiting";
      }# End of If info != Null
    }# End of IF Disable logging 
else {


# Global for recieved data from Input box..
$Computers = $objTextBox1.Text

# Check if PS_Tools Exists on Script Users computer.. 
$exactadminfile = "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\PsExec.exe" #First folder to check the file
$userfile = "C:\Windows\System32" #Second folder to check the file
$FinalFileString = "$exactadminfile`n$userfile" # New line = `n

# Checks if Path C:\temp\PS_ToolsLog exists if not write path + File Contents, elseif path exists but no data write file contents, else continue.
$Path = ""
$Paths = 'C:\temp\Launcher\Logs'
$Paths2DebugLog = 'C:\temp\Launcher\Logs\DebugLog.txt'
$FileToRead = 'FileCheckLog.txt'
$Date = Get-Date
$DebugLogContent = 'ApplicationsGUI.ps1 Log : Script API ran at :'

# Log Path to PsExec for download.
# Debug log for date script used + other info later..
Foreach ($Path in $Paths) {
    if ((Test-Path $Path) -and !(Test-Path $Path)) {# If hard coded Path doesnt exist..
        # Create Content DIR
        if ((Test-Path "C:\temp\Launcher") -and !(Test-Path "C:\temp\Launcher")) {
            New-Item -Path "C:\temp\" -Name "Launcher" -ItemType "directory" -Force
        }
      }
    else {
        Sleep 3
        If ((Test-Path -LiteralPath "C:\temp\Launcher\Logs") -and !(Test-Path -LiteralPath "C:\temp\Launcher\Logs")) {
            New-Item -Path "C:\temp\Launcher\" -Name "Logs" -ItemType "directory" -Force
        }
        elseIf ((Test-Path -LiteralPath "C:\temp\Launcher\Logs\FileCheckLog.txt") -and !(Test-Path -LiteralPath "C:\temp\Launcher\Logs\FileCheckLog.txt")) {
        Sleep 3
        # Create File @DIR
        Write-Host "`n`nFileChecklog Found!" -ForegroundColor Cyan
        Sleep 3
        # Write Content To File
        Set-Content -Path "C:\temp\Launcher\Logs\FileCheckLog.txt" -Value ($FinalFileString)
        Sleep 3
        Write-Host "`n`nFileCheckLog Updated!" -ForegroundColor Green
        }
        else {
        Write-Host "`n`nCreating PSEXEC Install Dependencies" -ForegroundColor Cyan
        Sleep 3
        # Create File @DIR
        New-Item -Path "C:\temp\Launcher\Logs" -Name "FileCheckLog.txt" -ItemType "file" -Force
        Sleep 3
        # Write Content To File
        Set-Content -Path "C:\temp\Launcher\Logs\FileCheckLog.txt" -Value ($FinalFileString)
        Sleep 3
        }
      } 
   IF ((Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt" -ErrorAction SilentlyContinue) -eq ($null))  {# if file's content's = null (Nothing) blank data
          Write-Host "`nPath : $Paths exists. Writing Data to File : $FileToRead" -ForegroundColor Cyan
          # Write Content To File
          Set-Content -Path "C:\temp\Launcher\Logs\FileCheckLog.txt" -Value ($FinalFileString)
          #create Debuglog
          Write-Host "`nDebug Log not found" -ForegroundColor Yellow
          Sleep 1
          Write-Host "`nCreating DebugLog.txt" -ForegroundColor Cyan
          New-Item -Path $Paths -Name "DebugLog.txt" -ItemType "file" -Force # Create Debug Log
          Sleep 2 # Give script time to verify
          Write-Host "`nDebug Log Created at path : $Paths" -ForegroundColor Green
          Sleep 1 # Give Script Time to Write
          Write-Host "`nLogging Data to DebugLog.txt" -ForegroundColor Cyan
          Sleep 4 # Give Script Time to Log Data
          Set-Content -Path "C:\temp\Launcher\Logs\DebugLog.txt" -Value ($DebugLogContent) -ErrorAction SilentlyContinue    # Log Description 
          Add-Content -Path "C:\temp\Launcher\Logs\DebugLog.txt" -Value ($Date) -ErrorAction SilentlyContinue               # Log Date 
          Write-Host "`nDirectory $Paths and $FileToRead exist with contents.`nChecking if PsExec exists at Path : $userfile." -ForegroundColor Green
          Sleep 5
    }
    else {
        Write-Host "`nPath : $Paths exists. Writing Data to File : $FileToRead" -ForegroundColor Cyan
        # Write Content To File
        Set-Content -Path "C:\temp\Launcher\Logs\FileCheckLog.txt" -Value ($FinalFileString)
        Add-Content -Path "C:\temp\Launcher\Logs\DebugLog.txt" -Value ($Date) -ErrorAction SilentlyContinue               # Log Date
        Write-Host "`nDebug Log Updated : Script Detected Previous user. Welcome Back!" -ForegroundColor Green
        Sleep 7 # Thanks for coming back!
        Write-Host "`nDirectory $Paths and $FileToRead exist with contents.`nChecking if PsExec exists at Path : $userfile." -ForegroundColor Green
        Sleep 5
    }# End of FilePath & DebugLog Check/Write.
}# End of loop
 
# Read Content From File
$filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt" # Reading the names of the files to test the existance in one of the locations
$LocalHostName = [System.Net.DNS]::GetHostByName($null).HostName # returns : TheHostname.nasw.ds.army.mil

foreach ($filename in $filenames) {
  if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) { #if the file is in share drive but not in Win\Sys32 folder
    Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan
    Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
    for ($i = 1; $i -le 100; $i++)
    {
        Write-Progress -Activity "Downloading PsTools to $LocalHostName" -Status "$i% Complete:" -PercentComplete $i;
    }
    Write-Host "`n`nFinished Downloading PS_Tools" -ForegroundColor Green
  } 
  else 
  { 
    [String]$Nothing = $null
    If ($HNorIPV4 -cne $Nothing) # If input is not equal to null data..
    {
        # DO NOT EDIT BELOW THIS LINE!!!
        # Chrome 
        If ($objChromeCheckbox.Checked -eq $True)
        {
            Write-Host "Installing Google Chrome on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s -d -i $GChromeDirectory
            return "Chrome Installer finished on remote host : $Computers"; # Continue
        }
        # FireFox
        If ($objFireFoxCheckbox.Checked -eq $True) 
        {
            Write-Host "Installing FireFox on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s -d -i $FireFoxDirectory
            return "FireFox Installer finished on remote host : $Computers"; # Continue
        }
        # MS Teams
        If ($objMSTEAMSCheckbox.Checked -eq $True) 
        {
            Write-Host "Copying MS Teams to 'C:\temp' directory on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s -d -i $MSTeamsDirectory
            return "MS Teams finished copying on remote host : $Computers"; # Continue
        }
        # Citrix
        If ($objCitrixCheckbox.Checked -eq $True) 
        {
            Write-Host "Installing Citrix on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -c -f -s -d -i $CitrixxDirectory
            return "Citrix Installer finished on remote host : $Computers"; # Continue
        }
        # DCAM
        If ($objDCAMCheckbox.Checked -eq $True) 
        {
            Write-Host "Installing DCAM on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -c -f -s -d -i $MedicalDirectory
            return "DCAM Installer finished on remote host : $Computers"; # Continue
        }
        # GSS Army (WinGUI)
        If ($objWinGUICheckbox.Checked -eq $True) 
        {
            Write-Host "`nDownloading Data Please Wait..." -ForegroundColor Cyan
            xcopy "C:\temp\Launcher\Dependencies\Packages\GCSSArmyIntegratedInstaller4160.zip" "\\$Computers\C$\temp" /H /Y
            Write-Host "`nExtracting Data Please Wait..." -ForegroundColor Cyan
            Sleep 1
            PSEXEC \\$Computers -s Powershell -command Expand-Archive -Path "C:\temp\GCSSArmyIntegratedInstaller4160.zip" -DestinationPath "C:\temp"
            Write-Host "`nSuccessfully Extracted Data" -ForegroundColor Green 
            Sleep 1
            Write-Host "`nDeleting Zip Archive From Remote Host : $Computers" -ForegroundColor Cyan
            PSEXEC \\$Computers -s Powershell -command Remove-Item -Path "C:\temp\GCSSArmyIntegratedInstaller4160.zip" -Force
            Write-Host "Installing WinGUI on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s -d -i $GSSARMYDirectory
            Sleep 1 
            return "WinGUI Installer requires interaction on remote host : $Computers"; # Continue
        }
        # Adobe Acrobat DC Pro
        If ($objAdobeDCPROCheckbox.Checked -eq $True) 
        {
            Write-Host "Installing Adobe DC Pro on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s -d -i $ACROBATDCPRO /A /R
            return "Adobe Installer finished on remote host : $Computers"; # Continue
        }
        # Share Pointer Designer
        If ($objSharePointDesigner2013Checkbox.Checked -eq $True) 
        {
            Write-Host "Installing Sharepoint Designer 2013 on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s -d -i $SHAREPOINTDESIGNER
            return "Sharepoint Designer 2013 Installer finished on remote host : $Computers"; # Continue
        }
        If ($objJoeSmithCheckbox.Checked -eq $True) 
        {
            Write-Host "Creating Joe.Smith Local Administrator on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s net user Joe.Smith 37Jek!*T4g37Jek /add /Y
            Write-Host "Created Joe.Smith Local Administrator on remote Computer : $Computers" -ForegroundColor Green
            Sleep 2 
            Write-Host "Applying Permissions to Joe.Smith Local Administrator on remote Computer : $Computers" -ForegroundColor Cyan
            C:\Windows\System32\PsExec.exe \\$Computers -s net localgroup Administrators Joe.Smith /add
            Sleep 2
            $JoeSmithCreds = "USERNAME: .\Joe.Smith`nPASSWORD: 37Jek!*T4g37Jek`n`nHostname: $Computers"
            # Create File 
            If (!(Test-Path $Paths) -and (Test-path $Paths)) {
                Remove-Item -LiteralPath "C:\temp\Launcher\Logs\JoeSmith.txt" 
            }
            Sleep 2
            New-Item -Path "C:\temp\Launcher\Logs" -Name "JoeSmith.txt" -ItemType "file" -Force
            # Write Content To File
            Set-Content -Path "C:\temp\Launcher\Logs\JoeSmith.txt" -Value ($JoeSmithCreds)
            Sleep 4
            Write-Host "`n`n`n`nLogin Credentials Logged to JoeSmith.txt at Path : $Paths" -ForegroundColor Cyan 
            return "`nFinished Installing Joe Smith on remote host : $Computers"; # Continue  
        }
        # Google Earth 
        If ($objGEarthCheckbox.Checked -eq $True) 
        {
            #Write-Host "Google Earth Installer Started on remote Computer : $Computers" -ForegroundColor Cyan
            Write-Host "Google Earth Installer Currently unavailable" -ForegroundColor Yellow
            #C:\Windows\System32\PsExec.exe \\$Computers -s -d -i $GEarthDirectory
            return "Remote Process Canceled on remote host : $Computers"; # Continue
        }
      }# End of If info != Null
      Sleep 3
      return "No applications selected program safely exiting";
      Sleep 2 # Give Script Time to unload ASM.
     }# End of Else do the check box
    }
   }# End of foreach loop
  }
})
$objForm.Controls.Add($OKButton)

#This Creates Button Deny
$CANCELButton = New-Object System.Windows.Forms.Button
$CANCELButton.Location = New-Object System.Drawing.Size(200,515)
$CANCELButton.Size = New-Object System.Drawing.Size(75,23)
$CANCELButton.Text = "CANCEL"
$CANCELButton.Add_Click({$Script:CANCELED=$True;$objForm.Close()})
$objForm.Controls.Add($CANCELButton)

#This creates a checkbox 
$objChromeCheckbox = New-Object System.Windows.Forms.Checkbox 
$objChromeCheckbox.Location = New-Object System.Drawing.Size(10,110) 
$objChromeCheckbox.Size = New-Object System.Drawing.Size(500,20)
$objChromeCheckbox.Text = "Install Google Chrome"
$objChromeCheckbox.TabIndex = 2
$objForm.Controls.Add($objChromeCheckbox)

#This creates a checkbox 
$objFireFoxCheckbox = New-Object System.Windows.Forms.Checkbox 
$objFireFoxCheckbox.Location = New-Object System.Drawing.Size(10,130) 
$objFireFoxCheckbox.Size = New-Object System.Drawing.Size(500,20)
$objFireFoxCheckbox.Text = "Install FireFox"
$objFireFoxCheckbox.TabIndex = 3
$objForm.Controls.Add($objFireFoxCheckbox)

#This creates a checkbox 
$objMSTEAMSCheckbox = New-Object System.Windows.Forms.Checkbox 
$objMSTEAMSCheckbox.Location = New-Object System.Drawing.Size(10,150) 
$objMSTEAMSCheckbox.Size = New-Object System.Drawing.Size(500,20)
$objMSTEAMSCheckbox.Text = "Install MS Teams"
$objMSTEAMSCheckbox.TabIndex = 4
$objForm.Controls.Add($objMSTEAMSCheckbox)

#This creates a checkbox 
$objCitrixCheckbox = New-Object System.Windows.Forms.Checkbox 
$objCitrixCheckbox.Location = New-Object System.Drawing.Size(10,170) 
$objCitrixCheckbox.Size = New-Object System.Drawing.Size(500,20)
$objCitrixCheckbox.Text = "Install Citrix"
$objCitrixCheckbox.TabIndex = 4
$objForm.Controls.Add($objCitrixCheckbox)

#This creates a checkbox 
$objDCAMCheckbox = New-Object System.Windows.Forms.Checkbox 
$objDCAMCheckbox.Location = New-Object System.Drawing.Size(10,190) 
$objDCAMCheckbox.Size = New-Object System.Drawing.Size(500,20)
$objDCAMCheckbox.Text = "Install DCAM"
$objDCAMCheckbox.TabIndex = 5
$objForm.Controls.Add($objDCAMCheckbox)

#This creates a checkbox 
$objWinGUICheckbox = New-Object System.Windows.Forms.Checkbox 
$objWinGUICheckbox.Location = New-Object System.Drawing.Size(10,210) 
$objWinGUICheckbox.Size = New-Object System.Drawing.Size(500,20)
$objWinGUICheckbox.Text = "Install GSS Army (WinGUI)"
$objWinGUICheckbox.TabIndex = 6
$objForm.Controls.Add($objWinGUICheckbox)

#This creates a checkbox 
$objAdobeDCPROCheckbox = New-Object System.Windows.Forms.Checkbox 
$objAdobeDCPROCheckbox.Location = New-Object System.Drawing.Size(10,230) 
$objAdobeDCPROCheckbox.Size = New-Object System.Drawing.Size(500,20)
$objAdobeDCPROCheckbox.Text = "Install Adobe DC Pro"
$objAdobeDCPROCheckbox.TabIndex = 7
$objForm.Controls.Add($objAdobeDCPROCheckbox)

#This creates a checkbox 
$objSharePointDesigner2013Checkbox = New-Object System.Windows.Forms.Checkbox 
$objSharePointDesigner2013Checkbox.Location = New-Object System.Drawing.Size(10,250) 
$objSharePointDesigner2013Checkbox.Size = New-Object System.Drawing.Size(500,20)
$objSharePointDesigner2013Checkbox.Text = "Install Share Point Designer 2013"
$objSharePointDesigner2013Checkbox.TabIndex = 8
$objForm.Controls.Add($objSharePointDesigner2013Checkbox)

#Santiago's checkbox
$objJoeSmithCheckbox = New-Object System.Windows.Forms.CheckBox
$objJoeSmithCheckbox.Location = New-Object System.Drawing.Size(10,270)
$objJoeSmithCheckbox.size = New-Object System.Drawing.Size(500,20)
$objJoeSmithCheckbox.Text = "Install Joe.Smith Local Administrator"
$objJoeSmithCheckbox.TabIndex = 9
$objForm.Controls.Add($objJoeSmithCheckbox)

# Google Earth 
$objGEarthCheckbox = New-Object System.Windows.Forms.CheckBox
$objGEarthCheckbox.Location = New-Object System.Drawing.Size(10,290)
$objGEarthCheckbox.size = New-Object System.Drawing.Size(500,20)
$objGEarthCheckbox.Text = "Install Google Earth"
$objGEarthCheckbox.TabIndex = 10
$objForm.Controls.Add($objGEarthCheckbox)

$objDisableLogsCheckbox = New-Object System.Windows.Forms.CheckBox
$objDisableLogsCheckbox.Location = New-Object System.Drawing.Size(10,475)
$objDisableLogsCheckbox.size = New-Object System.Drawing.Size(500,20)
$objDisableLogsCheckbox.Text = "Disable Auto Logging [NOT RECOMMENDED]"
$objDisableLogsCheckbox.TabIndex = 11
$objForm.Controls.Add($objDisableLogsCheckbox)

# Execute Front End
$objForm.Add_Shown({$objForm.Activate()})
$objForm.ShowDialog() | Out-Null
$objForm.Dispose() | Out-Null
}
Draw-Test


<#
Sources: 
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-item?view=powershell-7.1
https://social.technet.microsoft.com/Forums/scriptcenter/en-US/e3d80f73-55f6-4a7e-95b5-4e9216ef1847/powershell-windows-forms-checkbox?forum=winserverpowershell
https://stackoverflow.com/questions/31879814/check-if-a-file-exists-or-not-in-windows-powershell/31881297
https://devblogs.microsoft.com/scripting/provide-progress-for-your-script-with-a-powershell-cmdlet/
#>