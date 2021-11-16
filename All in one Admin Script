# Allinone Script
# ~Script By SPC Burgess & SPC Santiago 2-3 FA S6 07/272021 @ 07:34
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



function CreateForm {
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.drawing

#region Global_Definitions
#Form Setup
$form1 = New-Object System.Windows.Forms.Form
#$anything = new-object System.Windows.Forms.Page
$outputBox = New-Object System.Windows.Forms.TextBox
$Gbutton = New-Object System.Windows.Forms.Button
$Hostnamebutton = New-Object System.Windows.Forms.Button
$ADUserbutton = New-Object System.Windows.Forms.Button
$Appbutton = New-Object System.Windows.Forms.Button
$Zipbutton = New-Object System.Windows.Forms.Button
$Themebutton = New-Object System.Windows.Forms.Button
$button1 = New-Object System.Windows.Forms.Button
$button2 = New-Object System.Windows.Forms.Button
$button3 = New-Object System.Windows.Forms.Button
$button4 = New-Object System.Windows.Forms.Button
$button5 = New-Object System.Windows.Forms.Button
$button6 = New-Object System.Windows.Forms.Button
$button7 = New-Object System.Windows.Forms.Button
$button8 = New-Object System.Windows.Forms.Button
$button9 = New-Object System.Windows.Forms.Button
$button1Bit = New-Object System.Windows.Forms.Button
$button2Bit = New-Object System.Windows.Forms.Button
$button3Bit = New-Object System.Windows.Forms.Button
$button4Bit = New-Object System.Windows.Forms.Button
$button5Bit = New-Object System.Windows.Forms.Button
$ADBackupBox = New-Object System.Windows.Forms.TextBox
$button1Users = New-Object System.Windows.Forms.Button
$button2Users = New-Object System.Windows.Forms.Button
$button3Users = New-Object System.Windows.Forms.Button
$button4Users = New-Object System.Windows.Forms.Button
$button5Users = New-Object System.Windows.Forms.Button
$DefaultThemeButton = New-Object System.Windows.Forms.Button
$DarkThemeButton = New-Object System.Windows.Forms.Button
$LightThemeButton = New-Object System.Windows.Forms.Button
$TabControl = New-object System.Windows.Forms.TabControl
$TroubleshootingPage = New-Object System.Windows.Forms.TabPage
$CPUPage = New-Object System.Windows.Forms.TabPage
$BitlockerPage = New-Object System.Windows.Forms.TabPage
$UsersPage = New-Object System.Windows.Forms.TabPage
$objLabel1 = New-Object System.Windows.Forms.Label
$objTextBox1 = New-Object System.Windows.Forms.TextBox
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
$objChromeCheckbox = New-Object System.Windows.Forms.Checkbox
$objFireFoxCheckbox = New-Object System.Windows.Forms.Checkbox 
$objMSTEAMSCheckbox = New-Object System.Windows.Forms.Checkbox 
$objCitrixCheckbox = New-Object System.Windows.Forms.Checkbox 
$objDCAMCheckbox = New-Object System.Windows.Forms.Checkbox
$objWinGUICheckbox = New-Object System.Windows.Forms.Checkbox
$objAdobeDCPROCheckbox = New-Object System.Windows.Forms.Checkbox
$objSharePointDesigner2013Checkbox = New-Object System.Windows.Forms.Checkbox
$objJoeSmithCheckbox = New-Object System.Windows.Forms.CheckBox
$ButtonInstall = New-Object System.Windows.Forms.Button
$objGEarthCheckbox = New-Object System.Windows.Forms.CheckBox
$objDisableLogsCheckbox = New-Object System.Windows.Forms.CheckBox
$objSamAccountNameTextBox = New-Object System.Windows.Forms.TextBox
$objLabelSamAccountName = New-Object System.Windows.Forms.Label
$objLabelSecGroupName = New-Object System.Windows.Forms.Label
$objSecGroupTextBox = New-Object System.Windows.Forms.TextBox 
$updateADPath = New-Object System.Windows.Forms.Button
$objLabelpcdescripName = New-Object System.Windows.Forms.Label
$objpcdescripTextBox = New-Object System.Windows.Forms.TextBox 
$ButtonStart = New-Object System.Windows.Forms.Button
$objLabelZipExtractorPathlabel = New-Object System.Windows.Forms.Label
$objZipExtractorFilePathTextBox = New-Object System.Windows.Forms.TextBox 
$objLabelZipExtractorfilenamelabel = New-Object System.Windows.Forms.Label
$objZipExtractorFileNameTextBox = New-Object System.Windows.Forms.TextBox 
$objTextBoxlastname = New-Object System.Windows.Forms.TextBox
$objLabelLastname = New-Object System.Windows.Forms.Label
$objLabelfirstname = New-Object System.Windows.Forms.TextBox
$objTextBoxfirstname = New-Object System.Windows.Forms.Label
$objTextBoxmi = New-Object System.Windows.Forms.TextBox
$objLabelmi = New-Object System.Windows.Forms.Label
$objTextBoxDODID = New-Object System.Windows.Forms.TextBox
$objLabelDODID = New-Object System.Windows.Forms.Label
$objTextBoxrnk = New-Object System.Windows.Forms.TextBox
$objLabelrnk = New-Object System.Windows.Forms.Label
$objTextBoxemail = New-Object System.Windows.Forms.TextBox
$objLabelEmail = New-Object System.Windows.Forms.Label
#endregion Global_Definitions

#region Form_Drawing
#Form Parameter
$form1.Text = "Master Tool [SA/WA/AO]"
$form1.Name = "form1"
$form1.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Size = New-Object System.Drawing.Size
$form1.BackColor = "White"
$System_Drawing_Size.Width = 900
$System_Drawing_Size.Height = 700
$form1.FormBorderStyle = 'Fixed3D'
$form1.ClientSize = $System_Drawing_Size
#endregion

#region logo

# Draws Logo
$img = [System.Drawing.Image]::Fromfile('C:\temp\Launcher\Dependencies\icon\Panda\NewPanda.png')
$form1.BackgroundImage = $img
$form1.BackgroundImageLayout = "Center"

#endregion

#region Global_Hostname_Box
#Add Label and TextBox
$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(175,20)  
$objLabel.Size = New-Object System.Drawing.Size(110,20)  
$objLabel.Text = "Enter Hostname"
$form1.Controls.Add($objLabel)
$objTextBoxHostname = New-Object System.Windows.Forms.TextBox 
$objTextBoxHostname.Location = New-Object System.Drawing.Size(120,45) 
$objTextBoxHostname.Size = New-Object System.Drawing.Size(200,20)  
$form1.Controls.Add($objTextBoxHostname)
#endregion Global_Hostname_Box

#region verbose_box

#Verbose Output box
$outputBox = New-Object System.Windows.Forms.TextBox 
$outputBox.Location = New-Object System.Drawing.Size(75,450) 
$outputBox.Size = New-Object System.Drawing.Size(750,200) 
$outputBox.MultiLine = $True 
$outputBox.ScrollBars = "Vertical"
$form1.Controls.Add($outputBox)

#endregion

#region draws everything

#region Applications content

#This creates a checkbox 
$objChromeCheckbox.Location = New-Object System.Drawing.Size(30,110) 
$objChromeCheckbox.Size = New-Object System.Drawing.Size(350,20)
$objChromeCheckbox.Text = "Install Google Chrome"
$objChromeCheckbox.TabIndex = 2

#This creates a checkbox 
$objFireFoxCheckbox.Location = New-Object System.Drawing.Size(30,130) 
$objFireFoxCheckbox.Size = New-Object System.Drawing.Size(350,20)
$objFireFoxCheckbox.Text = "Install FireFox"
$objFireFoxCheckbox.TabIndex = 3

#This creates a checkbox 
$objMSTEAMSCheckbox.Location = New-Object System.Drawing.Size(30,150) 
$objMSTEAMSCheckbox.Size = New-Object System.Drawing.Size(350,20)
$objMSTEAMSCheckbox.Text = "Install MS Teams"
$objMSTEAMSCheckbox.TabIndex = 4

#This creates a checkbox 
$objCitrixCheckbox.Location = New-Object System.Drawing.Size(30,170) 
$objCitrixCheckbox.Size = New-Object System.Drawing.Size(350,20)
$objCitrixCheckbox.Text = "Install Citrix"
$objCitrixCheckbox.TabIndex = 4

#This creates a checkbox  
$objDCAMCheckbox.Location = New-Object System.Drawing.Size(30,190) 
$objDCAMCheckbox.Size = New-Object System.Drawing.Size(350,20)
$objDCAMCheckbox.Text = "Install DCAM"
$objDCAMCheckbox.TabIndex = 5

#This creates a checkbox  
$objWinGUICheckbox.Location = New-Object System.Drawing.Size(30,210) 
$objWinGUICheckbox.Size = New-Object System.Drawing.Size(350,20)
$objWinGUICheckbox.Text = "Install GSS Army (WinGUI)"
$objWinGUICheckbox.TabIndex = 6

#This creates a checkbox  
$objAdobeDCPROCheckbox.Location = New-Object System.Drawing.Size(30,230) 
$objAdobeDCPROCheckbox.Size = New-Object System.Drawing.Size(350,20)
$objAdobeDCPROCheckbox.Text = "Install Adobe DC Pro"
$objAdobeDCPROCheckbox.TabIndex = 7

#This creates a checkbox  
$objSharePointDesigner2013Checkbox.Location = New-Object System.Drawing.Size(30,250) 
$objSharePointDesigner2013Checkbox.Size = New-Object System.Drawing.Size(350,20)
$objSharePointDesigner2013Checkbox.Text = "Install Share Point Designer 2013"
$objSharePointDesigner2013Checkbox.TabIndex = 8

#Santiago's checkbox
$objJoeSmithCheckbox.Location = New-Object System.Drawing.Size(30,270)
$objJoeSmithCheckbox.size = New-Object System.Drawing.Size(350,20)
$objJoeSmithCheckbox.Text = "Install Joe.Smith Local Administrator"
$objJoeSmithCheckbox.TabIndex = 9

#Google Earth 
$objGEarthCheckbox.Location = New-Object System.Drawing.Size(30,290)
$objGEarthCheckbox.size = New-Object System.Drawing.Size(350,20)
$objGEarthCheckbox.Text = "Install Google Earth"
$objGEarthCheckbox.TabIndex = 10

$objDisableLogsCheckbox.Location = New-Object System.Drawing.Size(30,400)
$objDisableLogsCheckbox.size = New-Object System.Drawing.Size(350,20)
$objDisableLogsCheckbox.Text = "Disable Auto Logging [NOT RECOMMENDED]"
$objDisableLogsCheckbox.TabIndex = 11

#endregion

#endregion

#region Page_buttons

#region General tech button
$Gbutton.TabIndex = 0
$Gbutton.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 35
$Gbutton.Size = $System_Drawing_Size
$Gbutton.UseVisualStyleBackColor = $True
$Gbutton.Text = "General Tech"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 400
$System_Drawing_Point.Y = 35
$Gbutton.Location = $System_Drawing_Point
$Gbutton.DataBindings.DefaultDataSourceUpdateMode = 0
$Gbutton.add_Click({

#region remove

#general tech
$form1.Controls.Remove($tabControl)
$form1.Controls.Remove($TroubleshootingPage)
$form1.Controls.Remove($CPUPage)
$form1.Controls.Remove($BitlockerPage)
$form1.Controls.Remove($UsersPage)
$form1.Controls.Remove($button1)
$form1.Controls.Remove($button2)
$form1.Controls.Remove($button3)
$form1.Controls.Remove($button4)
$form1.Controls.Remove($button5)
$form1.Controls.Remove($button6)
$form1.Controls.Remove($button7)
$form1.Controls.Remove($button8)
$form1.Controls.Remove($button9)
$form1.Controls.Remove($button1Bit)
$form1.Controls.Remove($button2Bit)
$form1.Controls.Remove($button3Bit)
$form1.Controls.Remove($button4Bit)
$form1.Controls.Remove($button5Bit)
$form1.Controls.Remove($ADBackupBox)
$form1.Controls.Remove($button1Users)
$form1.Controls.Remove($button2Users)
$form1.Controls.Remove($button3Users)
$form1.Controls.Remove($button4Users)
$form1.Controls.Remove($button5Users)

#hostname creator
$form1.Controls.Remove($objLabelSamAccountName)
$form1.Controls.Remove($objSamAccountNameTextBox)
$form1.Controls.Remove($objLabelSecGroupName)
$form1.Controls.Remove($objSecGroupTextBox)
$form1.Controls.Remove($objLabelpcdescripName)
$form1.Controls.Remove($objpcdescripTextBox)
$form1.Controls.Remove($updateADPath)
$form1.Controls.Remove($ButtonStart)

#applications remove
$form1.Controls.Remove($objLabel1)
$form1.Controls.Remove($objTextBox1)
$form1.Controls.Remove($objChromeCheckbox)
$form1.Controls.Remove($objFireFoxCheckbox)
$form1.Controls.Remove($objMSTEAMSCheckbox)
$form1.Controls.Remove($objCitrixCheckbox)
$form1.Controls.Remove($objDCAMCheckbox)
$form1.Controls.Remove($objWinGUICheckbox)
$form1.Controls.Remove($objAdobeDCPROCheckbox)
$form1.Controls.Remove($objSharePointDesigner2013Checkbox)
$form1.Controls.Remove($objJoeSmithCheckbox)
$form1.Controls.Remove($objGEarthCheckbox)
$form1.Controls.Remove($objDisableLogsCheckbox)

#zip extractor page
$form1.Controls.Remove($objLabelZipExtractorPathlabel)
$form1.Controls.Remove($objZipExtractorFilePathTextBox)
$form1.Controls.Remove($objLabelZipExtractorfilenamelabel)
$form1.Controls.Remove($objZipExtractorFileNameTextBox)

#theme page
$form1.Controls.Remove($DefaultThemeButton)
$form1.Controls.Remove($DarkThemeButton)
$form1.Controls.Remove($LightThemeButton)

#endregion

#region General_tech

#region tab_control
#Tab Control 
$tabControl.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 75
$System_Drawing_Point.Y = 85
$tabControl.Location = $System_Drawing_Point
$tabControl.Name = "tabControl"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 315
$System_Drawing_Size.Width = 275
$tabControl.Size = $System_Drawing_Size
$form1.Controls.Remove($tabControl)
$form1.Controls.Add($tabControl)

#endregion

#region tabs_setup

#Troubleshooting Page
$TroubleshootingPage.DataBindings.DefaultDataSourceUpdateMode = 0
$TroubleshootingPage.UseVisualStyleBackColor = $True
$TroubleshootingPage.Name = "TroubleshootingPage"
$TroubleshootingPage.Text = "Troubleshooting"
$tabControl.Controls.Remove($TroubleshootingPage)
$tabControl.Controls.Add($TroubleshootingPage)

#Remote Page #########FINISH##############
$CPUPage.DataBindings.DefaultDataSourceUpdateMode = 0
$CPUPage.UseVisualStyleBackColor = $True
$CPUPage.Name = "CPUPage"
$CPUPage.Text = "Remote"
$tabControl.Controls.Remove($CPUPage)
$tabControl.Controls.Add($CPUPage)

#Bitlocker Page #########FINISH##############
$BitlockerPage.DataBindings.DefaultDataSourceUpdateMode = 0
$BitlockerPage.UseVisualStyleBackColor = $True
$BitlockerPage.Name = "BitlockerPage"
$BitlockerPage.Text = "Bitlocker"
$tabControl.Controls.Remove($BitlockerPage)
$tabControl.Controls.Add($BitlockerPage)

#Users Page #########FINISH##############
$UsersPage.DataBindings.DefaultDataSourceUpdateMode = 0
$UsersPage.UseVisualStyleBackColor = $True
$UsersPage.Name = "UsersPage"
$UsersPage.Text = "Users"
$tabControl.Controls.Remove($UsersPage)
$tabControl.Controls.Add($UsersPage)

#endregion

#region troubleshooting_tab

#Button 1 Ping
$button1.TabIndex = 0
$button1.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 25
$button1.Size = $System_Drawing_Size
$button1.UseVisualStyleBackColor = $True
$button1.Text = "Ping"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 50
$System_Drawing_Point.Y = 15
$button1.Location = $System_Drawing_Point
$button1.DataBindings.DefaultDataSourceUpdateMode = 0
$button1.add_Click($button1_RunOnClick)
$TroubleshootingPage.Controls.Add($button1)

#Button 2 IP Info
$button2.TabIndex = 1
$button2.Name = "button2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 25
$button2.Size = $System_Drawing_Size
$button2.UseVisualStyleBackColor = $True
$button2.Text = "IP Info"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 150
$System_Drawing_Point.Y = 15
$button2.Location = $System_Drawing_Point
$button2.DataBindings.DefaultDataSourceUpdateMode = 0
$button2.add_Click($button2_RunOnClick)
$TroubleshootingPage.Controls.Add($button2)

#Button 3 Restart
$button3.TabIndex = 2
$button3.Name = "button2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 25
$button3.Size = $System_Drawing_Size
$button3.UseVisualStyleBackColor = $True
$button3.Text = "Restart"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 50
$System_Drawing_Point.Y = 45
$button3.Location = $System_Drawing_Point
$button3.DataBindings.DefaultDataSourceUpdateMode = 0
$button3.add_Click($button3_RunOnClick)
$TroubleshootingPage.Controls.Add($button3)

#Button 4 Shutdown
$button4.TabIndex = 3
$button4.Name = "button2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 25
$button4.Size = $System_Drawing_Size
$button4.UseVisualStyleBackColor = $True
$button4.Text = "Shutdown"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 150
$System_Drawing_Point.Y = 45
$button4.Location = $System_Drawing_Point
$button4.DataBindings.DefaultDataSourceUpdateMode = 0
$button4.add_Click($button4_RunOnClick)
$TroubleshootingPage.Controls.Add($button4)

#Button 5 CMD
$button5.TabIndex = 4
$button5.Name = "button2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 25
$button5.Size = $System_Drawing_Size
$button5.UseVisualStyleBackColor = $True
$button5.Text = "CMD"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 50
$System_Drawing_Point.Y = 75
$button5.Location = $System_Drawing_Point
$button5.DataBindings.DefaultDataSourceUpdateMode = 0
$button5.add_Click($button5_RunOnClick)
$TroubleshootingPage.Controls.Add($button5)

#Button 6 PowerShell
$button6.TabIndex = 5
$button6.Name = "button2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 25
$button6.Size = $System_Drawing_Size
$button6.UseVisualStyleBackColor = $True
$button6.Text = "Powershell"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 150
$System_Drawing_Point.Y = 75
$button6.Location = $System_Drawing_Point
$button6.DataBindings.DefaultDataSourceUpdateMode = 0
$button6.add_Click($button6_RunOnClick)
$TroubleshootingPage.Controls.Add($button6)

#Button 7 Enable Local Admin
$button7.TabIndex = 6
$button7.Name = "button2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 175
$System_Drawing_Size.Height = 25
$button7.Size = $System_Drawing_Size
$button7.UseVisualStyleBackColor = $True
$button7.Text = "Enable Local Admin"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 50
$System_Drawing_Point.Y = 105
$button7.Location = $System_Drawing_Point
$button7.DataBindings.DefaultDataSourceUpdateMode = 0
$button7.add_Click($button7_RunOnClick)
$TroubleshootingPage.Controls.Add($button7)

#Button 8 Derlete Local Admin
$button8.TabIndex = 7
$button8.Name = "button2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 175
$System_Drawing_Size.Height = 25
$button8.Size = $System_Drawing_Size
$button8.UseVisualStyleBackColor = $True
$button8.Text = "Delete Local Admin"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 50
$System_Drawing_Point.Y = 135
$button8.Location = $System_Drawing_Point
$button8.DataBindings.DefaultDataSourceUpdateMode = 0
$button8.add_Click($button5_RunOnClick)
$TroubleshootingPage.Controls.Add($button8)

#Button 9 Delete Local Admin
$button9.TabIndex = 8
$button9.Name = "button2"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 175
$System_Drawing_Size.Height = 25
$button9.Size = $System_Drawing_Size
$button9.UseVisualStyleBackColor = $True
$button9.Text = "Install PSExec"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 50
$System_Drawing_Point.Y = 165
$button9.Location = $System_Drawing_Point
$button9.DataBindings.DefaultDataSourceUpdateMode = 0
$button9.add_Click($button5_RunOnClick)
$TroubleshootingPage.Controls.Add($button9)

#endregion

#region Bitlocker_tab

$button1Bit.TabIndex = 0
$button1Bit.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 150
$System_Drawing_Size.Height = 25
$button1Bit.Size = $System_Drawing_Size
$button1Bit.UseVisualStyleBackColor = $True
$button1Bit.Text = "Monitor Bitlocker Status"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 55
$System_Drawing_Point.Y = 15
$button1Bit.Location = $System_Drawing_Point
$button1Bit.DataBindings.DefaultDataSourceUpdateMode = 0
$button1Bit.add_Click($button1Bit_RunOnClick)
$BitlockerPage.Controls.Add($button1Bit)

$button2Bit.TabIndex = 1
$button2Bit.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 150
$System_Drawing_Size.Height = 25
$button2Bit.Size = $System_Drawing_Size
$button2Bit.UseVisualStyleBackColor = $True
$button2Bit.Text = "Disable Bitlocker"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 55
$System_Drawing_Point.Y = 45
$button2Bit.Location = $System_Drawing_Point
$button2Bit.DataBindings.DefaultDataSourceUpdateMode = 0
$button2Bit.add_Click($button2Bit_RunOnClick)
$BitlockerPage.Controls.Add($button2Bit)

$button3Bit.TabIndex = 2
$button3Bit.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 150
$System_Drawing_Size.Height = 25
$button3Bit.Size = $System_Drawing_Size
$button3Bit.UseVisualStyleBackColor = $True
$button3Bit.Text = "Query Bitlocker Key"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 55
$System_Drawing_Point.Y = 75
$button3Bit.Location = $System_Drawing_Point
$button3Bit.DataBindings.DefaultDataSourceUpdateMode = 0
$button3Bit.add_Click($button3Bit_RunOnClick)
$BitlockerPage.Controls.Add($button3Bit)

$button4Bit.TabIndex = 3
$button4Bit.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 150
$System_Drawing_Size.Height = 25
$button4Bit.Size = $System_Drawing_Size
$button4Bit.UseVisualStyleBackColor = $True
$button4Bit.Text = "Disable Bitlocker PIN"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 55
$System_Drawing_Point.Y = 105
$button4Bit.Location = $System_Drawing_Point
$button4Bit.DataBindings.DefaultDataSourceUpdateMode = 0
$button4Bit.add_Click($button4Bit_RunOnClick)
$BitlockerPage.Controls.Add($button4Bit)

$button5Bit.TabIndex = 4
$button5Bit.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 150
$System_Drawing_Size.Height = 25
$button5Bit.Size = $System_Drawing_Size
$button5Bit.UseVisualStyleBackColor = $True
$button5Bit.Text = "Backup to AD"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 55
$System_Drawing_Point.Y = 135
$button5Bit.Location = $System_Drawing_Point
$button5Bit.DataBindings.DefaultDataSourceUpdateMode = 0
$button5Bit.add_Click($button5Bit_RunOnClick)
$BitlockerPage.Controls.Add($button5Bit)

#AD backup input box
$ADBackupBox = New-Object System.Windows.Forms.TextBox 
$ADBackupBox.Location = New-Object System.Drawing.Size(50,165) 
$ADBackupBox.Size = New-Object System.Drawing.Size(160,100) 
$ADBackupBox.MultiLine = $True 
#$ADBackupBox.ScrollBars = "Vertical"
$BitlockerPage.Controls.Add($ADBackupBox)

#endregion

#region Users_tab
$button1Users.TabIndex = 0
$button1Users.Name = "button1Users"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 150
$System_Drawing_Size.Height = 40
$button1Users.Size = $System_Drawing_Size
$button1Users.UseVisualStyleBackColor = $True
$button1Users.Text = "Query Active Loged in Users"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 55
$System_Drawing_Point.Y = 15
$button1Users.Location = $System_Drawing_Point
$button1Users.DataBindings.DefaultDataSourceUpdateMode = 0
$button1Users.add_Click($button1Users_RunOnClick)
$UsersPage.Controls.Add($button1Users)

$button2Users.TabIndex = 1
$button2Users.Name = "button2Users"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 150
$System_Drawing_Size.Height = 25
$button2Users.Size = $System_Drawing_Size
$button2Users.UseVisualStyleBackColor = $True
$button2Users.Text = "Query Local Users"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 55
$System_Drawing_Point.Y = 60
$button2Users.Location = $System_Drawing_Point
$button2Users.DataBindings.DefaultDataSourceUpdateMode = 0
$button2Users.add_Click($button2Users_RunOnClick)
$UsersPage.Controls.Add($button2Users)

$button3Users.TabIndex = 2
$button3Users.Name = "button3Users"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 150
$System_Drawing_Size.Height = 25
$button3Users.Size = $System_Drawing_Size
$button3Users.UseVisualStyleBackColor = $True
$button3Users.Text = "Query Account Profiles"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 55
$System_Drawing_Point.Y = 90
$button3Users.Location = $System_Drawing_Point
$button3Users.DataBindings.DefaultDataSourceUpdateMode = 0
$button3Users.add_Click($button3Users_RunOnClick)
$UsersPage.Controls.Add($button3Users)

$button4Users.TabIndex = 3
$button4Users.Name = "button4Users"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 150
$System_Drawing_Size.Height = 25
$button4Users.Size = $System_Drawing_Size
$button4Users.UseVisualStyleBackColor = $True
$button4Users.Text = "Delete all Network Profiles"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 55
$System_Drawing_Point.Y = 120
$button4Users.Location = $System_Drawing_Point
$button4Users.DataBindings.DefaultDataSourceUpdateMode = 0
$button4Users.add_Click($button4Users_RunOnClick)
$UsersPage.Controls.Add($button4Users)

$button5Users.TabIndex = 3
$button5Users.Name = "button5Users"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 150
$System_Drawing_Size.Height = 25
$button5Users.Size = $System_Drawing_Size
$button5Users.UseVisualStyleBackColor = $True
$button5Users.Text = "Delete Specific Profile"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 55
$System_Drawing_Point.Y = 150
$button5Users.Location = $System_Drawing_Point
$button5Users.DataBindings.DefaultDataSourceUpdateMode = 0
$button5Users.add_Click($button5Users_RunOnClick)
$UsersPage.Controls.Add($button5Users)
})
$form1.Controls.Add($Gbutton)

#endregion

#endregion GeneralTech



#endregion

#region Hostname creator button
$Hostnamebutton.TabIndex = 0
$Hostnamebutton.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 35
$Hostnamebutton.Size = $System_Drawing_Size
$Hostnamebutton.UseVisualStyleBackColor = $True
$Hostnamebutton.Text = "Create a Hostname"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 475
$System_Drawing_Point.Y = 35
$Hostnamebutton.Location = $System_Drawing_Point
$Hostnamebutton.DataBindings.DefaultDataSourceUpdateMode = 0
$Hostnamebutton.add_Click({

#region remove

#general tech
$form1.Controls.Remove($tabControl)
$form1.Controls.Remove($TroubleshootingPage)
$form1.Controls.Remove($CPUPage)
$form1.Controls.Remove($BitlockerPage)
$form1.Controls.Remove($UsersPage)
$form1.Controls.Remove($button1)
$form1.Controls.Remove($button2)
$form1.Controls.Remove($button3)
$form1.Controls.Remove($button4)
$form1.Controls.Remove($button5)
$form1.Controls.Remove($button6)
$form1.Controls.Remove($button7)
$form1.Controls.Remove($button8)
$form1.Controls.Remove($button9)
$form1.Controls.Remove($button1Bit)
$form1.Controls.Remove($button2Bit)
$form1.Controls.Remove($button3Bit)
$form1.Controls.Remove($button4Bit)
$form1.Controls.Remove($button5Bit)
$form1.Controls.Remove($ADBackupBox)
$form1.Controls.Remove($button1Users)
$form1.Controls.Remove($button2Users)
$form1.Controls.Remove($button3Users)
$form1.Controls.Remove($button4Users)
$form1.Controls.Remove($button5Users)

#hostname creator
$form1.Controls.Remove($objLabelSamAccountName)
$form1.Controls.Remove($objSamAccountNameTextBox)
$form1.Controls.Remove($objLabelSecGroupName)
$form1.Controls.Remove($objSecGroupTextBox)
$form1.Controls.Remove($objLabelpcdescripName)
$form1.Controls.Remove($objpcdescripTextBox)
$form1.Controls.Remove($updateADPath)
$form1.Controls.Remove($ButtonStart)

#applications remove
$form1.Controls.Remove($objLabel1)
$form1.Controls.Remove($objTextBox1)
$form1.Controls.Remove($objChromeCheckbox)
$form1.Controls.Remove($objFireFoxCheckbox)
$form1.Controls.Remove($objMSTEAMSCheckbox)
$form1.Controls.Remove($objCitrixCheckbox)
$form1.Controls.Remove($objDCAMCheckbox)
$form1.Controls.Remove($objWinGUICheckbox)
$form1.Controls.Remove($objAdobeDCPROCheckbox)
$form1.Controls.Remove($objSharePointDesigner2013Checkbox)
$form1.Controls.Remove($objJoeSmithCheckbox)
$form1.Controls.Remove($objGEarthCheckbox)
$form1.Controls.Remove($objDisableLogsCheckbox)

#zip extractor page
$form1.Controls.Remove($objLabelZipExtractorPathlabel)
$form1.Controls.Remove($objZipExtractorFilePathTextBox)
$form1.Controls.Remove($objLabelZipExtractorfilenamelabel)
$form1.Controls.Remove($objZipExtractorFileNameTextBox)

#theme page
$form1.Controls.Remove($DefaultThemeButton)
$form1.Controls.Remove($DarkThemeButton)
$form1.Controls.Remove($LightThemeButton)

#endregion remove

#This creates a label for the objLabelSamAccountName
$objLabelSamAccountName.Location = New-Object System.Drawing.Size(180,80) 
$objLabelSamAccountName.Size = New-Object System.Drawing.Size(140,20)
[String]$MandatoryWrite = "*" 
#$objLabelSamAccountName.ForeColor = [System.Drawing.Color]::FromName("Red")
$objLabelSamAccountName.Text = "Enter New SAN $MandatoryWrite"
$form1.Controls.Add($objLabelSamAccountName)

#This creates the TextBox for SamAccountName 
$objSamAccountNameTextBox.Location = New-Object System.Drawing.Size(120,100) 
$objSamAccountNameTextBox.Size = New-Object System.Drawing.Size(200,20)
$objSamAccountNameTextBox.TabIndex = 0 
$form1.Controls.Add($objSamAccountNameTextBox)

#This creates a label for the SecurityGroup
$objLabelSecGroupName.Location = New-Object System.Drawing.Size(180,140) 
$objLabelSecGroupName.Size = New-Object System.Drawing.Size(145,20)
[String]$MandatoryWrite = "*" 
#$objLabelSecGroupName.ForeColor = [System.Drawing.Color]::FromName("Red")
$objLabelSecGroupName.Text = "Enter New Security Group $MandatoryWrite"
$form1.Controls.Add($objLabelSecGroupName)

#This creates the TextBox for SecurityGroup
$objSecGroupTextBox.Location = New-Object System.Drawing.Size(120,160) 
$objSecGroupTextBox.Size = New-Object System.Drawing.Size(360,20)
$objSecGroupTextBox.TabIndex = 0 
$form1.Controls.Add($objSecGroupTextBox)

#This creates a label for PCdescription
$objLabelpcdescripName.Location = New-Object System.Drawing.Size(180,200) 
$objLabelpcdescripName.Size = New-Object System.Drawing.Size(145,20)
[String]$MandatoryWrite = "*" 
#$objLabelpcdescripName.ForeColor = [System.Drawing.Color]::FromName("Red")
$objLabelpcdescripName.Text = "Enter New Description $MandatoryWrite"
$form1.Controls.Add($objLabelpcdescripName)

#This creates the TextBox for PCdescription
$objpcdescripTextBox.Location = New-Object System.Drawing.Size(120,220) 
$objpcdescripTextBox.Size = New-Object System.Drawing.Size(360,20)
$objpcdescripTextBox.TabIndex = 0 
$form1.Controls.Add($objpcdescripTextBox)

#region update AD Path button
$updateADPath.TabIndex = 0
$updateADPath.Name = "ADPathButton"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 23
$updateADPath.Size = $System_Drawing_Size
$updateADPath.UseVisualStyleBackColor = $True
$updateADPath.Text = "AD Path"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 120
$System_Drawing_Point.Y = 270
$updateADPath.BackColor = "LightGray"
$updateADPath.Location = $System_Drawing_Point
$updateADPath.DataBindings.DefaultDataSourceUpdateMode = 0
$updateADPath.add_Click({

    
    $outputBox.Text = "Preparing Active Directory Path Log..."
    
    Sleep 2
    
    $outputBox.Text = "Set Path is case sensitive and space sensitive
Click File>Save and close Notepad to continue" 

    Sleep 1
    
    Start-Process -Wait -PSPath "C:\Windows\System32\notepad.exe" -ArgumentList "C:\temp\Launcher\Dependencies\Directories\Hostname Path\ActiveDirectoryPath.txt"
    
    Sleep 1
    
    $outputBox.Text = "Reading New Path"
    
    $ADPathContent = Get-Content -LiteralPath "C:\temp\Launcher\Dependencies\Directories\Hostname Path\ActiveDirectoryPath.txt" -Force
    
    Sleep 1
    
    $outputBox.Text = "New Path Saved to Cache!
Don't Forget to click Set Path!"

        

})
$form1.Controls.Add($updateADPath)

# Start Button
$ButtonStart.Location = New-Object System.Drawing.Point(120, 320)
$ButtonStart.Size = New-Object System.Drawing.Size(200, 23)
$ButtonStart.BackColor = "LightGray"
$ButtonStart.Text = "Create"
$ButtonStart.Add_Click({

         If (Get-Module ActiveDirectory) {
        $outputBox.Text = "Active Directory already loaded on Admin System"
    } 
    else {
        Import-Module ActiveDirectory | Out-Null
    }
    # if hostname check
        If ($objHostnameTextBox1.Text -cne $null) {$ContinueOn=$true;$Computers = $objHostnameTextBox1.Text}
        else {$ContinueOn=$False}
        # if SAN Check
        If ($objSamAccountNameTextBox.Text -cne $null) {$ContinueOn=$true; $SamAccountName = $objSamAccountNameTextBox.Text}
        else {$ContinueOn=$False}
        # if sec group check
        If ($objSecGroupTextBox.Text -cne $null) {$ContinueOn=$true;$CustomSecGroup = $objSecGroupTextBox.Text}
        else {$ContinueOn=$false}
        # if pc description
        If ($objpcdescripTextBox -cne $null){$ContinueOn=$true;$PCDescription=$objpcdescripTextBox.Text}
        else {$ContinueOn=$false}
        If ($ContinueOn -cne $false) {
        ForEach ($Computer in $Computers)
        {
            $ADPathContent = Get-Content -LiteralPath "C:\temp\Launcher\Dependencies\Directories\Hostname Path\ActiveDirectoryPath.txt" -Force
            
            # adds Computer Name to AD @Domain_Name location
            New-ADComputer -Name $Computer -SamAccountName $SamAccountName -Path $ADPathContent -Enabled $true
            
            $outputBox.Text = "Creating Hostname $Computer"
            
            Sleep 3
            
            $User = Get-ADComputer -Identity "CN=$Computer,$ADPathContent" -Server "nasw.ds.army.mil"
            $Group = Get-ADGroup -Identity $CustomSecGroup -Server "nasw.ds.army.mil"

            # adds BLIS FORSCOM WORKSTATION CERTIFICATE REQUEST to selected computer @Name                                                                                                                                      
            Add-ADGroupMember -Identity $Group -Members $User -Server "nasw.ds.army.mil"  
            
            $outputBox.Text = "Added Security Group to Hostname : $Computer"
            
            Sleep 3
            
            # adds Computer Description to AD Obj @nasw.ds.army.mil location
            Set-ADComputer -Identity $User -Description $PCDescription
            $outputBox.Text = "Added Custom Description to Hostname : $Computer"
            
            Sleep 2
        }
          $outputBox.Text = "Finished Creating Hostname : $Computer"
    }
    else { 
        $outputBox.Text = "Absent Data Found"
        
        Sleep 1
        
        $outputBox.Text = "Script Closing Safely"
        
        Sleep 2
        
        $outputBox.Text = "All Modules exited successfully" 
    }

})
$form1.Controls.Add($ButtonStart)

#endregion
})

$form1.Controls.Add($Hostnamebutton)

#endregion Hostname Creator Button

#region Ad user creation button
$ADUserbutton.TabIndex = 0
$ADUserbutton.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 35
$ADUserbutton.Size = $System_Drawing_Size
$ADUserbutton.UseVisualStyleBackColor = $True
$ADUserbutton.Text = "Create User"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 550
$System_Drawing_Point.Y = 35
$ADUserbutton.Location = $System_Drawing_Point
$ADUserbutton.DataBindings.DefaultDataSourceUpdateMode = 0
$ADUserbutton.add_Click({

#region remove

#general tech
$form1.Controls.Remove($tabControl)
$form1.Controls.Remove($TroubleshootingPage)
$form1.Controls.Remove($CPUPage)
$form1.Controls.Remove($BitlockerPage)
$form1.Controls.Remove($UsersPage)
$form1.Controls.Remove($button1)
$form1.Controls.Remove($button2)
$form1.Controls.Remove($button3)
$form1.Controls.Remove($button4)
$form1.Controls.Remove($button5)
$form1.Controls.Remove($button6)
$form1.Controls.Remove($button7)
$form1.Controls.Remove($button8)
$form1.Controls.Remove($button9)
$form1.Controls.Remove($button1Bit)
$form1.Controls.Remove($button2Bit)
$form1.Controls.Remove($button3Bit)
$form1.Controls.Remove($button4Bit)
$form1.Controls.Remove($button5Bit)
$form1.Controls.Remove($ADBackupBox)
$form1.Controls.Remove($button1Users)
$form1.Controls.Remove($button2Users)
$form1.Controls.Remove($button3Users)
$form1.Controls.Remove($button4Users)
$form1.Controls.Remove($button5Users)

#hostname creator
$form1.Controls.Remove($objLabelSamAccountName)
$form1.Controls.Remove($objSamAccountNameTextBox)
$form1.Controls.Remove($objLabelSecGroupName)
$form1.Controls.Remove($objSecGroupTextBox)
$form1.Controls.Remove($objLabelpcdescripName)
$form1.Controls.Remove($objpcdescripTextBox)
$form1.Controls.Remove($updateADPath)
$form1.Controls.Remove($ButtonStart)

#applications remove
$form1.Controls.Remove($objLabel1)
$form1.Controls.Remove($objTextBox1)
$form1.Controls.Remove($objChromeCheckbox)
$form1.Controls.Remove($objFireFoxCheckbox)
$form1.Controls.Remove($objMSTEAMSCheckbox)
$form1.Controls.Remove($objCitrixCheckbox)
$form1.Controls.Remove($objDCAMCheckbox)
$form1.Controls.Remove($objWinGUICheckbox)
$form1.Controls.Remove($objAdobeDCPROCheckbox)
$form1.Controls.Remove($objSharePointDesigner2013Checkbox)
$form1.Controls.Remove($objJoeSmithCheckbox)
$form1.Controls.Remove($objGEarthCheckbox)
$form1.Controls.Remove($objDisableLogsCheckbox)

#zip extractor page
$form1.Controls.Remove($objLabelZipExtractorPathlabel)
$form1.Controls.Remove($objZipExtractorFilePathTextBox)
$form1.Controls.Remove($objLabelZipExtractorfilenamelabel)
$form1.Controls.Remove($objZipExtractorFileNameTextBox)

#theme page
$form1.Controls.Remove($DefaultThemeButton)
$form1.Controls.Remove($DarkThemeButton)
$form1.Controls.Remove($LightThemeButton)


#endregion remove

#region aduser content
#***********************************************************************
#This creates a label for the TextBox Last Name
$objLabelLastname = New-Object System.Windows.Forms.Label
$objLabelLastname.Location = New-Object System.Drawing.Size(175,70) 
$objLabelLastname.Size = New-Object System.Drawing.Size(280,20)
[String]$MandatoryWrite = "*" 
$objLabelLastname.ForeColor = [System.Drawing.Color]::FromName("Black")
$objLabelLastname.Text = "Last Name"
$form1.Controls.Add($objLabelLastname) 

#This creates the TextBox Last Name
$objTextBoxlastname = New-Object System.Windows.Forms.TextBox 
$objTextBoxlastname.Location = New-Object System.Drawing.Size(120,90) 
$objTextBoxlastname.Size = New-Object System.Drawing.Size(260,20)
$objTextBoxlastname.TabIndex = 0 
$form1.Controls.Add($objTextBoxlastname)
#***************************************************************************
#This creates a label for the TextBox First Name
$objLabelfirstname = New-Object System.Windows.Forms.Label
$objLabelfirstname.Location = New-Object System.Drawing.Size(175,120) 
$objLabelfirstname.Size = New-Object System.Drawing.Size(280,20)
$objLabelfirstname.ForeColor = [System.Drawing.Color]::FromName("Black")
$objLabelfirstname.Text = "First Name"
$form1.Controls.Add($objLabelfirstname) 

#This creates the TextBox Firstname
$objTextBoxfirstname = New-Object System.Windows.Forms.TextBox 
$objTextBoxfirstname.Location = New-Object System.Drawing.Size(120,140) 
$objTextBoxfirstname.Size = New-Object System.Drawing.Size(260,20)
$objTextBoxfirstname.TabIndex = 1 
$form1.Controls.Add($objTextBoxfirstname)
#*************************************************************************
#This creates a label for the TextBox Middle Initial
$objLabelmi = New-Object System.Windows.Forms.Label
$objLabelmi.Location = New-Object System.Drawing.Size(135,170) 
$objLabelmi.Size = New-Object System.Drawing.Size(50,20)
[String]$MandatoryWrite = "*" 
$objLabelmi.ForeColor = [System.Drawing.Color]::FromName("Black")
$objLabelmi.Text = "MI"
$form1.Controls.Add($objLabelmi) 

#This creates the TextBox Middle Initial
$objTextBoxmi = New-Object System.Windows.Forms.TextBox 
$objTextBoxmi.Location = New-Object System.Drawing.Size(120,190) 
$objTextBoxmi.Size = New-Object System.Drawing.Size(50,20)
$objTextBoxmi.TabIndex = 2 
$form1.Controls.Add($objTextBoxmi)
#***************************************************************************
#This creates a label for the TextBox DODID
$objLabelDODID = New-Object System.Windows.Forms.Label
$objLabelDODID.Location = New-Object System.Drawing.Size(210,170) 
$objLabelDODID.Size = New-Object System.Drawing.Size(50,20)# (280,20)
[String]$MandatoryWrite = "*" 
$objLabelDODID.ForeColor = [System.Drawing.Color]::FromName("Black")
$objLabelDODID.Text = "DODID"
$form1.Controls.Add($objLabelDODID) 

#This creates the TextBox DODID
$objTextBoxDODID = New-Object System.Windows.Forms.TextBox 
$objTextBoxDODID.Location = New-Object System.Drawing.Size(180,190) 
$objTextBoxDODID.Size = New-Object System.Drawing.Size(130,20)
$objTextBoxDODID.TabIndex = 3 
$form1.Controls.Add($objTextBoxDODID)
#***************************************************************************
#This creates a label for the TextBox Rank
$objLabelrnk = New-Object System.Windows.Forms.Label
$objLabelrnk.Location = New-Object System.Drawing.Size(320,170) 
$objLabelrnk.Size = New-Object System.Drawing.Size(45,20)
[String]$MandatoryWrite = "*" 
$objLabelrnk.ForeColor = [System.Drawing.Color]::FromName("Black")
$objLabelrnk.Text = "Rank"
$form1.Controls.Add($objLabelrnk) 

#This creates the TextBox Rank
$objTextBoxrnk = New-Object System.Windows.Forms.TextBox 
$objTextBoxrnk.Location = New-Object System.Drawing.Sie(500,300) 
$objTextBoxrnk.Size = New-Object System.Drawing.Size(100,20)
$objTextBoxrnk.TabIndex = 5 
$form1.Controls.Add($objTextBoxrnk)
#***************************************************************************
#This creates a label for the TextBox Email
$objLabelEmail = New-Object System.Windows.Forms.Label
$objLabelEmail.Location = New-Object System.Drawing.Size(300,70) 
$objLabelEmail.Size = New-Object System.Drawing.Size(280,20)
[String]$MandatoryWrite = "*" 
$objLabelEmail.ForeColor = [System.Drawing.Color]::FromName("Black")
$objLabelEmail.Text = "Email"
$form1.Controls.Add($objLabelEmail) 

#This creates the TextBox Email
$objTextBoxemail = New-Object System.Windows.Forms.TextBox 
$objTextBoxemail.Location = New-Object System.Drawing.Size(300,90) 
$objTextBoxemail.Size = New-Object System.Drawing.Size(260,20)
$objTextBoxemail.TabIndex = 4 
$form1.Controls.Add($objTextBoxemail)
#***************************************************************************

#endregion aduser content



})
$form1.Controls.Add($ADUserbutton)
#endregion

#region Application button
$Appbutton.TabIndex = 0
$Appbutton.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 35
$Appbutton.Size = $System_Drawing_Size
$Appbutton.UseVisualStyleBackColor = $True
$Appbutton.Text = "Install Apps"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 625
$System_Drawing_Point.Y = 35
$Appbutton.Location = $System_Drawing_Point
$Appbutton.DataBindings.DefaultDataSourceUpdateMode = 0
$Appbutton.add_Click({

#region remove

#general tech
$form1.Controls.Remove($tabControl)
$form1.Controls.Remove($TroubleshootingPage)
$form1.Controls.Remove($CPUPage)
$form1.Controls.Remove($BitlockerPage)
$form1.Controls.Remove($UsersPage)
$form1.Controls.Remove($button1)
$form1.Controls.Remove($button2)
$form1.Controls.Remove($button3)
$form1.Controls.Remove($button4)
$form1.Controls.Remove($button5)
$form1.Controls.Remove($button6)
$form1.Controls.Remove($button7)
$form1.Controls.Remove($button8)
$form1.Controls.Remove($button9)
$form1.Controls.Remove($button1Bit)
$form1.Controls.Remove($button2Bit)
$form1.Controls.Remove($button3Bit)
$form1.Controls.Remove($button4Bit)
$form1.Controls.Remove($button5Bit)
$form1.Controls.Remove($ADBackupBox)
$form1.Controls.Remove($button1Users)
$form1.Controls.Remove($button2Users)
$form1.Controls.Remove($button3Users)
$form1.Controls.Remove($button4Users)
$form1.Controls.Remove($button5Users)

#hostname creator
$form1.Controls.Remove($objLabelSamAccountName)
$form1.Controls.Remove($objSamAccountNameTextBox)
$form1.Controls.Remove($objLabelSecGroupName)
$form1.Controls.Remove($objSecGroupTextBox)
$form1.Controls.Remove($objLabelpcdescripName)
$form1.Controls.Remove($objpcdescripTextBox)
$form1.Controls.Remove($updateADPath)
$form1.Controls.Remove($ButtonStart)

#applications remove
$form1.Controls.Remove($objLabel1)
$form1.Controls.Remove($objTextBox1)
$form1.Controls.Remove($objChromeCheckbox)
$form1.Controls.Remove($objFireFoxCheckbox)
$form1.Controls.Remove($objMSTEAMSCheckbox)
$form1.Controls.Remove($objCitrixCheckbox)
$form1.Controls.Remove($objDCAMCheckbox)
$form1.Controls.Remove($objWinGUICheckbox)
$form1.Controls.Remove($objAdobeDCPROCheckbox)
$form1.Controls.Remove($objSharePointDesigner2013Checkbox)
$form1.Controls.Remove($objJoeSmithCheckbox)
$form1.Controls.Remove($objGEarthCheckbox)
$form1.Controls.Remove($objDisableLogsCheckbox)

#zip extractor page
$form1.Controls.Remove($objLabelZipExtractorPathlabel)
$form1.Controls.Remove($objZipExtractorFilePathTextBox)
$form1.Controls.Remove($objLabelZipExtractorfilenamelabel)
$form1.Controls.Remove($objZipExtractorFileNameTextBox)

#theme page
$form1.Controls.Remove($DefaultThemeButton)
$form1.Controls.Remove($DarkThemeButton)
$form1.Controls.Remove($LightThemeButton)


#endregion remove

#region Action Check Boxes and button for Apps
$form1.Controls.Add($objChromeCheckbox)


$form1.Controls.Add($objFireFoxCheckbox)


$form1.Controls.Add($objMSTEAMSCheckbox)


$form1.Controls.Add($objCitrixCheckbox)


$form1.Controls.Add($objDCAMCheckbox)


$form1.Controls.Add($objWinGUICheckbox)


$form1.Controls.Add($objAdobeDCPROCheckbox)


$form1.Controls.Add($objSharePointDesigner2013Checkbox)


$form1.Controls.Add($objJoeSmithCheckbox)


$form1.Controls.Add($objGEarthCheckbox)


$form1.Controls.Add($objDisableLogsCheckbox)

# Install Button
$ButtonInstall.Location = New-Object System.Drawing.Point(50,320)
$ButtonInstall.Size = New-Object System.Drawing.Size(200, 23)
$ButtonInstall.BackColor = "LightGray"
$ButtonInstall.Text = "Install Application"
$ButtonInstall.Add_Click({

#add install backend here
})
$form1.Controls.Add($ButtonInstall)
#endregion

})

$form1.Controls.Add($Appbutton)
#endregion

#region Zip Extractor button
$Zipbutton.TabIndex = 0
$Zipbutton.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 35
$Zipbutton.Size = $System_Drawing_Size
$Zipbutton.UseVisualStyleBackColor = $True
$Zipbutton.Text = "Zip Extractor"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 700
$System_Drawing_Point.Y = 35
$Zipbutton.Location = $System_Drawing_Point
$Zipbutton.DataBindings.DefaultDataSourceUpdateMode = 0
$Zipbutton.add_Click({

#region remove

#general tech
$form1.Controls.Remove($tabControl)
$form1.Controls.Remove($TroubleshootingPage)
$form1.Controls.Remove($CPUPage)
$form1.Controls.Remove($BitlockerPage)
$form1.Controls.Remove($UsersPage)
$form1.Controls.Remove($button1)
$form1.Controls.Remove($button2)
$form1.Controls.Remove($button3)
$form1.Controls.Remove($button4)
$form1.Controls.Remove($button5)
$form1.Controls.Remove($button6)
$form1.Controls.Remove($button7)
$form1.Controls.Remove($button8)
$form1.Controls.Remove($button9)
$form1.Controls.Remove($button1Bit)
$form1.Controls.Remove($button2Bit)
$form1.Controls.Remove($button3Bit)
$form1.Controls.Remove($button4Bit)
$form1.Controls.Remove($button5Bit)
$form1.Controls.Remove($ADBackupBox)
$form1.Controls.Remove($button1Users)
$form1.Controls.Remove($button2Users)
$form1.Controls.Remove($button3Users)
$form1.Controls.Remove($button4Users)
$form1.Controls.Remove($button5Users)

#hostname creator
$form1.Controls.Remove($objLabelSamAccountName)
$form1.Controls.Remove($objSamAccountNameTextBox)
$form1.Controls.Remove($objLabelSecGroupName)
$form1.Controls.Remove($objSecGroupTextBox)
$form1.Controls.Remove($objLabelpcdescripName)
$form1.Controls.Remove($objpcdescripTextBox)
$form1.Controls.Remove($updateADPath)
$form1.Controls.Remove($ButtonStart)

#applications remove
$form1.Controls.Remove($objLabel1)
$form1.Controls.Remove($objTextBox1)
$form1.Controls.Remove($objChromeCheckbox)
$form1.Controls.Remove($objFireFoxCheckbox)
$form1.Controls.Remove($objMSTEAMSCheckbox)
$form1.Controls.Remove($objCitrixCheckbox)
$form1.Controls.Remove($objDCAMCheckbox)
$form1.Controls.Remove($objWinGUICheckbox)
$form1.Controls.Remove($objAdobeDCPROCheckbox)
$form1.Controls.Remove($objSharePointDesigner2013Checkbox)
$form1.Controls.Remove($objJoeSmithCheckbox)
$form1.Controls.Remove($objGEarthCheckbox)
$form1.Controls.Remove($objDisableLogsCheckbox)

#zip extractor page
$form1.Controls.Remove($objLabelZipExtractorPathlabel)
$form1.Controls.Remove($objZipExtractorFilePathTextBox)
$form1.Controls.Remove($objLabelZipExtractorfilenamelabel)
$form1.Controls.Remove($objZipExtractorFileNameTextBox)

#theme page
$form1.Controls.Remove($DefaultThemeButton)
$form1.Controls.Remove($DarkThemeButton)
$form1.Controls.Remove($LightThemeButton)

#endregion remove

This creates a label for the Path + Filename
$objLabelZipExtractorPathlabel.Location = New-Object System.Drawing.Size(165,100) 
$objLabelZipExtractorPathlabel.Size = New-Object System.Drawing.Size(145,20)
[String]$MandatoryWrite = "*" 
#$objLabelSecGroupName.ForeColor = [System.Drawing.Color]::FromName("Red")
$objLabelZipExtractorPathlabel.Text = "Enter Path + File $MandatoryWrite"
$form1.Controls.Add($objLabelZipExtractorPathlabel)

#This creates the TextBox for PAth + Filename
$objZipExtractorFilePathTextBox.Location = New-Object System.Drawing.Size(120,120) 
$objZipExtractorFilePathTextBox.Size = New-Object System.Drawing.Size(360,20)
$objZipExtractorFilePathTextBox.TabIndex = 0 
$form1.Controls.Add($objZipExtractorFilePathTextBox)

#This creates a label for the file name label
$objLabelZipExtractorfilenamelabel = New-Object System.Windows.Forms.Label
$objLabelZipExtractorfilenamelabel.Location = New-Object System.Drawing.Size(165,160) 
$objLabelZipExtractorfilenamelabel.Size = New-Object System.Drawing.Size(120,20)
[String]$MandatoryWrite = "*" 
$objLabelZipExtractorfilenamelabel.BackColor = [System.Drawing.Color]::FromKnownColor("Transparent")
#$objLabelZipExtractorfilenamelabel.ForeColor = [System.Drawing.Color]::FromName("Red")
$objLabelZipExtractorfilenamelabel.Text = "File Name $MandatoryWrite"
$form1.Controls.Add($objLabelZipExtractorfilenamelabel)

#File Name
$objZipExtractorFileNameTextBox = New-Object System.Windows.Forms.TextBox 
$objZipExtractorFileNameTextBox.Location = New-Object System.Drawing.Size(120,180) 
$objZipExtractorFileNameTextBox.Size = New-Object System.Drawing.Size(160,20)
$objZipExtractorFileNameTextBox.TabIndex = 2 
$form1.Controls.Add($objZipExtractorFileNameTextBox)

})
$form1.Controls.Add($Zipbutton)
#endregion

#region Theme button
$Themebutton.TabIndex = 0
$Themebutton.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 35
$Themebutton.Size = $System_Drawing_Size
$Themebutton.UseVisualStyleBackColor = $True
$Themebutton.Text = "Change Theme"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 775
$System_Drawing_Point.Y = 35
$Themebutton.Location = $System_Drawing_Point
$Themebutton.DataBindings.DefaultDataSourceUpdateMode = 0
$Themebutton.add_Click({


#region remove

#general tech
$form1.Controls.Remove($tabControl)
$form1.Controls.Remove($TroubleshootingPage)
$form1.Controls.Remove($CPUPage)
$form1.Controls.Remove($BitlockerPage)
$form1.Controls.Remove($UsersPage)
$form1.Controls.Remove($button1)
$form1.Controls.Remove($button2)
$form1.Controls.Remove($button3)
$form1.Controls.Remove($button4)
$form1.Controls.Remove($button5)
$form1.Controls.Remove($button6)
$form1.Controls.Remove($button7)
$form1.Controls.Remove($button8)
$form1.Controls.Remove($button9)
$form1.Controls.Remove($button1Bit)
$form1.Controls.Remove($button2Bit)
$form1.Controls.Remove($button3Bit)
$form1.Controls.Remove($button4Bit)
$form1.Controls.Remove($button5Bit)
$form1.Controls.Remove($ADBackupBox)
$form1.Controls.Remove($button1Users)
$form1.Controls.Remove($button2Users)
$form1.Controls.Remove($button3Users)
$form1.Controls.Remove($button4Users)
$form1.Controls.Remove($button5Users)

#hostname creator
$form1.Controls.Remove($objLabelSamAccountName)
$form1.Controls.Remove($objSamAccountNameTextBox)
$form1.Controls.Remove($objLabelSecGroupName)
$form1.Controls.Remove($objSecGroupTextBox)
$form1.Controls.Remove($objLabelpcdescripName)
$form1.Controls.Remove($objpcdescripTextBox)
$form1.Controls.Remove($updateADPath)
$form1.Controls.Remove($ButtonStart)

#applications remove
$form1.Controls.Remove($objLabel1)
$form1.Controls.Remove($objTextBox1)
$form1.Controls.Remove($objChromeCheckbox)
$form1.Controls.Remove($objFireFoxCheckbox)
$form1.Controls.Remove($objMSTEAMSCheckbox)
$form1.Controls.Remove($objCitrixCheckbox)
$form1.Controls.Remove($objDCAMCheckbox)
$form1.Controls.Remove($objWinGUICheckbox)
$form1.Controls.Remove($objAdobeDCPROCheckbox)
$form1.Controls.Remove($objSharePointDesigner2013Checkbox)
$form1.Controls.Remove($objJoeSmithCheckbox)
$form1.Controls.Remove($objGEarthCheckbox)
$form1.Controls.Remove($objDisableLogsCheckbox)

#zip extractor page
$form1.Controls.Remove($objLabelZipExtractorPathlabel)
$form1.Controls.Remove($objZipExtractorFilePathTextBox)
$form1.Controls.Remove($objLabelZipExtractorfilenamelabel)
$form1.Controls.Remove($objZipExtractorFileNameTextBox)

#theme page
$form1.Controls.Remove($DefaultThemeButton)
$form1.Controls.Remove($DarkThemeButton)
$form1.Controls.Remove($LightThemeButton)

#endregion remove

$form1.Controls.Remove($tabControl) # Disables General Tech Elems

#region Theme Tab
# Set Default Theme Button
$DefaultThemeButton.TabIndex = 0
$DefaultThemeButton.Name = "DefaultThemeButton"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 150
$System_Drawing_Size.Height = 125
$DefaultThemeButton.Size = $System_Drawing_Size
$DefaultThemeButton.UseVisualStyleBackColor = $True
$DefaultThemeButton.BackColor = "LightGray"
$DefaultThemeButton.Text = "DEFAULT"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 150
$System_Drawing_Point.Y = 125
$DefaultThemeButton.Location = $System_Drawing_Point
$DefaultThemeButton.DataBindings.DefaultDataSourceUpdateMode = 0
$DefaultThemeButton.add_Click({

    $form1.BackColor = "LightGray"
    $outputBox.BackColor = "White"
    $button1.BackColor = "LightGray"
    $button2.BackColor = "LightGray"
    $button3.BackColor = "LightGray"
    $button4.BackColor = "LightGray"
    $button5.BackColor = "LightGray"
    $button6.BackColor = "LightGray"
    $button7.BackColor = "LightGray"
    $button8.BackColor = "LightGray"
    $button9.BackColor = "LightGray"
    

    $TabControl.BackColor = "White"
    $TroubleshootingPage.BackColor = "LightGray"
    $CPUPage.BackColor = "LightGray"
    $BitlockerPage.BackColor = "LightGray"
    $UsersPage.BackColor = "LightGray"

    
    $objTextBox.BackColor = "White"
    $DefaultThemeButton.BackColor = "LightGray"
    $LightThemeButton.BackColor = "LightGray"
    $DarkThemeButton.BackColor = "LightGray"
})
$form1.Controls.Add($DefaultThemeButton)

# Set Dark Theme Button
$DarkThemeButton = New-Object System.Windows.Forms.Button
$DarkThemeButton.Location = New-Object System.Drawing.Point(375,125)
$DarkThemeButton.Size = New-Object System.Drawing.Size(150, 125)
$DarkThemeButton.BackColor = "LightGray"
$DarkThemeButton.Text = "DARK"
$DarkThemeButton.Add_Click({

    $form1.BackColor = "Gray"
    $outputBox.BackColor = "LightGray"
    $button1.BackColor = "LightGray"
    $button2.BackColor = "LightGray"
    $button3.BackColor = "LightGray"
    $button4.BackColor = "LightGray"
    $button5.BackColor = "LightGray"
    $button6.BackColor = "LightGray"
    $button7.BackColor = "LightGray"
    $button8.BackColor = "LightGray"
    $button9.BackColor = "LightGray"
    

    $TabControl.BackColor = "Gray"
    $TroubleshootingPage.BackColor = "Gray"
    $CPUPage.BackColor = "Gray"
    $BitlockerPage.BackColor = "Gray"
    $UsersPage.BackColor = "Gray"

    $objTextBoxHostname.BackColor = "LightGray"
    $DefaultThemeButton.BackColor = "LightGray"
    $LightThemeButton.BackColor = "LightGray"
    $DarkThemeButton.BackColor = "LightGray"
})
$form1.Controls.Add($DarkThemeButton)

# Set LIGHT Theme Button
$LightThemeButton = New-Object System.Windows.Forms.Button
$LightThemeButton.Location = New-Object System.Drawing.Point(600,125)
$LightThemeButton.Size = New-Object System.Drawing.Size(150, 125)
$LightThemeButton.BackColor = "LightGray"
$LightThemeButton.Text = "LIGHT"
$LightThemeButton.Add_Click({

    $form1.BackColor = "White"
    $outputBox.BackColor = "White"
    $button1.BackColor = "LightGray"
    $button2.BackColor = "LightGray"
    $button3.BackColor = "LightGray"
    $button4.BackColor = "LightGray"
    $button5.BackColor = "LightGray"
    $button6.BackColor = "LightGray"
    $button7.BackColor = "LightGray"
    $button8.BackColor = "LightGray"
    $button9.BackColor = "LightGray"
    

    $TabControl.BackColor = "White"
    $TroubleshootingPage.BackColor = "White"
    $CPUPage.BackColor = "White"
    $BitlockerPage.BackColor = "White"
    $UsersPage.BackColor = "White"

    
    $objTextBox.BackColor = "White"
    $DefaultThemeButton.BackColor = "White"
    $LightThemeButton.BackColor = "White"
    $DarkThemeButton.BackColor = "White"
})
$form1.Controls.Add($LightThemeButton)
#endregion

})
$form1.Controls.Add($Themebutton)
#endregion

#endregion Page_buttons

#region GUI_INITIALIZATION
#Save the initial state of the form
$InitialFormWindowState = $form1.WindowState
#Init the OnLoad event to correct the initial state of the form
$form1.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form1.ShowDialog()| Out-Null
#$form1.DialogResult = "OK" | Out-Null
#endregion GUI_INITIALIZATION

}

CreateForm
