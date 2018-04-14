$host

- gives info about current powershell host including its version

- Everything is an object as so is host!!

so do $host.version

$host.version.Major

Hello world in powershell
_____________________

> 'hello world'

hello world

Using pipe:

> 'hello world' | Get-Member

The naming convention for powershell is verb-noun

Basically it gives us all methods available for that object

 TypeName: System.String

Name             MemberType            Definition
----             ----------            ----------
Clone            Method                System.Object Clone(), System.Object ICloneable.Clone()
CompareTo        Method                int CompareTo(System.Object value), int CompareTo(string strB), int IComparab...
Contains         Method                bool Contains(string value)
CopyTo           Method                void CopyTo(int sourceIndex, char[] destination, int destinationIndex, int co...
EndsWith         Method                bool EndsWith(string value), bool EndsWith(string value, System.StringCompari...
Equals           Method                bool Equals(System.Object obj), bool Equals(string value), bool Equals(string...
GetEnumerator    Method                System.CharEnumerator GetEnumerator(), System.Collections.IEnumerator IEnumer...
GetHashCode      Method                int GetHashCode()
GetType          Method                type GetType()
GetTypeCode      Method                System.TypeCode GetTypeCode(), System.TypeCode IConvertible.GetTypeCode()
IndexOf


PS C:\Users\v-shause> 'hello world'.Length
11

PS C:\Users\v-shause> 'hello world'.ToUpper()
HELLO WORLD

Using old school DOS commands
__________________________________


PS C:\Users\v-shause> ping google.com

Pinging google.com [216.58.197.46] with 32 bytes of data:
Reply from 216.58.197.46: bytes=32 time=111ms TTL=49
Reply from 216.58.197.46: bytes=32 time=169ms TTL=49
Reply from 216.58.197.46: bytes=32 time=68ms TTL=49
Reply from 216.58.197.46: bytes=32 time=115ms TTL=49

Ping statistics for 216.58.197.46:
    Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 68ms, Maximum = 169ms, Average = 115ms
	
	
PS C:\Users\v-shause> Test-Connection  google.com

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
LAPSZ1573     google.com      216.58.197.46                                             32       69
LAPSZ1573     google.com      216.58.197.46                                             32       48
LAPSZ1573     google.com      216.58.197.46                                             32       52
LAPSZ1573     google.com      216.58.197.46                                             32       43


Create a varr:

PS C:\Users\v-shause> $ping

Set var to ping google.com:

PS C:\Users\v-shause> $ping = ping google.com
PS C:\Users\v-shause> $ping

Pinging google.com [2404:6800:4007:802::200e] with 32 bytes of data:
Reply from 2404:6800:4007:802::200e: time=60ms
Reply from 2404:6800:4007:802::200e: time=38ms
Reply from 2404:6800:4007:802::200e: time=37ms
Reply from 2404:6800:4007:802::200e: time=45ms

Ping statistics for 2404:6800:4007:802::200e:
    Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 37ms, Maximum = 60ms, Average = 45ms
PS C:\Users\v-shause> $ping | Get-Member


   TypeName: System.String

Name             MemberType            Definition
----             ----------            ----------
Clone            Method                System.Object Clone(), System.Object ICloneable.Clone()
CompareTo        Method                int CompareTo(System.Object value), int CompareTo(string strB), int IComparab...
Contains         Method                bool Contains(string value)	

$ping is a String var

Null out $ping:

PS C:\Users\v-shause> $ping = $null
PS C:\Users\v-shause> $ping = Test-Connection google.com
PS C:\Users\v-shause> $ping

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
LAPSZ1573     google.com      172.217.163.142  2404:6800:4007:80e::200e                 32       44
LAPSZ1573     google.com      172.217.163.142  2404:6800:4007:80e::200e                 32       38
LAPSZ1573     google.com      172.217.163.142  2404:6800:4007:80e::200e                 32       43
LAPSZ1573     google.com      172.217.163.142  2404:6800:4007:80e::200e                 32       47


PS C:\Users\v-shause> $ping | Get-Member


   TypeName: System.Management.ManagementObject#root\cimv2\Win32_PingStatus

Name                           MemberType     Definition
----                           ----------     ----------
PSComputerName                 AliasProperty  PSComputerName = __SERVER
Address                        Property       string Address {get;set;}
BufferSize                     Property       uint32 BufferSize {get;set;}
NoFragmentation                Property       bool NoFragmentation {get;set;}
PrimaryAddressResolutionStatus Property       uint32 PrimaryAddressResolutionStatus {get;set;}

$ping is a management object of a certain class

This is an array

PS C:\Users\v-shause> $ping.Count
4
PS C:\Users\v-shause> $ping[0]

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
LAPSZ1573     google.com      172.217.163.142  2404:6800:4007:80e::200e                 32       44

Read in a file in powershell:
__________________________________

PS C:\Users\v-shause> $computers = Get-Content .\computers.txt
PS C:\Users\v-shause> $computers | Get-Member


   TypeName: System.String

Name             MemberType            Definition
----             ----------            ----------
Clone            Method                System.Object Clone(), System.Object ICloneable.Clone()
CompareTo        Method                int CompareTo(System.Object value), int CompareTo(string strB), int IComparab...
Contains         Method                bool Contains(string value)

PS C:\Users\v-shause> $computers[0]
google.com
PS C:\Users\v-shause> $computers[1]
youtube.com
PS C:\Users\v-shause> Test-Connection $computers

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
LAPSZ1573     google.com      172.217.26.174   2404:6800:4007:80e::200e                 32       45
LAPSZ1573     google.com      172.217.26.174   2404:6800:4007:80e::200e                 32       74
LAPSZ1573     google.com      172.217.26.174   2404:6800:4007:80e::200e                 32       56
LAPSZ1573     google.com      172.217.26.174   2404:6800:4007:80e::200e                 32       40
LAPSZ1573     youtube.com     172.217.163.142  2404:6800:4007:801::200e                 32       48
LAPSZ1573     youtube.com     172.217.163.142  2404:6800:4007:801::200e                 32       81
LAPSZ1573     youtube.com     172.217.163.142  2404:6800:4007:801::200e                 32       41
LAPSZ1573     youtube.com     172.217.163.142  2404:6800:4007:801::200e                 32       49


Option2 :
_____________________

In the above case we read in a file and it took it as an array of strings

But powershell is built on .NET

So we can create arrays like we do in .NET

https://msdn.microsoft.com/en-us/library/system.collections.arraylist(v=vs.110).aspx

PS C:\Users\v-shause> [System.Collections.ArrayList]$computers = @()
PS C:\Users\v-shause> $computers
PS C:\Users\v-shause> $computers.Count
0
PS C:\Users\v-shause> $computers.Add('google.com')
0
PS C:\Users\v-shause> $computers.Add('youtube.com')
1
PS C:\Users\v-shause> $computers[0]
google.com
PS C:\Users\v-shause> $computers.Count
2
PS C:\Users\v-shause> Test-Connection $computers

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
LAPSZ1573     google.com      172.217.26.174   2404:6800:4007:801::200e                 32       47
LAPSZ1573     google.com      172.217.26.174   2404:6800:4007:801::200e                 32       66
LAPSZ1573     google.com      172.217.26.174   2404:6800:4007:801::200e                 32       36
LAPSZ1573     google.com      172.217.26.174   2404:6800:4007:801::200e                 32       58
LAPSZ1573     youtube.com     172.217.26.174   2404:6800:4007:801::200e                 32       47

Profiling
_____________________

Whwn w elaunch powershell one of the 1st thing it does is look for a profile
profile is a file named profile.ps1
if exisits it executes that code when u launch powershell

PS C:\Users\v-shause> $PROFILE
C:\Users\v-shause\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

PS C:\Users\v-shause> $PROFILE.CurrentUserAllHosts
C:\Users\v-shause\Documents\WindowsPowerShell\profile.ps1


So 'C:\Users\v-shause\Documents\WindowsPowerShell\profile.ps1' is the path we want to create

PS C:\Users\v-shause> $PROFILE
C:\Users\v-shause\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
PS C:\Users\v-shause> $PROFILE.CurrentUserAllHosts
C:\Users\v-shause\Documents\WindowsPowerShell\profile.ps1
PS C:\Users\v-shause> Test-Path C:\Users\v-shause\Documents\WindowsPowerShell\
False
PS C:\Users\v-shause> New-Item -Path C:\Users\v-shause\Documents\WindowsPowerShell\ -ItemType Directory


    Directory: C:\Users\v-shause\Documents


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d-----        4/12/2018   1:32 AM                WindowsPowerShell


PS C:\Users\v-shause> Test-Path C:\Users\v-shause\Documents\WindowsPowerShell\
True
PS C:\Users\v-shause> New-Item -Path $PROFILE.CurrentUserAllHosts -ItemType File


    Directory: C:\Users\v-shause\Documents\WindowsPowerShell


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----        4/12/2018   1:33 AM              0 profile.ps1


PS C:\Users\v-shause> start $PROFILE.CurrentUserAllHosts

It opens up the profile.ps1 file in your default text editor

You can run a local powershell script like ./script.ps1

Modules:
_____________________

.psm1 is the extension for modeules

Import-Module .\module_name.psm1
Get-Command -module module_name

Command Structure:
_____________________

PS C:\Users\v-shause> Get-Verb

Verb        Group
----        -----
Add         Common
Clear       Common
Close       Common
Copy        Common
Enter       Common
Exit        Common
Find        Common
Format      Common
Get         Common

These are some of the verbs which are used

Alias:
_____________________


ls command works in powershell. But its a linux command

PS C:\Users\v-shause> Get-Alias -Name ls

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           ls -> Get-ChildItem

Get-ChildItem is a powershell command to get contents of the working directory

Get-Command:

Gives all the commonly used powershell commands

filter by module:

PS C:\Users\v-shause> Get-Command -Module Microsoft.PowerShell.Management

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Cmdlet          Add-Computer                                       3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Add-Content                                        3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Checkpoint-Computer                                3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Clear-Content                                      3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Clear-EventLog                                     3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Clear-Item                                         3.1.0.0    Microsoft.PowerShell.Management

This gives us core powershell commands

What if we want to seach commands related to processes?

PS C:\Users\v-shause> Get-Command -Name '*process*'

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-AppvVirtualProcess                             1.0.0.0    AppvClient
Function        Start-AppvVirtualProcess                           1.0.0.0    AppvClient
Cmdlet          ConvertTo-ProcessMitigationPolicy                  1.0.11     ProcessMitigations
Cmdlet          Debug-Process                                      3.1.0.0    Microsoft.PowerShell.Management
Cmdlet          Enter-PSHostProcess                                3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Exit-PSHostProcess                                 3.0.0.0    Microsoft.PowerShell.Core

GetProcess returns all running processes on my system

Alternate way:
_____________________

PS C:\Users\v-shause> Get-Command | Where-Object {$_.Name -like "*process*"}

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-AppvVirtualProcess                             1.0.0.0    AppvClient
Function        Start-AppvVirtualProcess                           1.0.0.0    AppvClient
Cmdlet          ConvertTo-ProcessMitigationPolicy                  1.0.11     ProcessMitigations
Cmdlet          Debug-Process                                      3.1.0.0    Microsoft.PowerShell.Management


Where-Object is basically a filter

$_. : foreach elem

$_.Name : foreach item we want the property Name

Select-Object : selects the colums we specify

PS C:\Users\v-shause> Get-Command | Select-Object Version

Version
-------
3.0
3.0
3.0
3.0

What processes are consuming the most CPU?

PS C:\Users\v-shause> Get-Process | Select-Object Name, CPU | Sort-Object CPU -Descending

Name                          CPU
----                          ---
chrome                 2338.21875
chrome                 2199.84375
SynTPEnh              1825.234375
chrome                    662.125

PS C:\Users\v-shause> Get-Process | Out-GridView

Pops ou a window with the processes info

PS C:\Users\v-shause> Get-Process | Select-Object * | Out-GridView

Write the process info into a file

PS C:\Users\v-shause> Get-Process > file.txt
PS C:\Users\v-shause> more .\file.txt

Handles  NPM(K)    PM(K)      WS(K)     CPU(s)     Id  SI ProcessName
-------  ------    -----      -----     ------     --  -- -----------
    529      30    19628      31212       6.92  12808   5 ApplicationFrameHost
    148       8     1440       6216              3176   0 armsvc
    219      13    10400      17244       7.58   9892   0 audiodg
    646      31    17388        368       4.50  19036   5 backgroundTaskHost
    648      26     9784      26340      13.94  15544   5 browser_broker
	
	Append to the file:
	
PS C:\Users\v-shause> Get-Process >> file.txt
PS C:\Users\v-shause> start .\file.txt

Delete file:

PS C:\Users\v-shause> Remove-Item .\file.txt
PS C:\Users\v-shause> start .\file.txt
start : This command cannot be run due to the error: The system cannot find the file specified.
At line:1 char:1
+ start .\file.txt
+ ~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [Start-Process], InvalidOperationException
    + FullyQualifiedErrorId : InvalidOperationException,Microsoft.PowerShell.Commands.StartProcessCommand
	
Alternate way to write to file:

PS C:\Users\v-shause> Get-Process | Out-File .\file.txt
PS C:\Users\v-shause> start .\file.txt
PS C:\Users\v-shause>
	
Append:

PS C:\Users\v-shause> Get-Process | Out-File .\file.txt -Append
PS C:\Users\v-shause> start .\file.txt

Second method is more readable

HELP:
__________________________________

To create comment based help in PowerShell, you'll need the following basic layout:

<#   
.SYNOPSIS   
   A brief description of what your code does.
.DESCRIPTION 
   A full description of what your code does.
.NOTES   
    Name: Script/function/module name
    Author: Your Name
    DateCreated: The current date
#>

This block should go above all of the code you are going to use, and is the only thing in PowerShell allowed above the [cmdletbinding()] statement.

	
	
	
	
	
	
	
	