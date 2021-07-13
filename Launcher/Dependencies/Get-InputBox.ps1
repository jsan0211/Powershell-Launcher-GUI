function Get-InputBox($formTitle, $textTitle){
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
    $Script:userInput=$null
    $Script:CANCELED=$false
    
    $objForm = New-Object System.Windows.Forms.Form
    $objForm.Text = $formTitle
    $objForm.Size = New-Object System.Drawing.Size(300,200)
    $objForm.StartPosition = "CenterScreen"

    $objForm.KeyPreview = $True
    $objForm.Add_KeyDown({if ($_.KeyCode -eq "Enter") {$Script:userInput=$objTextBox.Text;$objForm.Close()}})
    $objForm.Add_KeyDown({if ($_.KeyCode -eq "Escape") {$Script:CANCELED=$true;$objForm.Close()}})

    $OKButton = New-Object System.Windows.Forms.Button
    $OKButton.Location = New-Object System.Drawing.Size(75,120)
    $OKButton.Size = New-Object System.Drawing.Size(75,23)
    $OKButton.Text = "OK"
    $OKButton.Add_Click({$Script:userInput=$objTextBox.Text;$objForm.Close()})
    $objForm.Controls.Add($OKButton)

    $CANCELButton = New-Object System.Windows.Forms.Button
    $CANCELButton.Location = New-Object System.Drawing.Size(150,120)
    $CANCELButton.Size = New-Object System.Drawing.Size(75,23)
    $CANCELButton.Text = "CANCEL"
    $CANCELButton.Add_Click({$Script:CANCELED=$true;$objForm.Close()})
    $objForm.Controls.Add($CANCELButton)

    $objLabel = New-Object System.Windows.Forms.Label
    $objLabel.Location = New-Object System.Drawing.Size(10,20)
    $objLabel.Size = New-Object System.Drawing.Size(280,30)
    $objLabel.Text = $textTitle
    $objForm.Controls.Add($objLabel)

    $objTextBox = New-Object System.Windows.Forms.TextBox
    $objTextBox.Location = New-Object System.Drawing.Size(10,50)
    $objTextBox.Size = New-Object System.Drawing.Size(260,20)
    $objForm.Controls.Add($objTextBox)

    $objForm.Topmost = $True

    $objForm.Add_Shown({$objForm.Activate()})

    [void] $objForm.ShowDialog()

    IF(($userInput.Length -eq 0) -and (!($Script:CANCELED))) {$userInput = $env:COMPUTERNAME}

    return $userInput
}

# $Computers = Get-InputBox "Test Text" "Please Enter Computer Name" 