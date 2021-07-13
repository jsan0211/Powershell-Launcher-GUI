# HostnameGUI Script!
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
Function ADD_COMPUTER_TO_ACTIVE_DIRECTORY {
cls
Sleep 1
Import-Module ActiveDirectory | Out-Null
Sleep 1
Write-Host "All Active Directory Modules Loaded" -ForegroundColor Cyan
Sleep 1
Write-Host "Script Ready For User Interaction" -ForegroundColor Green
Sleep 1
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms.AnchorStyles")
[void][System.Windows.Forms.Application]::EnableVisualStyles()

$HostnameForm = New-Object System.Windows.Forms.Form
$HostnameForm.Text = "[SA/WA] HOSTNAME CREATOR By SPC Burgess 2-3 FA S6 v2.0"
$HostnameForm.ClientSize = New-Object System.Drawing.Size(850, 185)
$HostnameForm.BackColor = "LightGray"
$HostnameForm.StartPosition = "CenterScreen"
$StopScript = $Script:CANCELED=$True

$iconConverted2Base64 = [Convert]::ToBase64String((Get-Content "C:\temp\Launcher\Dependencies\icon\NewPanda.ico" -Encoding Byte))
$iconBase64           = $iconConverted2Base64
$iconBytes            = [Convert]::FromBase64String($iconBase64)
$stream               = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)
$stream.Write($iconBytes, 0, $iconBytes.Length);
$iconImage            = [System.Drawing.Image]::FromStream($stream, $true)
$HostnameForm.Icon    = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())
# ico converter : https://cloudconvert.com/png-to-ico

# This is defines what Enter & escape do when pressed
$HostnameForm.KeyPreview = $True
$HostnameForm.Add_KeyDown({if ($_.KeyCode -eq "Enter") {

cls
#Set Global Vars
$HNorIPV4=$objHostnameTextBox1.Text
$Script:CANCELED=$False

# Continue on
If ($Script:CANCELED -eq $True) {
    Write-Host "`nScript Canceled" -ForegroundColor Yellow
    Sleep 1
    Write-Host "`nScript Closing Safely" -ForegroundColor Yellow
    Sleep 2
    Write-Host "`nAll Modules Exited" -ForegroundColor Green
 }
 else {
    If ($HNorIPV4 -and $null) {
        Write-Host "`nNo Hostname entered" -ForegroundColor Yellow
        Sleep 1
        Write-Host "`nScript Closing Safely" -ForegroundColor Yellow
        Sleep 2
        Write-Host "`nAll Modules Exited" -ForegroundColor Green
        $Script:CANCELED=$True
    }
    else {
        # if hostname check
        If ($objHostnameTextBox1.Text -cne $null) {$ContinueOn=$True;$Computers = $objHostnameTextBox1.Text}
        else {$ContinueOn=$False;$Script:CANCELED=$True}
        # if SAN Check
        If ($objSamAccountNameTextBox.Text -cne $null) {$ContinueOn=$True; $SamAccountName = $objSamAccountNameTextBox.Text}
        else {$ContinueOn=$False;$Script:CANCELED=$True}
        # if sec group check
        If ($objSecGroupTextBox.Text -cne $null) {$ContinueOn=$True;$CustomSecGroup = $objSecGroupTextBox.Text}
        else {$ContinueOn=$False;$Script:CANCELED=$True}
        # if path check
        If ($objADPathBox.Text -cne $null) {$ContinueOn=$True;$Path=$objADPathBox.Text}
        else {$ContinueOn=$False;$Script:CANCELED=$True}
        # if pc descrip
        If ($objpcdescripTextBox -cne $null){$ContinueOn=$True;$PCDescription=$objpcdescripTextBox.Text}
        else {$ContinueOn=$False;$Script:CANCELED=$True}
        If ($ContinueOn -cne $False) {
        ForEach ($Computer in $Computers)
        {
            # adds Computer Name to AD @Domain_Name location
            New-ADComputer -Name $Computer -SamAccountName $SamAccountName -Path $Path -Enabled $true
            Write-Host "`n`nHostname Created" -ForegroundColor Green
            Sleep 3
            $User = Get-ADComputer -Identity "CN=$Computer,$Path" -Server "nasw.ds.army.mil"
            $Group = Get-ADGroup -Identity $CustomSecGroup -Server "nasw.ds.army.mil"

            # adds BLIS FORSCOM WORKSTATION CERTIFICATE REQUEST to selected computer @Name                                                                                                                                      
            Add-ADGroupMember -Identity $Group -Members $User -Server "nasw.ds.army.mil"  
            Write-Host "`n`nAdded Security Group to Hostname : $Computer" -ForegroundColor Green
            Sleep 3
            # adds Computer Description to AD Obj @nasw.ds.army.mil location
            Set-ADComputer -Identity $User -Description $PCDescription
            Write-Host "`n`nAdded Custom Description to Hostname : $Computer" -ForegroundColor Green
            Sleep 2
        }
        Write-Host "`n`nFinished Creating Hostname!" -ForegroundColor Green
       }
       else { Write-Host "Absent Data Found" -ForegroundColor Yellow;Sleep 1;Write-Host "`nScript Closing Safely" -ForegroundColor Yellow;Sleep 2;Write-Host "`nAll Modules exited successfully" -ForegroundColor Cyan }
     }
  }

}})
$HostnameForm.Add_KeyDown({if ($_.KeyCode -eq "Escape"){write-Host "`nScript Canceled" -ForegroundColor Yellow;Sleep 1;$Script:CANCELED=$True;$HostnameForm.Close()}})

#This creates the TextBox for PCdescription
$objpcdescripTextBox = New-Object System.Windows.Forms.TextBox 
$objpcdescripTextBox.Location = New-Object System.Drawing.Size(351,135) 
$objpcdescripTextBox.Size = New-Object System.Drawing.Size(360,20)
$objpcdescripTextBox.TabIndex = 0 
$HostnameForm.Controls.Add($objpcdescripTextBox)

#This creates a label for Path Example
$objLabelpcdescrip = New-Object System.Windows.Forms.Label
$objLabelpcdescrip.Location = New-Object System.Drawing.Size(350,155) 
$objLabelpcdescrip.Size = New-Object System.Drawing.Size(200,20)
$objLabelpcdescrip.ForeColor = [System.Drawing.Color]::FromName("Blue")
$objLabelpcdescrip.Text = "Example: This text can be anything"
$HostnameForm.Controls.Add($objLabelpcdescrip)

#This creates a label for PCdescription
$objLabelpcdescripName = New-Object System.Windows.Forms.Label
$objLabelpcdescripName.Location = New-Object System.Drawing.Size(350,120) 
$objLabelpcdescripName.Size = New-Object System.Drawing.Size(145,20)
[String]$MandatoryWrite = "*" 
$objLabelpcdescripName.ForeColor = [System.Drawing.Color]::FromName("Red")
$objLabelpcdescripName.Text = "Enter New Description $MandatoryWrite"
$HostnameForm.Controls.Add($objLabelpcdescripName)


#"Example: OU=HHB,OU=Laptops,OU=2-3 FA,OU=1-1 Armored Div,OU=1st Armor Div,OU=FORSCOM,OU=Bliss,OU=Installations,DC=nasw,DC=ds,DC=army,DC=mil"



# Set Path Button
$SetPathButton = New-Object System.Windows.Forms.Button
$SetPathButton.Location = New-Object System.Drawing.Point(10,83)
$SetPathButton.Size = New-Object System.Drawing.Size(160, 75)
$SetPathButton.BackColor = "LightGray"
$SetPathButton.Text = "SET PATH"
$SetPathButton.Add_Click({
    cls
    Write-Host "Setting Path!" -ForegroundColor Cyan
    $ADPathContent = Get-Content -LiteralPath "C:\temp\Launcher\Dependencies\Directories\Hostname Path\ActiveDirectoryPath.txt" -Force
    Sleep 1
    Write-Host "`nPath Set!" -ForegroundColor Green
})
$HostnameForm.Controls.Add($SetPathButton)

# Edit Path Button
$EditPathButton = New-Object System.Windows.Forms.Button
$EditPathButton.Location = New-Object System.Drawing.Point(180,83)
$EditPathButton.Size = New-Object System.Drawing.Size(160,75)
$EditPathButton.BackColor = "LightGray"
$EditPathButton.Text = "EDIT PATH"
$EditPathButton.Add_Click({
    cls
    Write-Host "`nPreparing Active Directory Path Log..." -ForegroundColor Cyan
    Sleep 2
    Write-host "`nSet Path is case sensitive and space sensitive`n`nClick File>Save and close Notepad to continue" -ForegroundColor Yellow
    Sleep 1
    Start-Process -Wait -PSPath "notepad.exe" -ArgumentList "C:\temp\Launcher\Dependencies\Directories\Hostname Path\ActiveDirectoryPath.txt"
    Sleep 1
    Write-Host "`nReading New Path" -ForegroundColor Cyan
    $ADPathContent = Get-Content -LiteralPath "C:\temp\Launcher\Dependencies\Directories\Hostname Path\ActiveDirectoryPath.txt" -Force
    Sleep 1
    Write-Host "`nNew Path Saved to Cache!`n`nDon't Forget to click Set Path!" -ForegroundColor Green
})
$HostnameForm.Controls.Add($EditPathButton)

#This creates a label for the objADPathBox
$objLabelHostname = New-Object System.Windows.Forms.Label
$objLabelHostname.Location = New-Object System.Drawing.Size(10,70) 
$objLabelHostname.Size = New-Object System.Drawing.Size(280,20)
[String]$MandatoryWrite = "*" 
$objLabelHostname.ForeColor = [System.Drawing.Color]::FromName("Red")
$objLabelHostname.Text = "Active Directory Path $MandatoryWrite"
$HostnameForm.Controls.Add($objLabelHostname)

#This creates a label for Security Group
$objLabelsecurityGr = New-Object System.Windows.Forms.Label
$objLabelsecurityGr.Location = New-Object System.Drawing.Size(350,53) 
$objLabelsecurityGr.Size = New-Object System.Drawing.Size(400,40)
$objLabelsecurityGr.ForeColor = [System.Drawing.Color]::FromName("Blue")
$objLabelsecurityGr.Text = "Example: BLIS FORSCOM WORKSTATION CERTIFICATE REQUEST"
$HostnameForm.Controls.Add($objLabelsecurityGr)

#This creates a label for Path Example
$objLabelSANnameEg = New-Object System.Windows.Forms.Label
$objLabelSANnameEg.Location = New-Object System.Drawing.Size(180,53) 
$objLabelSANnameEg.Size = New-Object System.Drawing.Size(200,40)
$objLabelSANnameEg.ForeColor = [System.Drawing.Color]::FromName("Blue")
$objLabelSANnameEg.Text = "Example: BLISWAEQT0NBXXX$"
$HostnameForm.Controls.Add($objLabelSANnameEg)

#This creates a label for Path Example
$objLabelHostnameExample = New-Object System.Windows.Forms.Label
$objLabelHostnameExample.Location = New-Object System.Drawing.Size(10,53) 
$objLabelHostnameExample.Size = New-Object System.Drawing.Size(200,40)
$objLabelHostnameExample.ForeColor = [System.Drawing.Color]::FromName("Blue")
$objLabelHostnameExample.Text = "Example: BLISWAEQT0NBXXX"
$HostnameForm.Controls.Add($objLabelHostnameExample)

#This creates the TextBox for hostname / ip addr
$objHostnameTextBox1 = New-Object System.Windows.Forms.TextBox 
$objHostnameTextBox1.Location = New-Object System.Drawing.Size(10,33) 
$objHostnameTextBox1.Size = New-Object System.Drawing.Size(160,20)
$objHostnameTextBox1.TabIndex = 0 
$HostnameForm.Controls.Add($objHostnameTextBox1)

#This creates a label for the objHostnameTextBox1
$objLabelHostname = New-Object System.Windows.Forms.Label
$objLabelHostname.Location = New-Object System.Drawing.Size(10,20) 
$objLabelHostname.Size = New-Object System.Drawing.Size(120,20)
[String]$MandatoryWrite = "*" 
$objLabelHostname.ForeColor = [System.Drawing.Color]::FromName("Red")
$objLabelHostname.Text = "Enter New Hostname $MandatoryWrite"
$HostnameForm.Controls.Add($objLabelHostname)

#This creates the TextBox for SamAccountName
$objSamAccountNameTextBox = New-Object System.Windows.Forms.TextBox 
$objSamAccountNameTextBox.Location = New-Object System.Drawing.Size(181,33) 
$objSamAccountNameTextBox.Size = New-Object System.Drawing.Size(160,20)
$objSamAccountNameTextBox.TabIndex = 0 
$HostnameForm.Controls.Add($objSamAccountNameTextBox)

#This creates a label for the objLabelSamAccountName
$objLabelSamAccountName = New-Object System.Windows.Forms.Label
$objLabelSamAccountName.Location = New-Object System.Drawing.Size(180,20) 
$objLabelSamAccountName.Size = New-Object System.Drawing.Size(140,20)
[String]$MandatoryWrite = "*" 
$objLabelSamAccountName.ForeColor = [System.Drawing.Color]::FromName("Red")
$objLabelSamAccountName.Text = "Enter New SAN $MandatoryWrite"
$HostnameForm.Controls.Add($objLabelSamAccountName)

#This creates the TextBox for SecurityGroup
$objSecGroupTextBox = New-Object System.Windows.Forms.TextBox 
$objSecGroupTextBox.Location = New-Object System.Drawing.Size(351,33) 
$objSecGroupTextBox.Size = New-Object System.Drawing.Size(360,20)
$objSecGroupTextBox.TabIndex = 0 
$HostnameForm.Controls.Add($objSecGroupTextBox)

#This creates a label for the SecurityGroup
$objLabelSecGroupName = New-Object System.Windows.Forms.Label
$objLabelSecGroupName.Location = New-Object System.Drawing.Size(350,20) 
$objLabelSecGroupName.Size = New-Object System.Drawing.Size(145,20)
[String]$MandatoryWrite = "*" 
$objLabelSecGroupName.ForeColor = [System.Drawing.Color]::FromName("Red")
$objLabelSecGroupName.Text = "Enter New Security Group $MandatoryWrite"
$HostnameForm.Controls.Add($objLabelSecGroupName)

# Start Button
$ButtonStart = New-Object System.Windows.Forms.Button
$ButtonStart.Location = New-Object System.Drawing.Point(2, 160)
$ButtonStart.Size = New-Object System.Drawing.Size(98, 23)
$ButtonStart.BackColor = "LightGray"
$ButtonStart.Text = "LAUNCH"
$ButtonStart.Add_Click({
cls
#Set Global Vars
$HNorIPV4=$objHostnameTextBox1.Text
$Script:CANCELED=$False

# Continue on
If ($Script:CANCELED -eq $True) {
    Write-Host "`nScript Canceled" -ForegroundColor Yellow
    Sleep 1
    Write-Host "`nScript Closing Safely" -ForegroundColor Yellow
    Sleep 2
    Write-Host "`nAll Modules Exited" -ForegroundColor Green
 }
 else {
    If ($HNorIPV4 -and $null) {
        Write-Host "`nNo Hostname entered" -ForegroundColor Yellow
        Sleep 1
        Write-Host "`nScript Closing Safely" -ForegroundColor Yellow
        Sleep 2
        Write-Host "`nAll Modules Exited" -ForegroundColor Green
        $Script:CANCELED=$True
    }
    else {
        # if hostname check
        If ($objHostnameTextBox1.Text -cne $null) {$ContinueOn=$True;$Computers = $objHostnameTextBox1.Text}
        else {$ContinueOn=$False;$Script:CANCELED=$True}
        # if SAN Check
        If ($objSamAccountNameTextBox.Text -cne $null) {$ContinueOn=$True; $SamAccountName = $objSamAccountNameTextBox.Text}
        else {$ContinueOn=$False;$Script:CANCELED=$True}
        # if sec group check
        If ($objSecGroupTextBox.Text -cne $null) {$ContinueOn=$True;$CustomSecGroup = $objSecGroupTextBox.Text}
        else {$ContinueOn=$False;$Script:CANCELED=$True}
        # if pc description
        If ($objpcdescripTextBox -cne $null){$ContinueOn=$True;$PCDescription=$objpcdescripTextBox.Text}
        else {$ContinueOn=$False;$Script:CANCELED=$True}
        If ($ContinueOn -cne $False) {
        ForEach ($Computer in $Computers)
        {
            $ADPathContent = Get-Content -LiteralPath "C:\temp\Launcher\Dependencies\Directories\Hostname Path\ActiveDirectoryPath.txt" -Force
            # adds Computer Name to AD @Domain_Name location
            New-ADComputer -Name $Computer -SamAccountName $SamAccountName -Path $ADPathContent -Enabled $true
            Write-Host "Creating Hostname $Computer" -ForegroundColor Green
            Sleep 3
            $User = Get-ADComputer -Identity "CN=$Computer,$ADPathContent" -Server "nasw.ds.army.mil"
            $Group = Get-ADGroup -Identity $CustomSecGroup -Server "nasw.ds.army.mil"

            # adds BLIS FORSCOM WORKSTATION CERTIFICATE REQUEST to selected computer @Name                                                                                                                                      
            Add-ADGroupMember -Identity $Group -Members $User -Server "nasw.ds.army.mil"  
            Write-Host "`nAdded Security Group to Hostname : $Computer" -ForegroundColor Green
            Sleep 3
            # adds Computer Description to AD Obj @nasw.ds.army.mil location
            Set-ADComputer -Identity $User -Description $PCDescription
            Write-Host "`nAdded Custom Description to Hostname : $Computer" -ForegroundColor Green
            Sleep 2
        }
        Write-Host "`nFinished Creating Hostname : $Computer" -ForegroundColor Green
       }
       else { Write-Host "Absent Data Found" -ForegroundColor Yellow;Sleep 1;Write-Host "`nScript Closing Safely" -ForegroundColor Yellow;Sleep 2;Write-Host "`nAll Modules exited successfully" -ForegroundColor Cyan }
     }
  }
})
$HostnameForm.Controls.Add($ButtonStart)

# Cancel Button
$ButtonStop = New-Object System.Windows.Forms.Button
$ButtonStop.Location = New-Object System.Drawing.Point(102, 160)
$ButtonStop.Size = New-Object System.Drawing.Size(98, 23)
$ButtonStop.BackColor = "LightGray"
$ButtonStop.Text = "CANCEL"
$ButtonStop.Add_Click({write-Host "`nScript Canceled" -ForegroundColor Yellow;Sleep 1;$Script:CANCELED=$True;$HostnameForm.Close()})
$HostnameForm.Controls.Add($ButtonStop)

# execute Front End
$HostnameForm.FormBorderStyle = 'Fixed3D' # Static Box
$HostnameForm.MinimizeBox = $False # Close Box option only
$HostnameForm.MaximizeBox = $False # Static Box
$HostnameForm.Add_Shown({$HostnameForm.Activate()})
$HostnameForm.ShowDialog() | Out-Null
$HostnameForm.Dispose() | Out-Null
}
# Execute Func
ADD_COMPUTER_TO_ACTIVE_DIRECTORY


