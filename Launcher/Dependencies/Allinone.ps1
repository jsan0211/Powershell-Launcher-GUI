function CreateForm {
#[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
#[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.drawing

#Form Setup
$form1 = New-Object System.Windows.Forms.Form
$outputBox = New-Object System.Windows.Forms.TextBox
$button1 = New-Object System.Windows.Forms.Button
$button2 = New-Object System.Windows.Forms.Button
$button3 = New-Object System.Windows.Forms.Button
$button4 = New-Object System.Windows.Forms.Button
$button5 = New-Object System.Windows.Forms.Button
$button6 = New-Object System.Windows.Forms.Button
$button7 = New-Object System.Windows.Forms.Button
$button8 = New-Object System.Windows.Forms.Button
$TabControl = New-object System.Windows.Forms.TabControl
$TroubleshootingPage = New-Object System.Windows.Forms.TabPage
$CPUPage = New-Object System.Windows.Forms.TabPage
$DiskPage = New-Object System.Windows.Forms.TabPage
$MemoryPage = New-Object System.Windows.Forms.TabPage

$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState

#Form Parameter
$form1.Text = "General Tech"
$form1.Name = "form1"
$form1.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Size = New-Object System.Drawing.Size
$form1.BackColor = "White"
$System_Drawing_Size.Width = 900
$System_Drawing_Size.Height = 450
$form1.FormBorderStyle = 'Fixed3D'
$form1.ClientSize = $System_Drawing_Size

# Draws Logo
$img = [System.Drawing.Image]::Fromfile('C:\temp\Launcher\Dependencies\icon\NewPanda.png')
$form1.BackgroundImage = $img
$form1.BackgroundImageLayout = "Center"

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
$form1.Controls.Add($tabControl)

#Verbose Output box
$outputBox = New-Object System.Windows.Forms.TextBox 
$outputBox.Location = New-Object System.Drawing.Size(550,50) 
$outputBox.Size = New-Object System.Drawing.Size(300,350) 
$outputBox.MultiLine = $True 
$outputBox.ScrollBars = "Vertical"
$form1.Controls.Add($outputBox)

#Troubleshooting Page
$TroubleshootingPage.DataBindings.DefaultDataSourceUpdateMode = 0
$TroubleshootingPage.UseVisualStyleBackColor = $True
$TroubleshootingPage.Name = "TroubleshootingPage"
$TroubleshootingPage.Text = "Troubleshooting”
$tabControl.Controls.Add($TroubleshootingPage)

#Remote Page
$CPUPage.DataBindings.DefaultDataSourceUpdateMode = 0
$CPUPage.UseVisualStyleBackColor = $True
$CPUPage.Name = "CPUPage"
$CPUPage.Text = "Remote”
$tabControl.Controls.Add($CPUPage)

#Bitlocker Page
$DiskPage.DataBindings.DefaultDataSourceUpdateMode = 0
$DiskPage.UseVisualStyleBackColor = $True
$DiskPage.Name = "DiskPage"
$DiskPage.Text = "Bitlocker”
$tabControl.Controls.Add($DiskPage)

#Users Page
$MemoryPage.DataBindings.DefaultDataSourceUpdateMode = 0
$MemoryPage.UseVisualStyleBackColor = $True
$MemoryPage.Name = "MemoryPage"
$MemoryPage.Text = "Users”
$tabControl.Controls.Add($MemoryPage)

#Add Label and TextBox
$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(175,20)  
$objLabel.Size = New-Object System.Drawing.Size(110,20)  
$objLabel.Text = "Enter Hostname"
$form1.Controls.Add($objLabel)
$objTextBox = New-Object System.Windows.Forms.TextBox 
$objTextBox.Location = New-Object System.Drawing.Size(120,45) 
$objTextBox.Size = New-Object System.Drawing.Size(200,20)  
$form1.Controls.Add($objTextBox) 


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
$System_Drawing_Point.Y = 45
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
$System_Drawing_Point.Y = 45
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
$System_Drawing_Point.Y = 75
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
$System_Drawing_Point.Y = 75
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
$System_Drawing_Point.Y = 105
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
$System_Drawing_Point.Y = 105
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
$System_Drawing_Point.Y = 135
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
$System_Drawing_Point.Y = 165
$button8.Location = $System_Drawing_Point
$button8.DataBindings.DefaultDataSourceUpdateMode = 0
$button8.add_Click($button5_RunOnClick)
$TroubleshootingPage.Controls.Add($button8)


#Save the initial state of the form
$InitialFormWindowState = $form1.WindowState
#Init the OnLoad event to correct the initial state of the form
$form1.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form1.ShowDialog()| Out-Null
} #End function CreateForm
 
 function Invoke-Sqlcmd3

{
    param(
    [string]$Query,             
    [string]$Database="tempdb",
    [Int32]$QueryTimeout=30
    )
    $conn=new-object System.Data.SqlClient.SQLConnection
    $conn.ConnectionString="Server={0};Database={1};Integrated Security=True" -f $Server,$Database
    $conn.Open()
    $cmd=new-object system.Data.SqlClient.SqlCommand($Query,$conn)
    $cmd.CommandTimeout=$QueryTimeout
    $ds=New-Object system.Data.DataSet
    $da=New-Object system.Data.SqlClient.SqlDataAdapter($cmd)
    [void]$da.fill($ds)
    $conn.Close()
    $ds.Tables[0]
}

 

Function SQLVersion
{
[string]$SQLVersion = @"
SELECT  @@Version
"@ 
 $Server = $objTextBox.text
Invoke-Sqlcmd3 -ServerInstance $Server -Database Master -Query $SQLVersion | Out-GridView -Title "$server SQL Server Version"
}

Function LastReboot
{
$Server = $objTextBox.text
$wmi = Get-WmiObject -Class Win32_OperatingSystem -Computer $server
$wmi.ConvertToDatetime($wmi.LastBootUpTime) | Select DateTime | Out-GridView -Title "$Server Last Reboot"
}

Function Requests
{
[string]$Requests = @"
SELECT
   db_name(r.database_id) as database_name, r.session_id AS SPID,r.status,s.host_name,
     r.start_time,(r.total_elapsed_time/1000) AS 'TotalElapsedTime Sec',
   r.wait_type as current_wait_type,r.wait_resource as current_wait_resource,
   r.blocking_session_id,r.logical_reads,r.reads,r.cpu_time as cpu_time_ms,r.writes,r.row_count,
   substring(st.text,r.statement_start_offset/2,
   (CASE WHEN r.statement_end_offset = -1 THEN len(convert(nvarchar(max), st.text)) * 2 ELSE r.statement_end_offset END - r.statement_start_offset)/2) as statement
FROM
   sys.dm_exec_requests r
      LEFT OUTER JOIN sys.dm_exec_sessions s on s.session_id = r.session_id
      LEFT OUTER JOIN sys.dm_exec_connections c on c.connection_id = r.connection_id       
      CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) st 
WHERE r.status NOT IN ('background','sleeping')
"@ 
 $Server = $objTextBox.text
Invoke-Sqlcmd3 -ServerInstance $Server -Database Master -Query $Requests | Out-GridView -Title "$server Requests"
}



#Call the Function

CreateForm