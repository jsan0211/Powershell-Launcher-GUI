# General Technician Script!
# ~Script By SPC Burgess & SPC Santiago 2-3 FA S6 03/17/2021
# MOS: 25B & 25U
<#
#####################################################
    Big thanks to Reddit Friends / Sources
 for making this script possible. The goal here
 is to make things easier for IMO's. If you get
 a moment feel free to check out this code. If 
 I am still in the Army apon you reading this,
 feel free to reach out with any feedback. 

            Contact DSN: 915-741-0470
#####################################################
#>
Function GeneralTool{

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
#[system.windows.forms]::jitDebugging("false") 

try { . ("C:\temp\Launcher\Dependencies\Get-InputBox.ps1") }
catch { Write-Host -f Yellow "Unable to Located File" }



#[System.Windows.Forms.Application]::EnableVisualStyles()

# Globals 
$exactadminfile = "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\PsExec.exe" 
$userfile = "C:\Windows\System32" 
$FinalFileString = "$exactadminfile`n$userfile"
$LocalHostName = [System.Net.DNS]::GetHostByName($null).HostName; # returns : TheHostname.nasw.ds.army.mil

#creates window
$GForm = New-Object System.Windows.Forms.Form
$GForm.Text = '[SA/WA] General Tech v2.0'
$GForm.Width = 800
$GForm.Height = 420
$GForm.BackColor = "White"
$GForm.StartPosition = "CenterScreen"
$GForm.Location = New-Object System.Drawing.Size(80,495)
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
$GForm.AutoSize = $true
$GForm.FormBorderStyle = 'Fixed3D'
$GForm.MaximizeBox = $False
$GForm.MinimizeBox = $False

#Correct the initial state of the form to prevent the .Net maximized form issue
$OnLoadForm_StateCorrection={$GForm.WindowState=$InitialFormWindowState}

#Init the OnLoad event to correct the initial state of the form
$GForm.add_Load($OnLoadForm_StateCorrection)

$iconConverted2Base64 = [Convert]::ToBase64String((Get-Content "C:\temp\Launcher\Dependencies\icon\NewPanda.ico" -Encoding Byte))
$iconBase64           = $iconConverted2Base64
$iconBytes            = [Convert]::FromBase64String($iconBase64)
$stream               = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)
$stream.Write($iconBytes, 0, $iconBytes.Length);
$iconImage            = [System.Drawing.Image]::FromStream($stream, $true)
$GForm.Icon    = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())
# ico converter : https://cloudconvert.com/png-to-ico

# Draws Logo
$img = [System.Drawing.Image]::Fromfile('C:\temp\Launcher\Dependencies\icon\NewPanda.png')
$GForm.BackgroundImage = $img
$GForm.BackgroundImageLayout = "Center"

#This creates a label for the TextBox Hostname/IP
$objLabel1 = New-Object System.Windows.Forms.Label
$objLabel1.Location = New-Object System.Drawing.Size(125,20) 
$objLabel1.Size = New-Object System.Drawing.Size(280,20)
$objLabel1.ForeColor = [System.Drawing.Color]::FromName("Black")
$objLabel1.Text = "Enter hostname or IP address"
$GForm.Controls.Add($objLabel1) 

#This creates the TextBox Hostname/IP
$objTextBox1 = New-Object System.Windows.Forms.TextBox 
$objTextBox1.Location = New-Object System.Drawing.Size(80,40) 
$objTextBox1.Size = New-Object System.Drawing.Size(260,20)
$objTextBox1.TabIndex = 0 
$GForm.Controls.Add($objTextBox1)
$TheComputer=$objTextBox1.Text # User Input

#This Creates Button Ping
$PingButton = New-Object System.Windows.Forms.Button
$PingButton.Location = New-Object System.Drawing.Size(125,70)
$PingButton.Size = New-Object System.Drawing.Size(75,23)
$PingButton.BackColor = "LightGray"
$PingButton.Text = "PING"
$PingButton.Add_Click({

# Write Hostname to File then read it in.. 
# Create Dir
Sleep 2
New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
Sleep 2
New-Item -Path "C:\temp\Launcher\Logs" -Name "PING_OUTPUT.log" -ItemType "file" -Force
Sleep 1
Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
Sleep 1

Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
Sleep 2
    $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
    Foreach ($filename in $filenames) 
    {
        if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
        {   
            Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
            Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
            Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
            break;
        } 
        else 
        {
           If ($objTextBox1.Text -cne $null) 
           {
             sleep 1   
             Write-Host "`nPinging Remote Host" -ForegroundColor Cyan
             $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
             C:\Windows\System32\PsExec.exe -accepteula \\$theinfo -s cmd /c "ping $theinfo" > C:\temp\Launcher\Logs\PING_OUTPUT.log
             Sleep 5
             Start-Process -Wait -PSPath "notepad.exe" -ArgumentList "C:\temp\Launcher\Logs\PING_OUTPUT.log"
             Write-Host "`nFinished Process on remote host : $theinfo" -ForegroundColor Green
             break;
           }
           else 
           {
             sleep 1
             Write-Host "`nNO HostName or IP Address Entered" -ForegroundColor Yellow
             break;
           }
            sleep 1
            Write-Host "`nPSEXEC could not be found at the current path : \\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\" -ForegroundColor Yellow
            break;
        }
          
    }# End of for loop

})
$GForm.Controls.Add($PingButton)

#region Later dude

#This Creates Button IP Info
$IPCONFIGButton = New-Object System.Windows.Forms.Button
$IPCONFIGButton.Location = New-Object System.Drawing.Size(200,70)
$IPCONFIGButton.Size = New-Object System.Drawing.Size(75,23)
$IPCONFIGButton.BackColor = "LightGray"
$IPCONFIGButton.Text = "IP INFO"
$IPCONFIGButton.Add_Click(
{

# Write Hostname to File then read it in.. 
# Create Dir
Sleep 2
New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
Sleep 2
New-Item -Path "C:\temp\Launcher\Logs" -Name "IPCONFIG_OUTPUT.log" -ItemType "file" -Force
Sleep 1
Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
Sleep 1

Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
Sleep 2
    $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
    Foreach ($filename in $filenames) 
    {
        if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
        {   
            Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
            Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
            Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
            break;
        } 
        else 
        {
           If ($objTextBox1.Text -cne $null) 
           {
             sleep 1   
             Write-Host "`nQuerying IP Configuration" -ForegroundColor Cyan
             $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
             C:\Windows\System32\PsExec.exe -accepteula \\$theinfo -s cmd /c "ipconfig" > C:\temp\Launcher\Logs\IPCONFIG_OUTPUT.log
             Sleep 5
             Start-Process -Wait -PSPath "notepad.exe" -ArgumentList "C:\temp\Launcher\Logs\IPCONFIG_OUTPUT.log"
             Write-Host "`nFinished Process on remote host : $theinfo" -ForegroundColor Green
             break;
           }
           else 
           {
             sleep 1
             Write-Host "`nNO HostName or IP Address Entered" -ForegroundColor Yellow
             break;
           }
            sleep 1
            Write-Host "`nPSEXEC could not be found at the current path : \\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\" -ForegroundColor Yellow
            break;
        }
          
    }# End of for loop

})
$GForm.Controls.Add($IPCONFIGButton)

#This Creates Delete all users button
$QueryUsersButton = New-Object System.Windows.Forms.Button
$QueryUsersButton.Location = New-Object System.Drawing.Size(150,95)
$QueryUsersButton.Size = New-Object System.Drawing.Size(100,23)
$QueryUsersButton.BackColor = "LightGray"
$QueryUsersButton.Text = "Query Users"
$GForm.Controls.Add($QueryUsersButton)

# Available 
$option1 = 'Active Logged in Users'
$option2 = 'Local Users'
$option3 = 'Account Profiles'

$Choices = @($option1,$option2,$option3)
$comboBox1 = New-Object System.Windows.Forms.ComboBox
$comboBox1.Location = New-Object System.Drawing.Point(80,120)
$comboBox1.Size = New-Object System.Drawing.Size(260,20)
$GForm.Controls.Add($comboBox1)

foreach($Selectedoption in $Choices)
{
  $comboBox1.Items.add($Selectedoption)
  
} 
$QueryUsersButton.Add_Click({

    Remove-Item -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force # Delete File
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
    Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green 
    Sleep 1
    Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
    Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
   # Exception error happens when logging query user
   If ($comboBox1.SelectedItem -and $null) { 
       Write-Host "Choose an option from the drop down" -ForegroundColor Yellow 
   }
   else {
    If ($comboBox1.SelectedItem -eq $option1) {
        Sleep 2
        Write-Host "Querying Actively Logged In Users" -ForegroundColor Green
        Sleep 1
        New-Item -Path "C:\temp\Launcher\Logs" -Name "ACTIVE_USER_QUERY_OUTPUT.log" -ItemType "file" -Force
        Sleep 1
        $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
        C:\Windows\System32\PsExec.exe \\$theinfo -s cmd /c query user > C:\temp\Launcher\Logs\ACTIVE_USER_QUERY_OUTPUT.log
        Start-Process "notepad.exe" -ArgumentList "C:\temp\Launcher\Logs\ACTIVE_USER_QUERY_OUTPUT.log"
        break;
    }
    If ($comboBox1.SelectedItem -eq $option2) {
        Sleep 2
        Write-Host "Querying Local Users" -ForegroundColor Green
        sleep 1
        New-Item -Path "C:\temp\Launcher\Logs" -Name "LOCAL_USER_QUERY_OUTPUT.log" -ItemType "file" -Force
        Sleep 1
        $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
        C:\Windows\System32\PsExec.exe \\$theinfo -s net user > C:\temp\Launcher\Logs\LOCAL_USER_QUERY_OUTPUT.log
        Start-Process "notepad.exe" -ArgumentList "C:\temp\Launcher\Logs\LOCAL_USER_QUERY_OUTPUT.log"
        break;
    }
    If ($comboBox1.SelectedItem -eq $option3) {
        Sleep 2
        Write-Host "Querying Network Profiles" -ForegroundColor Green
        sleep 1
        New-Item -Path "C:\temp\Launcher\Logs" -Name "ACCOUNT_PROFILES_QUERY_OUTPUT.log" -ItemType "file" -Force
        sleep 1
        $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
        C:\Windows\System32\PsExec.exe \\$theinfo -s cmd /c dir C:\Users > C:\temp\Launcher\Logs\ACCOUNT_PROFILES_QUERY_OUTPUT.log
        Start-Process "notepad.exe" -ArgumentList "C:\temp\Launcher\Logs\ACCOUNT_PROFILES_QUERY_OUTPUT.log"
        break;
    }
  }
})

cls
sleep 3
Write-Host "Script ready for user interaction`n`n" -ForegroundColor Green
#This Creates Delete all users button
$DelAllButton = New-Object System.Windows.Forms.Button
$DelAllButton.Location = New-Object System.Drawing.Size(150,150)
$DelAllButton.Size = New-Object System.Drawing.Size(100,23)
$DelAllButton.BackColor = "LightGray"
$DelAllButton.Text = "Delete All Users"
$DelAllButton.Add_Click({

# Write Hostname to File then read it in.. 
# Create Dir
Sleep 2
New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
Sleep 2
New-Item -Path "C:\temp\Launcher\Logs" -Name "DeleteALLUsers_OUTPUT.log" -ItemType "file" -Force
Sleep 1
Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
Sleep 1

Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
Sleep 2
    $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
    Foreach ($filename in $filenames) 
    {
        if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
        {   
            Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
            Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
            Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
            break;
        } 
        else 
        {
           If ($objTextBox1.Text -cne $null) 
           {
             sleep 1   
             Write-Host "`nRemoving all user profiles from remote host: $theinfo" -ForegroundColor Cyan
             $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
             C:\Windows\System32\PsExec.exe -accepteula \\$theinfo -s cmd /c "del C:\Users\* /q /s /f" > C:\temp\Launcher\Logs\DeleteALLUsers_OUTPUT.log
             Sleep 5
             Start-Process -Wait -PSPath "notepad.exe" -ArgumentList "C:\temp\Launcher\Logs\DeleteALLUsers_OUTPUT.log"
             Write-Host "`nFinished Process on remote host : $theinfo" -ForegroundColor Green
             break;
           }
           else 
           {
             sleep 1
             Write-Host "`nNO HostName or IP Address Entered" -ForegroundColor Yellow
             break;
           }
            sleep 1
            Write-Host "`nPSEXEC could not be found at the current path : \\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\" -ForegroundColor Yellow
            break;
        }
          
    }# End of for loop

})
$GForm.Controls.Add($DelAllButton)

#This Creates Delete all users button
$DeleteUserButton = New-Object System.Windows.Forms.Button
$DeleteUserButton.Location = New-Object System.Drawing.Size(150,180)
$DeleteUserButton.Size = New-Object System.Drawing.Size(100,23)
$DeleteUserButton.BackColor = "LightGray"
$DeleteUserButton.Text = "Delete A User"
$DeleteUserButton.Add_Click({
 # Write Hostname to File then read it in.. 
    # Create Dir
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
    Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "Deleted_User.log" -ItemType "file" -Force
    Sleep 1
    Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
    Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
    Sleep 1

    Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
    Sleep 2
        $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
        Foreach ($filename in $filenames) 
        {
            if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
            {   
                Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
                Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
                Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
                break;
            } 
            else 
            {
            If ($objTextBox2.Text -cne $null) 
            {
                sleep 1   
                Write-Host "`nUser is being delete" -ForegroundColor Cyan
                $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
                $Custominputuser = $objTextBox2.Text 
                C:\Windows\System32\PsExec.exe -accepteula \\$theinfo -s cmd /c "del C:\Users\$Custominputuser /q /s /f" > C:\temp\Launcher\Logs\Deleted_User.log
                Sleep 5
                Start-Process -Wait -PSPath "notepad.exe" -ArgumentList "C:\temp\Launcher\Logs\Delete_User.log"
                Write-Host "`nFinished Process on remote host : $theinfo" -ForegroundColor Green
                break;
            }
            else 
            {
                sleep 1
                Write-Host "`nNO HostName or IP Address Entered" -ForegroundColor Yellow
                break;
            }
                sleep 1
                Write-Host "`nPSEXEC could not be found at the current path : \\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\" -ForegroundColor Yellow
                break;
            }
          
        }# End of for loop

    })
$GForm.Controls.Add($DeleteUserButton)

#This creates the TextBox for deleting a profile
$objTextBox2 = New-Object System.Windows.Forms.TextBox 
$objTextBox2.Location = New-Object System.Drawing.Size(80,210) 
$objTextBox2.Size = New-Object System.Drawing.Size(260,20)
$objTextBox2.TabIndex = 0 
$GForm.Controls.Add($objTextBox2)

#This Creates Button Restart
$RestartButton = New-Object System.Windows.Forms.Button
$RestartButton.Location = New-Object System.Drawing.Size(125,240)
$RestartButton.Size = New-Object System.Drawing.Size(75,23)
$RestartButton.BackColor = "LightGray"
$RestartButton.Text = "Restart"
$RestartButton.Add_Click({
 # Write Hostname to File then read it in.. 
    # Create Dir
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
    Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
    Sleep 1
    Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
    Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
    Sleep 1

    Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
    Sleep 2
        $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
        Foreach ($filename in $filenames) 
        {
            if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
            {   
                Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
                Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
                Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
                break;
            } 
            else 
            {
            If ($objTextBox2.Text -cne $null) 
            {
                sleep 1   
                $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force 
                Write-Host "`nRestarting Remote Host : $theinfo" -ForegroundColor Cyan
                C:\Windows\System32\PsExec.exe -accepteula \\$theinfo -s shutdown -r -t 0
                Sleep 5
                Write-Host "`nFinished Process on remote host : $theinfo" -ForegroundColor Green
                break;
            }
            else 
            {
                sleep 1
                Write-Host "`nNO HostName or IP Address Entered" -ForegroundColor Yellow
                break;
            }
                sleep 1
                Write-Host "`nPSEXEC could not be found at the current path : \\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\" -ForegroundColor Yellow
                break;
            }
          
        }# End of for loop

    })
$GForm.Controls.Add($RestartButton)

#This Creates Button Shutdown
$ShutdownButton = New-Object System.Windows.Forms.Button
$ShutdownButton.Location = New-Object System.Drawing.Size(200,240)
$ShutdownButton.Size = New-Object System.Drawing.Size(75,23)
$ShutdownButton.BackColor = "LightGray"
$ShutdownButton.Text = "Shutdown"
$ShutdownButton.Add_Click({
# Write Hostname to File then read it in.. 
    # Create Dir
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
    Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
    Sleep 1
    Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
    Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
    Sleep 1

    Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
    Sleep 2
        $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
        Foreach ($filename in $filenames) 
        {
            if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
            {   
                Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
                Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
                Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
                break;
            } 
            else 
            {
            If ($objTextBox1.Text -cne $null) 
            {
                sleep 1   
                Write-Host "`nRemote Host is being shutdown" -ForegroundColor Cyan
                $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
                C:\Windows\System32\PsExec.exe -accepteula \\$theinfo -s shutdown -s -t 0
                write-host "Remote Host Successfully Shutting Down!" -ForegroundColor Green
                break;
            }
            else 
            {
                sleep 1
                Write-Host "`nNO HostName or IP Address Entered" -ForegroundColor Yellow
                break;
            }
                sleep 1
                Write-Host "`nPSEXEC could not be found at the current path : \\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\" -ForegroundColor Yellow
                break;
            }
          
        }# End of for loop

    }) 
$GForm.Controls.Add($ShutdownButton)

#This Creates Button CMD
$CMDButton = New-Object System.Windows.Forms.Button
$CMDButton.Location = New-Object System.Drawing.Size(125,270)
$CMDButton.Size = New-Object System.Drawing.Size(75,23)
$CMDButton.BackColor = "LightGray"
$CMDButton.Text = "CMD"
$CMDButton.Add_Click({
# Write Hostname to File then read it in.. 
    # Create Dir
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
    Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
    Sleep 1
    Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
    Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
    Sleep 1

    Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
    Sleep 2
        $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
        Foreach ($filename in $filenames) 
        {
            if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
            {   
                Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
                Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
                Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
                break;
            } 
            else 
            {
            If ($objTextBox1.Text -cne $null) 
            {
                sleep 1   
                Write-Host "`nSending CMD Window to remote host`nNOTE: Close CMD on remote client to continue with General Tech Application" -ForegroundColor Cyan
                $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
                C:\Windows\System32\PsExec.exe -accepteula \\$theinfo -s -i cmd
                Write-Host "Process finished on remote host : $theinfo" -ForegroundColor Green
                break;
            }
            else 
            {
                sleep 1
                Write-Host "`nNO HostName or IP Address Entered" -ForegroundColor Yellow
                break;
            }
                sleep 1
                Write-Host "`nPSEXEC could not be found at the current path : \\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\" -ForegroundColor Yellow
                break;
            }
          
        }# End of for loop

    }) 
$GForm.Controls.Add($CMDButton)

#This Creates Button Powershell
$PSButton = New-Object System.Windows.Forms.Button
$PSButton.Location = New-Object System.Drawing.Size(200,270)
$PSButton.Size = New-Object System.Drawing.Size(75,23)
$PSButton.BackColor = "LightGray"
$PSButton.Text = "Powershell"
$PSButton.Add_Click({
# Write Hostname to File then read it in.. 
    # Create Dir
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
    Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
    Sleep 1
    Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
    Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
    Sleep 1

    Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
    Sleep 2
        $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
        Foreach ($filename in $filenames) 
        {
            if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
            {   
                Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
                Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
                Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
                break;
            } 
            else 
            {
            If ($objTextBox1.Text -cne $null) 
            {
                sleep 1   
                Write-Host "`nSending Powershell Window to remote host`nNOTE: Close PS on remote client to continue with General Tech Application" -ForegroundColor Cyan
                $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
                C:\Windows\System32\PsExec.exe -accepteula \\$theinfo -s -i Powershell
                Write-Host "Process finished on remote host : $theinfo" -ForegroundColor Green
                break;
            }
            else 
            {
                sleep 1
                Write-Host "`nNO HostName or IP Address Entered" -ForegroundColor Yellow
                break;
            }
                sleep 1
                Write-Host "`nPSEXEC could not be found at the current path : \\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\" -ForegroundColor Yellow
                break;
            }
          
        }# End of for loop

    }) 
$GForm.Controls.Add($PSButton)

#This Creates Button Enables local admin
$ELocalButton = New-Object System.Windows.Forms.Button
$ELocalButton.Location = New-Object System.Drawing.Size(125,300)
$ELocalButton.Size = New-Object System.Drawing.Size(150,23)
$ELocalButton.BackColor = "LightGray"
$ELocalButton.Text = "Enable Local Admin"
$ELocalButton.Add_Click({
# Write Hostname to File then read it in.. 
    # Create Dir
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
    Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
    Sleep 1
    Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
    Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
    Sleep 1

    Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
    Sleep 2
        $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
        Foreach ($filename in $filenames) 
        {
            if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
            {   
                Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
                Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
                Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
                break;
            } 
            else 
            {
            If ($objTextBox1.Text -cne $null) 
            {
                sleep 1   
                $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
                Write-Host "Creating Joe.Smith Local Administrator on remote Computer : $Computers" -ForegroundColor Cyan
                C:\Windows\System32\PsExec.exe \\$theinfo -s net user Joe.Smith 37Jek!*T4g37Jek /add /Y
                Write-Host "Created Joe.Smith Local Administrator on remote Computer : $theinfo" -ForegroundColor Green
                Sleep 2 
                Write-Host "Applying Permissions to Joe.Smith Local Administrator on remote Computer : $theinfo" -ForegroundColor Cyan
                C:\Windows\System32\PsExec.exe \\$theinfo -s net localgroup Administrators Joe.Smith /add
                Sleep 2
                Write-Host "Activating Joe.Smith Local Administrator or remote computer : $theinfo" -ForegroundColor Cyan
                $JoeSmithCreds = "USERNAME: .\Joe.Smith`nPASSWORD: 37Jek!*T4g37Jek`n`nHostname: $theinfo"
                # Create File 
                Remove-Item -LiteralPath "C:\temp\Launcher\Logs\JoeSmith.txt"
                Sleep 2
                New-Item -Path "C:\temp\Launcher\Logs" -Name "JoeSmith.txt" -ItemType "file" -Force
                # Write Content To File
                Set-Content -Path "C:\temp\Launcher\Logs\JoeSmith.txt" -Value ($JoeSmithCreds)
                Sleep 4
                Write-Host "`n`n`n`nLogin Credentials Logged to JoeSmith.txt at Path : C:\temp\Launcher\Logs" -ForegroundColor Cyan 
                Write-Host "`nFinished Installing Joe Smith on remote host : $theinfo" -ForegroundColor Green
                Start-Process -Wait -PSPath "notepad.exe" -ArgumentList "C:\temp\Launcher\Logs\JoeSmith.txt"
                break;
            }
            else 
            {
                sleep 1
                Write-Host "`nNO HostName or IP Address Entered" -ForegroundColor Yellow
                break;
            }
                sleep 1
                Write-Host "`nPSEXEC could not be found at the current path : \\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\" -ForegroundColor Yellow
                break;
            }
          
        }# End of for loop

    })
$GForm.Controls.Add($ELocalButton)

#This Creates Button Deletes local admin
$DELocalButton = New-Object System.Windows.Forms.Button
$DELocalButton.Location = New-Object System.Drawing.Size(125,330)
$DELocalButton.Size = New-Object System.Drawing.Size(150,23)
$DELocalButton.BackColor = "LightGray"
$DELocalButton.Text = "Delete Local Admin"
$DELocalButton.Add_Click({
# Write Hostname to File then read it in.. 
    # Create Dir
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
    Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
    Sleep 1
    Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
    Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
    Sleep 1

    Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
    Sleep 2
        $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
        Foreach ($filename in $filenames) 
        {
            if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
            {   
                Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
                Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
                Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
                break;
            } 
            else 
            {
            If ($objTextBox1.Text -cne $null) 
            {
                sleep 1   
                $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
                Write-Host "Disabling Joe.Smith Local Administrator on remote Computer : $theinfo" -ForegroundColor Cyan
                C:\Windows\System32\PsExec.exe \\$theinfo -s net user Joe.Smith /Active:no
                Sleep 2
                Write-Host "`nFinished Removing Joe Smith on remote host : $theinfo" -ForegroundColor Green
                break;
            }
            else 
            {
                sleep 1
                Write-Host "`nNO HostName or IP Address Entered" -ForegroundColor Yellow
                break;
            }
                sleep 1
                Write-Host "`nPSEXEC could not be found at the current path : \\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\" -ForegroundColor Yellow
                break;
            }
          
        }# End of for loop

    })
$GForm.Controls.Add($DELocalButton)

#This Creates Button Monitor Bitlocker
$MBButton = New-Object System.Windows.Forms.Button
$MBButton.Location = New-Object System.Drawing.Size(400,40)
$MBButton.Size = New-Object System.Drawing.Size(150,23)
$MBButton.BackColor = "LightGray"
$MBButton.Text = "Monitor Bitlocker Status"
$MBButton.Add_Click({
    # Write Hostname to File then read it in.. 
    # Create Dir
    Remove-Item -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force # Delete File
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
    Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "MANAGE_BITLOCKER_STATUS.log" -ItemType "file" -Force
    Sleep 1
    Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
    Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
    Sleep 1

    Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
    Sleep 2
        $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
        Foreach ($filename in $filenames) 
        {
            if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
            {   
                Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
                Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
                Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
                break;
            } 
            else 
            {
            If ($objTextBox1.Text -cne $null) 
                {
                    sleep 1   
                    Write-Host "`nWriting Bitlocker status to file" -ForegroundColor Cyan
                    $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
                    C:\Windows\System32\PsExec.exe -accepteula \\$theinfo -s manage-bde -status > C:\temp\Launcher\Logs\MANAGE_BITLOCKER_STATUS.log
                    Sleep 5
                    Start-Process -Wait -PSPath "notepad.exe" -ArgumentList "C:\temp\Launcher\Logs\MANAGE_BITLOCKER_STATUS.log"
                    Write-Host "`nFinished Process on remote host : $theinfo" -ForegroundColor Green
                    break;
                }
            }
        }
    })
$GForm.Controls.Add($MBButton)

#This Creates Button Disable bitlocker
$DisBButton = New-Object System.Windows.Forms.Button
$DisBButton.Location = New-Object System.Drawing.Size(550,40)
$DisBButton.Size = New-Object System.Drawing.Size(150,23)
$DisBButton.BackColor = "LightGray"
$DisBButton.Text = "Disable Bitlocker"
$DisBButton.Add_Click({
# Write Hostname to File then read it in.. 
    # Create Dir
    Remove-Item -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force # Delete File
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
    Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "MANAGE_BITLOCKER_STATUS.log" -ItemType "file" -Force
    Sleep 1
    Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
    Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
    Sleep 1

    Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
    Sleep 2
        $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
        Foreach ($filename in $filenames) 
        {
            if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
            {   
                Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
                Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
                Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
                break;
            } 
            else 
            {
            If ($objTextBox1.Text -cne $null) 
                {
                    sleep 1   
                    $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
                    Write-Host "`nDisabling Bitlocker Encryption on Remote Host : $theinfo" -ForegroundColor Cyan
                    C:\Windows\System32\PsExec.exe -accepteula \\$theinfo -s manage-bde -off C:
                    Sleep 5
                    Start-Process -Wait -PSPath "notepad.exe" -ArgumentList "C:\temp\Launcher\Logs\MANAGE_BITLOCKER_STATUS.log"
                    Write-Host "`nFinished Process on remote host : $theinfo" -ForegroundColor Green
                    break;
                }
            }
        }
    })
$GForm.Controls.Add($DisBButton)

#This Creates Button Query Bitlocker Key
$QueryKeyButton = New-Object System.Windows.Forms.Button
$QueryKeyButton.Location = New-Object System.Drawing.Size(400,70)
$QueryKeyButton.Size = New-Object System.Drawing.Size(300,23)
$QueryKeyButton.BackColor = "LightGray"
$QueryKeyButton.Text = "Query Bitlocker Key & Backup to AD"
$QueryKeyButton.Add_Click({
# Write Hostname to File then read it in.. 
    # Create Dir
    Remove-Item -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force # Delete File
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
    Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "BITLOCKER_KEY.log" -ItemType "file" -Force
    Sleep 1
    Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
    Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
    Sleep 1

    Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
    Sleep 2
        $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
        Foreach ($filename in $filenames) 
        {
            if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
            {   
                Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
                Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
                Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
                break;
            } 
            else 
            {
            If ($objTextBox1.Text -cne $null) 
                {
                    sleep 1   
                    Write-Host "`nWriting Bitlocker key to file" -ForegroundColor Cyan
                    $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
                    C:\Windows\System32\PsExec.exe -accepteula \\$theinfo manage-bde -protectors -get C: > C:\temp\Launcher\Logs\BITLOCKER_KEY.log
                    Sleep 5
                    Write-Host "Copy Numerical Password ID and close Notepad`nExample: {EA70CF76-XXXX-XXXX-XXXX-9EDF86339DF7}"
                    Start-Process -Wait -PSPath "notepad.exe" -ArgumentList "C:\temp\Launcher\Logs\BITLOCKER_KEY.log"
                    Write-Host "`nFinished Process on remote host : $theinfo" -ForegroundColor Green
                    [String]$KeyBackup = Get-InputBox "Numerical Password Input" "Example: `n{EA70CF76-XXXX-XXXX-XXXX-9EDF86339DF7}" 
                    C:\Windows\System32\PsExec.exe -accepteula \\$theinfo manage-bde -protectors -adbackup C: -id $KeyBackup
                    Write-Host "Successfully backed up Bitlocker Key to Active Directory" -ForegroundColor Green
                    break;
                }
            }
        }
    })
$GForm.Controls.Add($QueryKeyButton)

#This Creates Button Uses TPM
$TPMButton = New-Object System.Windows.Forms.Button
$TPMButton.Location = New-Object System.Drawing.Size(460,100)
$TPMButton.Size = New-Object System.Drawing.Size(185,23)
$TPMButton.BackColor = "LightGray"
$TPMButton.Text = "Disable Bitlocker PIN"
$TPMButton.Add_Click({
# Write Hostname to File then read it in.. 
    # Create Dir
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
    Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
    Sleep 1
    Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
    Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
    Sleep 1

    Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
    Sleep 2
        $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
        Foreach ($filename in $filenames) 
        {
            if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
            {   
                Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
                Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
                Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
                break;
            } 
            else 
            {
            If ($objTextBox1.Text -cne $null) 
            {
                sleep 1   
                Write-Host "`nDisabling Bitlocker Pin on remote host" -ForegroundColor Cyan
                $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
                Write-Host "Disabling Joe.Smith Local Administrator on remote Computer : $theinfo" -ForegroundColor Cyan
                C:\Windows\System32\PsExec.exe \\$theinfo -s cmd /c manage-bde -protectors -add C: -tpm
                Sleep 2
                Write-Host "`nFinished Removing Bitlocker Pin on remote host : $theinfo" -ForegroundColor Green
                break;
            }
            else 
            {
                sleep 1
                Write-Host "`nNO HostName or IP Address Entered" -ForegroundColor Yellow
                break;
            }
                sleep 1
                Write-Host "`nPSEXEC could not be found at the current path : \\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\" -ForegroundColor Yellow
                break;
            }
          
        }# End of for loop

    })
$GForm.Controls.Add($TPMButton)
#endregion
#This Creates Button Install PSEXEC
$PSEXECButton = New-Object System.Windows.Forms.Button
$PSEXECButton.Location = New-Object System.Drawing.Size(460,130)
$PSEXECButton.Size = New-Object System.Drawing.Size(185,23)
$PSEXECButton.BackColor = "LightGray"
$PSEXECButton.Text = "Install PSEXEC"
$PSEXECButton.Add_Click(
{
Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
Sleep 2
    $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
    Foreach ($filename in $filenames) 
    {
        if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
        {   
            Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
            Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
            Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
            break;
        } 
        elseif ((Test-Path $exactadminfile\$filename) -eq !(Test-Path $exactadminfile\$filename)) #if the file path is = non existant.
        { 
            Write-Host "`nPSEXEC could not be found at the current path : \\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\" -ForegroundColor Yellow
            break;
        }
        else 
        {
            Write-Host "`nPSTools is already installed on this computer" -ForegroundColor Green
            break;
        }
    } 
}# End of for loop
)
$GForm.Controls.Add($PSEXECButton)

#This Creates Button Query SN
$SNButton = New-Object System.Windows.Forms.Button
$SNButton.Location = New-Object System.Drawing.Size(480,160)
$SNButton.Size = New-Object System.Drawing.Size(150,23)
$SNButton.BackColor = "LightGray"
$SNButton.Text = "Query Serial Number"
$SNButton.Add_Click({
# Write Hostname to File then read it in.. 
    # Create Dir
    Remove-Item -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force # Delete File
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
    Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "QUERY_SERIAL_NUMBER.log" -ItemType "file" -Force
    Sleep 1
    Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
    Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
    Sleep 1

    Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
    Sleep 2
        $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
        Foreach ($filename in $filenames) 
        {
            if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
            {   
                Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
                Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
                Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
                break;
            } 
            else 
            {
            If ($objTextBox1.Text -cne $null) 
                {
                    sleep 1   
                    Write-Host "`nQuerying Serial Number" -ForegroundColor Cyan
                    $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
                    C:\Windows\System32\PsExec.exe -accepteula \\$theinfo -s wmic bios get SerialNumber > C:\temp\Launcher\Logs\QUERY_SERIAL_NUMBER.log
                    Sleep 5
                    Start-Process -Wait -PSPath "notepad.exe" -ArgumentList "C:\temp\Launcher\Logs\QUERY_SERIAL_NUMBER.log"
                    Write-Host "`nFinished Process on remote host : $theinfo" -ForegroundColor Green
                    break;
                }
            }
        }
    })
$GForm.Controls.Add($SNButton)

#This Creates Button Query installed apps
$QAppsButton = New-Object System.Windows.Forms.Button
$QAppsButton.Location = New-Object System.Drawing.Size(480,190)
$QAppsButton.Size = New-Object System.Drawing.Size(150,23)
$QAppsButton.BackColor = "LightGray"
$QAppsButton.Text = "Query Installed Apps"
$QAppsButton.Add_Click({
# Write Hostname to File then read it in.. 
    # Create Dir
    Remove-Item -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force # Delete File
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "GeneralTechLog.txt" -ItemType "file" -Force # Re-Create File
    Write-Host "`nGeneral Tech Log Created" -ForegroundColor Green
    Sleep 2
    New-Item -Path "C:\temp\Launcher\Logs" -Name "QUERY_APPLICATIONS.log" -ItemType "file" -Force
    Sleep 1
    Set-Content -Path "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Value ($objTextBox1.Text)
    Write-Host "`nContents Finished Writing to file `nat Path : C:\temp\Launcher\Logs\GeneralTechLog.txt" -ForegroundColor Green
    Sleep 1

    Write-Host "`nChecking if psexec exists, Do not Spam!" -ForegroundColor Cyan
    Sleep 2
        $filenames=Get-Content "C:\temp\Launcher\Logs\FileCheckLog.txt"; # Reading the names of the files to test the existance in one of the locations
        Foreach ($filename in $filenames) 
        {
            if ((Test-Path $exactadminfile\$filename) -and !(Test-Path $userfile\$filename)) #if the file is in share drive but not in Win\Sys32 folder
            {   
                Write-Host "`nBeginning Download of PS_Tools`nPlease Be Patient" -ForegroundColor Cyan # Change this directory to point to your NECs sharedrive w/ PSTools
                Start-Process -Wait -PSPath "C:\Windows\System32\xcopy.exe" -ArgumentList "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\* C:\Windows\System32 /H /Y" 
                Write-Host "`nFinished Downloading PS_Tools" -ForegroundColor Green
                break;
            } 
            else 
            {
            If ($objTextBox1.Text -cne $null) 
                {
                    sleep 1   
                    Write-Host "`nQuerying Installed Applications" -ForegroundColor Cyan
                    $theinfo = Get-Content -LiteralPath "C:\temp\Launcher\Logs\GeneralTechLog.txt" -Force
                    C:\Windows\System32\PsExec.exe -accepteula \\$theinfo -s cmd /c wmic product get name > C:\temp\Launcher\Logs\QUERY_APPLICATIONS.log
                    Sleep 5
                    Start-Process -Wait -PSPath "notepad.exe" -ArgumentList "C:\temp\Launcher\Logs\QUERY_APPLICATIONS.log"
                    Write-Host "`nFinished Process on remote host : $theinfo" -ForegroundColor Green
                    break;
                }
            }
        }
    })
$GForm.Controls.Add($QAppsButton)

#This Creates Button Query installed apps
$ClearScreenButton = New-Object System.Windows.Forms.Button
$ClearScreenButton.Location = New-Object System.Drawing.Size(480,220)
$ClearScreenButton.Size = New-Object System.Drawing.Size(150,23)
$ClearScreenButton.BackColor = "LightGray"
$ClearScreenButton.Text = "Clear Console Output"
$ClearScreenButton.Add_Click({cls})
$GForm.Controls.Add($ClearScreenButton)

#This creates a label for the Credits
$objLabel4 = New-Object System.Windows.Forms.Label
$objLabel4.Location = New-Object System.Drawing.Size(360,300) 
$objLabel4.Size = New-Object System.Drawing.Size(400,65)
$objLabel4.ForeColor = [System.Drawing.Color]::FromName("Black")
$objLabel4.Text = "Development Team`n                SPC Burgess`n                           SPC Santiago`n    2-3 FA S6 Fort Bliss TX"
$GForm.Controls.Add($objLabel4) 

###### FONT SIZE CHANGE:
$objLabel4.ForeColor = [System.Drawing.Color]::FromName("Black")
$objLabel4.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
$objLabel4.Font = New-Object System.Drawing.Font("Lucida Console",12,[System.Drawing.FontStyle]::Regular)
#endregion


$GForm.Add_Shown({$GForm.Activate()})
$GForm.ShowDialog() | Out-Null
$GForm.Dispose() | Out-Null

}
GeneralTool
