




Function ZipExtractor {
    cls
    Sleep 1
    Write-Host "Zip Script Ready For User Interaction" -ForegroundColor Green
    Sleep 1
    [void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    [void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
    [void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms.AnchorStyles")
    [void][System.Windows.Forms.Application]::EnableVisualStyles()


    # Draw Form
    $ZipExtractorForm = New-Object System.Windows.Forms.Form
    $ZipExtractorForm.Text = "[SA/WA] Zip Script v2.0"
    $ZipExtractorForm.ClientSize = New-Object System.Drawing.Size(400, 185)
    $ZipExtractorForm.BackColor = "LightGray"
    $ZipExtractorForm.StartPosition = "CenterScreen"
    $StopScript = $Script:CANCELED=$True

    # Draw Icon
    $iconConverted2Base64 = [Convert]::ToBase64String((Get-Content "C:\temp\Launcher\Dependencies\icon\NewPanda.ico" -Encoding Byte))
    $iconBase64           = $iconConverted2Base64
    $iconBytes            = [Convert]::FromBase64String($iconBase64)
    $stream               = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)
    $stream.Write($iconBytes, 0, $iconBytes.Length);
    $iconImage            = [System.Drawing.Image]::FromStream($stream, $true)
    $ZipExtractorForm.Icon    = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())
    # ico converter : https://cloudconvert.com/png-to-ico

    # This is defines what Enter does when pressed
    $ZipExtractorForm.KeyPreview = $True
    $ZipExtractorForm.Add_KeyDown({if ($_.KeyCode -eq "Enter") {
        # Currently Nothing..

    }})

    # creates the label title
    $titleLabel = New-Object System.Windows.Forms.Label
    $titleLabel.Location = New-Object System.Drawing.Point(190, 25)
    $titleLabel.Size = New-Object System.Drawing.Size(198, 20)
    $titleLabel.ForeColor = "Black"
    $titleLabel.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
    $titleLabel.Font = New-Object System.Drawing.Font("Lucida Console",14,[System.Drawing.FontStyle]::Regular)
    $titleLabel.Text = "Zip Script V2"
    $ZipExtractorForm.Controls.Add($titleLabel)

    # Give us the credit.. This took months to complete.
    $CreditsLabel1 = New-Object System.Windows.Forms.Label
    $CreditsLabel1.Location = New-Object System.Drawing.Point(200, 145)
    $CreditsLabel1.Size = New-Object System.Drawing.Size(198, 60)
    $CreditsLabel1.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
    $CreditsLabel1.ForeColor = "Black"
    $CreditsLabel1.Text = "SPC Santiago - [Frontend Developer]`n PFC Leonard  - [Frontend Developer]`n  SPC Burgess  - [Backend Developer]"
    $ZipExtractorForm.Controls.Add($CreditsLabel1)

    # This creates credits label!
    $CreditsLabel = New-Object System.Windows.Forms.Label
    $CreditsLabel.Location = New-Object System.Drawing.Point(197, 130)
    $CreditsLabel.Size = New-Object System.Drawing.Size(98, 20)
    $CreditsLabel.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
    $CreditsLabel.ForeColor = "Black"
    $CreditsLabel.Text = "Credits:"
    $ZipExtractorForm.Controls.Add($CreditsLabel)

    # Cancel Button
    $InstructionalButtons1 = New-Object System.Windows.Forms.Button
    $InstructionalButtons1.Location = New-Object System.Drawing.Point(290, 106)
    $InstructionalButtons1.Size = New-Object System.Drawing.Size(98, 23)
    $InstructionalButtons1.BackColor = "LightGray"
    $InstructionalButtons1.Text = "INSTRUCTIONS"
    $InstructionalButtons1.Add_Click({
        cls
 
        Write-Host "Checking for Instructions one moment..." -ForegroundColor Cyan

        Sleep 1

        $Date = Get-Date
        
        if ((Test-Path -LiteralPath "C:\temp\Launcher\Logs\ZIP_EXTRACTOR.txt") -and $null) {
            
            Write-Host "`nCreating Instructions one moment..." -ForegroundColor Cyan
            
            Sleep 1
            
            Set-Content -Path "C:\temp\Launcher\Logs\ZIP_EXTRACTOR.txt" -Value ("******************************************************`n`n     Zip Extractor Ran at: $Date`n`n******************************************************`n`nInstruction Steps`n- Open Powershell as Admin.`n`n- Type the Following Commands:`n`ncd C:\temp\Launcher`n.\Launcher`n`nNow Enter the Remote Computers name`n`nNow type the exact path to the zip file + the zip files name.`n`nEnjoy, this can be useful for those of you that like to store massive amounts of data in a single folder.`nThis will also compress the data to make it lighter on the sharedrive!`n`n`n`n`nDeveloped by SPC Burgess 2-3 FA S6 Fort Bliss TX") -force
        }
        else {
            if ((Test-Path -LiteralPath "C:\temp\Launcher\Logs\ZIP_EXTRACTOR.txt") -cne $null) {
                Remove-item -LiteralPath "C:\temp\Launcher\Logs\ZIP_EXTRACTOR.txt" -Force
            }
            Sleep 1
            
            Set-Content -Path "C:\temp\Launcher\Logs\ZIP_EXTRACTOR.txt" -Value ("******************************************************`n`n     Zip Extractor Ran at: $Date`n`n******************************************************`n`nInstruction Steps`n- Open Powershell as Admin.`n`n- Type the Following Commands:`n`ncd C:\temp\Launcher`n.\Launcher`n`nNow Enter the Remote Computers name`n`nNow type the exact path to the zip file + the zip files name.`n`nEnjoy, this can be useful for those of you that like to store massive amounts of data in a single folder.`nThis will also compress the data to make it lighter on the sharedrive!`n`n`n`n`nDeveloped by SPC Burgess 2-3 FA S6 Fort Bliss TX") -force
        
            Sleep 1

            start-process "C:\Windows\System32\notepad.exe" -FilePath "C:\temp\Launcher\Logs\ZIP_EXTRACTOR.txt"
        }
        
        
        Sleep 1
    cls
    })
    $ZipExtractorForm.Controls.Add($InstructionalButtons1)

    #This creates the TextBox for hostname / ip addr
    $objZipExtractorTextBox1 = New-Object System.Windows.Forms.TextBox 
    $objZipExtractorTextBox1.Location = New-Object System.Drawing.Size(10,33) 
    $objZipExtractorTextBox1.Size = New-Object System.Drawing.Size(160,20)
    $objZipExtractorTextBox1.TabIndex = 0 
    $ZipExtractorForm.Controls.Add($objZipExtractorTextBox1)

    #This creates a label for the objLabelZipExtractor
    $objLabelZipExtractorHN = New-Object System.Windows.Forms.Label
    $objLabelZipExtractorHN.Location = New-Object System.Drawing.Size(10,20) 
    $objLabelZipExtractorHN.Size = New-Object System.Drawing.Size(120,20)
    [String]$MandatoryWrite = "*" 
    $objLabelZipExtractorHN.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
    $objLabelZipExtractorHN.ForeColor = [System.Drawing.Color]::FromName("Red")
    $objLabelZipExtractorHN.Text = "Enter New Hostname $MandatoryWrite"
    $ZipExtractorForm.Controls.Add($objLabelZipExtractorHN)

    #File Path
    $objZipExtractorFilePathTextBox = New-Object System.Windows.Forms.TextBox 
    $objZipExtractorFilePathTextBox.Location = New-Object System.Drawing.Size(10,66) 
    $objZipExtractorFilePathTextBox.Size = New-Object System.Drawing.Size(375,20)
    $objZipExtractorFilePathTextBox.TabIndex = 1 
    $ZipExtractorForm.Controls.Add($objZipExtractorFilePathTextBox)

    
    #This creates a label for the File PAth Label
    $objLabelZipExtractorPathlabel = New-Object System.Windows.Forms.Label
    $objLabelZipExtractorPathlabel.Location = New-Object System.Drawing.Size(10,53) 
    $objLabelZipExtractorPathlabel.Size = New-Object System.Drawing.Size(130,20)
    [String]$MandatoryWrite = "*" 
    $objLabelZipExtractorPathlabel.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
    $objLabelZipExtractorPathlabel.ForeColor = [System.Drawing.Color]::FromName("Red")
    $objLabelZipExtractorPathlabel.Text = "Enter Path + File Name $MandatoryWrite"
    $ZipExtractorForm.Controls.Add($objLabelZipExtractorPathlabel)

    #File Name
    $objZipExtractorFileNameTextBox = New-Object System.Windows.Forms.TextBox 
    $objZipExtractorFileNameTextBox.Location = New-Object System.Drawing.Size(10,114) 
    $objZipExtractorFileNameTextBox.Size = New-Object System.Drawing.Size(160,20)
    $objZipExtractorFileNameTextBox.TabIndex = 2 
    $ZipExtractorForm.Controls.Add($objZipExtractorFileNameTextBox)

    #This creates a label for the file name label
    $objLabelZipExtractorfilenamelabel = New-Object System.Windows.Forms.Label
    $objLabelZipExtractorfilenamelabel.Location = New-Object System.Drawing.Size(10,101) 
    $objLabelZipExtractorfilenamelabel.Size = New-Object System.Drawing.Size(120,20)
    [String]$MandatoryWrite = "*" 
    $objLabelZipExtractorfilenamelabel.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
    $objLabelZipExtractorfilenamelabel.ForeColor = [System.Drawing.Color]::FromName("Red")
    $objLabelZipExtractorfilenamelabel.Text = "File Name $MandatoryWrite"
    $ZipExtractorForm.Controls.Add($objLabelZipExtractorfilenamelabel)

    #This creates a label for the File PAth Label example
    $objLabelZipExtractorPathexample = New-Object System.Windows.Forms.Label
    $objLabelZipExtractorPathexample.Location = New-Object System.Drawing.Size(10,86) 
    $objLabelZipExtractorPathexample.Size = New-Object System.Drawing.Size(300,20) 
    $objLabelZipExtractorPathexample.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
    $objLabelZipExtractorPathexample.ForeColor = [System.Drawing.Color]::FromName("Blue")
    $objLabelZipExtractorPathexample.Text = "Example: \\ShareDrive\Directory\FileName.zip"
    $ZipExtractorForm.Controls.Add($objLabelZipExtractorPathexample)
    
    #This creates a label for the File name example.
    $objLabelZipExtractorPathexample = New-Object System.Windows.Forms.Label
    $objLabelZipExtractorPathexample.Location = New-Object System.Drawing.Size(10,134) 
    $objLabelZipExtractorPathexample.Size = New-Object System.Drawing.Size(300,20) 
    $objLabelZipExtractorPathexample.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
    $objLabelZipExtractorPathexample.ForeColor = [System.Drawing.Color]::FromName("Blue")
    $objLabelZipExtractorPathexample.Text = "Example: FileName.zip"
    $ZipExtractorForm.Controls.Add($objLabelZipExtractorPathexample)

    

    # Start Button
    $ButtonStart = New-Object System.Windows.Forms.Button
    $ButtonStart.Location = New-Object System.Drawing.Point(2, 160)
    $ButtonStart.Size = New-Object System.Drawing.Size(98, 23)
    $ButtonStart.BackColor = "LightGray"
    $ButtonStart.Text = "LAUNCH"
    $ButtonStart.Add_Click({
    cls
    # Set Global Vars
    $HNorIPV4=$objZipExtractorTextBox1.Text
    $Script:CANCELED=$False

    # Continue on
    If ($Script:CANCELED -eq $True) {
        Write-Host "`nScript Canceled" -ForegroundColor Yellow
        Sleep 1
        Write-Host "`nScript Exiting Current Process" -ForegroundColor Yellow
        Sleep 2
        Write-Host "`nAll Modules Exited" -ForegroundColor Green
    }
    else {
        If ($HNorIPV4 -and $null) {
            Write-Host "`nNo Hostname entered" -ForegroundColor Yellow
            Sleep 1
            Write-Host "`nScript Exiting Current Process" -ForegroundColor Yellow
            Sleep 2
            Write-Host "`nAll Modules Exited" -ForegroundColor Green
            $Script:CANCELED=$True
        }
        else {
            [String]$Computers = $HNorIPV4 # Get-InputBox "ZIP EXTRACTOR v1.0" "Enter Destination Computer Name"
            [String]$FileName = $objZipExtractorFilePathTextBox.Text  # Get-InputBox "ZIP EXTRACTOR v1.0" "Enter Path + Name`nIE: \\ShareDrive\Directory\FileName.zip"
            [String]$FileName2Extract = $objZipExtractorFileNameTextBox.Text # Get-InputBox "ZIP EXTRACTOR v1.0" "Enter Only the File Name IE: FileName.zip"

            [String]$QueryPath = "$FileName"
            [String]$DownloadLocation = $FileName
            [String]$DestinationPath = "C:\temp"
            [String]$YetAnotherPath = "\\$Computers\C$\temp\$FileName"
            If ($FileName -and $null)
            {
               Write-Host "`nNo Path entered" -ForegroundColor Yellow
                Sleep 1
                Write-Host "`nScript Exiting Current Process" -ForegroundColor Yellow
                Sleep 2
                Write-Host "`nAll Modules Exited" -ForegroundColor Green 
            }
            If ($FileName2Extract -and $null)
            {
                Write-Host "`nNo File Name entered" -ForegroundColor Yellow
                Sleep 1
                Write-Host "`nScript Exiting Current Process" -ForegroundColor Yellow
                Sleep 2
                Write-Host "`nAll Modules Exited" -ForegroundColor Green 
            }
            else {
                Sleep 1
                Write-Host "`nDownloading Data Please Wait..." -ForegroundColor Cyan
                xcopy $QueryPath "\\$Computers\C$\temp" /H /Y
                Write-Host "`nExtracting Data Please Wait..." -ForegroundColor Cyan
                Sleep 1
                PSEXEC \\$Computers -s Powershell -command Expand-Archive -Path "C:\temp\$FileName2Extract" -DestinationPath $DestinationPath
                Write-Host "`nSuccessfully Extracted Data" -ForegroundColor Green 
                Sleep 1
                Write-Host "`nDeleting Zip Archive From Remote Host : $Computers" -ForegroundColor Cyan
                PSEXEC \\$Computers -s Powershell -command Remove-Item -Path "C:\temp\$FileName2Extract" -Force
                Sleep 1 
                Write-Host "`nScript Finished, Script Ready!" -ForegroundColor Green
            }
        }
  }
})
$ZipExtractorForm.Controls.Add($ButtonStart)



    # Cancel Button
    $ButtonStop = New-Object System.Windows.Forms.Button
    $ButtonStop.Location = New-Object System.Drawing.Point(102, 160)
    $ButtonStop.Size = New-Object System.Drawing.Size(98, 23)
    $ButtonStop.BackColor = "LightGray"
    $ButtonStop.Text = "CANCEL"
    $ButtonStop.Add_Click({write-Host "`nScript Canceled" -ForegroundColor Yellow;Sleep 1;write-host "`nScript Closing Safely" -ForegroundColor Cyan;Sleep 1;$Script:CANCELED=$True;cls;$ZipExtractorForm.Close()})
    $ZipExtractorForm.Controls.Add($ButtonStop)

    # Finally Render it all.
    $ZipExtractorForm.Add_Shown({$ZipExtractorForm.Activate()})
    $ZipExtractorForm.ShowDialog() | Out-Null
    $ZipExtractorForm.Dispose() | Out-Null

}

ZipExtractor