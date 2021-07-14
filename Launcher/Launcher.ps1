# Launcher Script v2.0
# ~Script By SPC Burgess & SPC Santiago 2-3 FA S6 Fort Bliss TX 07/13/2021
# MOS: 25B & 25U
<#
#####################################################
    Big thanks to Reddit Friends / Sources
 for making this script possible. The goal here
 is to make things easier for IMO's. If you get
 a moment feel free to check out this code. If 
 I am still in the Army apon you reading this,
 feel free to reach out with any feedback. 

            Contact DSN: 915-741-4627
#####################################################
#>

Function MainLauncher {
Add-Type -AssemblyName System
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
Add-Type -AssemblyName System.Security
[System.Windows.Forms.Application]::EnableVisualStyles()
[Bool]$Setupbackend

$LauncherForm = New-Object System.Windows.Forms.Form
$LauncherForm.Text = "Script Launcher"
$LauncherForm.ClientSize = New-Object System.Drawing.Size(407, 200)
$LauncherForm.BackColor = "White"
$LauncherForm.StartPosition = "CenterScreen"
$LauncherForm.FormBorderStyle = 'Fixed3D'
$LauncherForm.MaximizeBox = $false

$iconConverted2Base64 = [Convert]::ToBase64String((Get-Content "C:\temp\Launcher\Dependencies\icon\NewPanda.ico" -Encoding Byte))
$iconBase64           = $iconConverted2Base64
$iconBytes            = [Convert]::FromBase64String($iconBase64)
$stream               = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)
$stream.Write($iconBytes, 0, $iconBytes.Length);
$iconImage            = [System.Drawing.Image]::FromStream($stream, $true)
$LauncherForm.Icon    = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())
# ico converter : https://cloudconvert.com/png-to-ico

$img = [System.Drawing.Image]::Fromfile('C:\temp\Launcher\Dependencies\icon\NewPanda.png')
$LauncherForm.BackgroundImage = $img
$LauncherForm.BackgroundImageLayout = "Center"

$LaunchButton = New-Object System.Windows.Forms.Button
$LaunchButton.Location = New-Object System.Drawing.Point(276, 40)
$LaunchButton.Size = New-Object System.Drawing.Size(98, 23)
$LaunchButton.BackColor = "LightGray"
$LaunchButton.ForeColor = "Black"
$LaunchButton.Text = "Launch"
$LaunchButton.add_Click({$Script:CANCELED=$False;$info=$comboBox1.SelectedItem;$LauncherForm.Close()})
$LauncherForm.Controls.Add($LaunchButton)

$SetupButton = New-Object System.Windows.Forms.Button
$SetupButton.Location = New-Object System.Drawing.Point(30, 40)
$SetupButton.Size = New-Object System.Drawing.Size(98, 23)
$SetupButton.BackColor = "LightGray"
$SetupButton.ForeColor = "Black"
$SetupButton.Text = "UPDATE"
$SetupButton.add_Click({
$Setupbackend=$true
$theoption=$comboBox1.SelectedItem

If ($Setupbackend -eq $true){
     # If path doesnt exist exists. C:\temp
        If ((Test-Path -Path "C:\temp" -PathType Container) -cne ($true)) {
            New-Item -Path "C:\" -Name "temp" -ItemType "directory" -Force 
            Write-Host "`nCreated C:\temp directory" -ForegroundColor Cyan 
        }
        # If path doesnt exist exists. C:\temp\Launcher
        If ((Test-Path -Path "C:\temp\Launcher" -PathType Container) -cne ($true)) {
            New-Item -Path "C:\temp" -Name "Launcher" -ItemType "directory" -Force 
            Write-Host "`nCreated C:\temp\Launcher directory" -ForegroundColor Cyan 
        }
        # If path doesnt exist exists. C:\temp\Launcher\Changelogs
        If ((Test-Path -Path "C:\temp\Launcher" -PathType Container) -cne ($true)) {
            New-Item -Path "C:\temp\Launcher" -Name "Changelogs" -ItemType "directory" -Force 
            Write-Host "`nCreated C:\temp\Launcher\Changelogs directory" -ForegroundColor Cyan 
        }
        # If path doesnt exist exists. C:\temp\Launcher\Dependencies
        If ((Test-Path -Path "C:\temp\Launcher\Dependencies" -PathType Container) -cne ($true)) {
            New-Item -Path "C:\temp\Launcher" -Name "Dependencies" -ItemType "directory" -Force 
            Write-Host "`nCreated C:\temp\Launcher\Dependencies directory" -ForegroundColor Cyan 
        }
        # If path doesnt exist exists. C:\temp\Launcher\Logs
        If ((Test-Path -Path "C:\temp\Launcher\Logs" -PathType Container) -cne ($true)) {
            New-Item -Path "C:\temp\Launcher" -Name "Logs" -ItemType "directory" -Force 
            Write-Host "`nCreated C:\temp\Launcher\Logs directory" -ForegroundColor Cyan 
        }
        
        <#
        Repo Link: https://github.com/DrewTheGiraffe/Powershell-Launcher-GUI/tree/main/Launcher/Dependencies

            What a pain in the ass this was to get working in powershell.... 
            https://raw.githack.com/
            Thank god for this website lol.. its safe and gives you raw code files from GitHub Repo's...
            Paste the permalink for any file in the URL box at that website.
            Just make sure you use production url option only and it will work fine in powershell
        #>
        $AppScriptURL = "https://rawcdn.githack.com/DrewTheGiraffe/Powershell-Launcher-GUI/5e33006cd27c8130568d36e21ea0aafd85a08661/Launcher/Dependencies/ApplicationsGUI.ps1"
        $HostnameSURL = "https://rawcdn.githack.com/DrewTheGiraffe/Powershell-Launcher-GUI/5e33006cd27c8130568d36e21ea0aafd85a08661/Launcher/Dependencies/HostnameGUI.ps1"
        $ADUSERPS1URL = ""
        $GeneralTechU = "https://rawcdn.githack.com/DrewTheGiraffe/Powershell-Launcher-GUI/5e33006cd27c8130568d36e21ea0aafd85a08661/Launcher/Dependencies/GeneralTechGUI.ps1"
        $ZipScriptURL = "https://rawcdn.githack.com/DrewTheGiraffe/Powershell-Launcher-GUI/5e33006cd27c8130568d36e21ea0aafd85a08661/Launcher/Dependencies/ZipExtractorGUI.ps1"
        
        # **DONT EDIT BELOW THIS LINE**
        $location = "C:\temp\Extra"
        # Applications Script
        If ($comboBox1.SelectedItem -eq $option1) {
            write-host "`nGetting Newest Script from Github!" -ForegroundColor Cyan
            Write-Host "`nFound Data on Github Repo!" -ForegroundColor Cyan
            Invoke-WebRequest -Uri $AppScriptURL -OutFile "$location\ApplicationsGUI.ps1"
            Write-Host "`nDownload finished" -ForegroundColor Green
            Sleep 1
            Write-Host "`nApplication Script Updated!" -ForegroundColor Green
            return;
        }
        # Hostname Creator Script
        If ($comboBox1.SelectedItem -eq $option2) {
            Sleep 1
            Write-Host "`nAccount Auditor Script up to date!" -ForegroundColor Green
            return;
        }
        # Hostname Creator Script
        If ($comboBox1.SelectedItem -eq $option3) {
            write-host "`nGetting Newest Script from Github!" -ForegroundColor Cyan
            Write-Host "`nFound Data on Github Repo!" -ForegroundColor Cyan
            Invoke-WebRequest -Uri $HostnameSURL -OutFile "$location\HostnameGUI.ps1"
            Write-Host "`nDownload finished" -ForegroundColor Green
            Sleep 1
            Write-Host "`nHostname Script Updated!" -ForegroundColor Green
            return;
        }
        # ADUser Creator Script
        If ($comboBox1.SelectedItem -eq $option4) {
            #write-host "`nGetting Newest Script from Github!" -ForegroundColor Cyan
            #Write-Host "`nFound Data on Github Repo!" -ForegroundColor Cyan
            #Invoke-WebRequest -Uri $ADUSERPS1URL -OutFile "$location\ADUser_CreatorGUI.ps1"
            #Write-Host "`nDownload finished" -ForegroundColor Green
            #Sleep 1
            #Write-Host "`nAD Account Creator Script Updated!" -ForegroundColor Green
            Write-Host "AD User Creation Script Coming Soon" -ForegroundColor Yellow
            return;
        }
        # General Tech Script
        If ($comboBox1.SelectedItem -eq $option5) {
            write-host "`nGetting Newest Script from Github!" -ForegroundColor Cyan
            Write-Host "`nFound Data on Github Repo!" -ForegroundColor Cyan
            Invoke-WebRequest -Uri $GeneralTechU -OutFile "$location\GeneralTechGUI.ps1"
            Write-Host "`nDownload finished" -ForegroundColor Green
            Sleep 1
            Write-Host "`nGeneral Tech Script Updated!" -ForegroundColor Green
            return;
        }
        # General Tech Script
        If ($comboBox1.SelectedItem -eq $option6) {
            write-host "`nGetting Newest Script from Github!" -ForegroundColor Cyan
            Write-Host "`nFound Data on Github Repo!" -ForegroundColor Cyan
            Invoke-WebRequest -Uri $ZipScriptURL -OutFile "$location\ZipExtractorGUI.ps1"
            Write-Host "`nDownload finished" -ForegroundColor Green
            Sleep 1
            Write-Host "`nZip Script Updated!" -ForegroundColor Green
            return;
        }
     else { 
        Write-Host "No Option selected" -ForegroundColor Yellow 
     }
   return;
}

$LauncherForm.Close()})
$LauncherForm.Controls.Add($SetupButton)

#region Credits
$objLogoText2Name = New-Object System.Windows.Forms.Label
$objLogoText2Name.Location = New-Object System.Drawing.Size(12,175) 
$objLogoText2Name.Size = New-Object System.Drawing.Size(105,15)
$objLogoText2Name.ForeColor = [System.Drawing.Color]::FromName("Black")
$objLogoText2Name.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
$objLogoText2Name.Font = New-Object System.Drawing.Font("Lucida Console",12,[System.Drawing.FontStyle]::Regular)
$objLogoText2Name.Text = "COLLECTION"
$LauncherForm.Controls.Add($objLogoText2Name)

$objLogoText1Name = New-Object System.Windows.Forms.Label
$objLogoText1Name.Location = New-Object System.Drawing.Size(2,150) 
$objLogoText1Name.Size = New-Object System.Drawing.Size(65,15)
$objLogoText1Name.ForeColor = [System.Drawing.Color]::FromName("Black")
$objLogoText1Name.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
$objLogoText1Name.Font = New-Object System.Drawing.Font("Lucida Console",12,[System.Drawing.FontStyle]::Regular)
$objLogoText1Name.Text = "SCRIPT"
$LauncherForm.Controls.Add($objLogoText1Name)

$objLogoText1Name = New-Object System.Windows.Forms.Label
$objLogoText1Name.Location = New-Object System.Drawing.Size(265,160) 
$objLogoText1Name.Size = New-Object System.Drawing.Size(115,15)
$objLogoText1Name.ForeColor = [System.Drawing.Color]::FromName("Black")
$objLogoText1Name.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
$objLogoText1Name.Font = New-Object System.Drawing.Font("Lucida Console",12,[System.Drawing.FontStyle]::Regular)
$objLogoText1Name.Text = "SPC BURGESS"
$LauncherForm.Controls.Add($objLogoText1Name)

$objLogoText1Name = New-Object System.Windows.Forms.Label
$objLogoText1Name.Location = New-Object System.Drawing.Size(280,180) 
$objLogoText1Name.Size = New-Object System.Drawing.Size(125,15)
$objLogoText1Name.ForeColor = [System.Drawing.Color]::FromName("Black")
$objLogoText1Name.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
$objLogoText1Name.Font = New-Object System.Drawing.Font("Lucida Console",12,[System.Drawing.FontStyle]::Regular)
$objLogoText1Name.Text = "SPC SANTIAGO"
$LauncherForm.Controls.Add($objLogoText1Name)

$objLogoText1Name = New-Object System.Windows.Forms.Label
$objLogoText1Name.Location = New-Object System.Drawing.Size(255,140) 
$objLogoText1Name.Size = New-Object System.Drawing.Size(35,15)
$objLogoText1Name.ForeColor = [System.Drawing.Color]::FromName("Black")
$objLogoText1Name.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
$objLogoText1Name.Font = New-Object System.Drawing.Font("Lucida Console",12,[System.Drawing.FontStyle]::Regular)
$objLogoText1Name.Text = "By"
$LauncherForm.Controls.Add($objLogoText1Name)
#endregion

$option1 = 'Applications          [SA/WA]'
$option2 = 'Account Auditor    [Read Only]'
$option3 = 'Hostname Creator [SA/WA]'
$option4 = 'ADUser Creator    [AO]'
$option5 = 'General Tech       [SA/WA]'
$option6 = 'Zip Script             [SA/WA]'

$Choices = @($option1,$option2,$option3,$option4,$option5,$option6)
$comboBox1 = New-Object System.Windows.Forms.ComboBox
$comboBox1.Location = New-Object System.Drawing.Point(27, 15)
$comboBox1.Size = New-Object System.Drawing.Size(350, 310)
$LauncherForm.Controls.Add($comboBox1)

foreach($Selectedoption in $Choices)
{
  $comboBox1.Items.add($Selectedoption) 
} 

cls
Sleep 1
Write-Host "`nLauncher Ready`n" -ForegroundColor Cyan

$LauncherForm.KeyPreview = $True
$LauncherForm.Add_KeyDown({if ($_.KeyCode -eq "Enter"){$info=$comboBox1.SelectedItem;$LauncherForm.Close()}})
$LauncherForm.Add_KeyDown({if ($_.KeyCode -eq "Escape"){$Script:CANCELED=$True;$LauncherForm.Close()}})

$LauncherForm.TopMost = $True 
$LauncherForm.Add_Shown({$LauncherForm.Activate()}) | Out-Null
$LauncherForm.ShowDialog() | Out-Null
$LauncherForm.Dispose() | Out-Null



If ($Script:CANCELED -cne $True) { 

    If ($info -and $null) { 
        # Forever NUll basically this should never get called. 
    }
    else {
    If ($comboBox1.SelectedItem -eq $option1) {
        $ArgList = ".\ApplicationsGUI.ps1"
        Start-Process Powershell -WorkingDirectory C:\temp\Launcher\Dependencies $ArgList -verb RunAs -Wait 
        Write-Host "Applications Script Finished" -ForegroundColor Green
        return;
    }
    If ($comboBox1.SelectedItem -eq $option2) {
        $ArgList = ".\AccountAuditorGUI.ps1"
        Start-Process Powershell -WorkingDirectory C:\temp\Launcher\Dependencies $ArgList -Verb RunAs 
        Write-Host "Account Auditor Script Finished" -ForegroundColor Green
        return;
    }
    If ($comboBox1.SelectedItem -eq $option3)
    {
        $ArgList = ".\HostnameGUI.ps1"
        Start-Process Powershell -WorkingDirectory C:\temp\Launcher\Dependencies $ArgList -Verb RunAs -Wait 
        Write-Host "Hostname Creator Script Finished" -ForegroundColor Green
        return;
    }
    If ($comboBox1.SelectedItem -eq $option4) 
    {
        #$ArgList = ".\ADUser_CreationGUI.ps1"
        #Start-Process Powershell -WorkingDirectory C:\temp\Launcher\Dependencies $ArgList -Verb RunAs -Wait 
        Write-Host "AD User Creation Script Coming Soon" -ForegroundColor Yellow
        return;
    }
    If ($comboBox1.SelectedItem -eq $option5)
    {
        $ArgList = ".\GeneralTechGUI.ps1"
        Start-Process Powershell -WorkingDirectory C:\temp\Launcher\Dependencies $ArgList -Verb RunAs -Wait 
        Write-Host "General Technician Script Finished" -ForegroundColor Green
        return;
    }
    If ($comboBox1.SelectedItem -eq $option6)
    {
        $ArgList = ".\ZipExtractorGUI.ps1"
        Start-Process Powershell -WorkingDirectory C:\temp\Launcher\Dependencies $ArgList -Verb RunAs -Wait 
        Write-Host "Remote Zip Script V2 Script Finished" -ForegroundColor Green
        return;
    }
        else { Write-Host "No Option selected" -ForegroundColor Yellow }
    }
 }
 else { Write-Host "Script Exited Successfully" }        
}
MainLauncher
