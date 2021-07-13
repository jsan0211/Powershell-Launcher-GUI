# Launcher Script
# ~Script By SPC Burgess & SPC Santiago 2-3 FA S6 03/02/2021
# MOS: 25B
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

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Point(150, 20)
$Button.Size = New-Object System.Drawing.Size(98, 23)
$Button.BackColor = "LightGray"
$Button.ForeColor = "Black"
$Button.Text = "Launch"
$Button.add_Click({$Script:CANCELED=$False;$info=$comboBox1.SelectedItem;$LauncherForm.Close()})
$LauncherForm.Controls.Add($Button)

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
$option4 = 'ADUser Creation   [AO]'
$option5 = 'General Tech        [SA/WA]'
$option6 = 'Zip Extractor V2    [SA/WA]'

$Choices = @($option1,$option2,$option3,$option4,$option5,$option6)
$comboBox1 = New-Object System.Windows.Forms.ComboBox
$comboBox1.Location = New-Object System.Drawing.Point(25, 55)
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
        #$ArgList = "start ADUser_CreationGUI.ps1"
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
        Write-Host "Remote Zip Extractor V2 Script Finished" -ForegroundColor Green
        return;
    }
        else { Write-Host "No Option selected" -ForegroundColor Yellow }
    }
 }
else { Write-Host "Script Exited Successfully" }    
}
MainLauncher
