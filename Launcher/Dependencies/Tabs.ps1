Function GeneralTool{

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
#[system.windows.forms]::jitDebugging("false") 

<#
try { . ("C:\temp\Launcher\Dependencies\Get-InputBox.ps1") }
catch { Write-Host -f Yellow "Unable to Located File" }
#>


#[System.Windows.Forms.Application]::EnableVisualStyles()

# Globals 
<#
$exactadminfile = "\\blisw6syaaa7nec\IMO_Info\Available Software & Fixes\PS_Tools\PsExec.exe" 
$userfile = "C:\Windows\System32" 
$FinalFileString = "$exactadminfile`n$userfile"
$LocalHostName = [System.Net.DNS]::GetHostByName($null).HostName; # returns : TheHostname.nasw.ds.army.mil
#>


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
$TempDBPage = New-Object System.Windows.Forms.TabPage

#TempDB Page
$TempDBPage.DataBindings.DefaultDataSourceUpdateMode = 0
$TempDBPage.UseVisualStyleBackColor = $True
$TempDBPage.Text = "TempDB”
$tabControl.Controls.Add($TempDBPage)


$GForm.Add_Shown({$GForm.Activate()})
$GForm.ShowDialog() | Out-Null
$GForm.Dispose() | Out-Null
}

GeneralTool
