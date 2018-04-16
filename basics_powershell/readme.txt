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

Modules:
_____________________

Modules in PowerShell are a way to aggregate functions into one file and then re-use them later. There are various different module types, but we'll be focusing on Script Modules. If you find yourself reusing functions here and there, it may be time to create a module in PowerShell. 

Script modules require these basic items:

-A file with code in it (for script modules this will be a .psm1 file)
-Any required modules / scripts that the module itself requires
-A folder that has the module name stored where PowerShell can import the module
-This isn't exactly required, but is is immensely helpful: a manifest file that contains metadata (version/author/file info).

In PowerShell, you can see what modules are available to you by using the following command:
Get-Module -ListAvailable

To  see what modules you are currently using in your session, type:
Get-Module

If you 'd like to see what commands a module has available, use:

PS C:\Users\Shaunak> Get-Command -Module DnsClient

CommandType     Name                                               Version    Source                                                 
-----------     ----                                               -------    ------                                                 
Function        Add-DnsClientNrptRule                              1.0.0.0    DnsClient                                              
Function        Clear-DnsClientCache                               1.0.0.0    DnsClient                                              
Function        Get-DnsClient                                      1.0.0.0    DnsClient                                              
Function        Get-DnsClientCache                                 1.0.0.0    DnsClient                                              
Function        Get-DnsClientGlobalSetting                         1.0.0.0    DnsClient                                              
Function        Get-DnsClientNrptGlobal                            1.0.0.0    DnsClient                                              
Function        Get-DnsClientNrptPolicy                            1.0.0.0    DnsClient                                              
Function        Get-DnsClientNrptRule                              1.0.0.0    DnsClient                                              
Function        Get-DnsClientServerAddress                         1.0.0.0    DnsClient                                              
Function        Register-DnsClient                                 1.0.0.0    DnsClient    

Let's try to use one of the commands from the DnsClient module.

Clear-DnsClientCache

Get-Module

It looks like the module was automatically imported into PowerShell when we used one of its commands. That is because starting in PowerShell version 3.0, modules that are available via Get-Module -ListAvailable will be automatically imported if one of their commands are used.

CREATING MODULES


PowerShell modules available via Get-Module -ListAvailable are stored in folders listed in the environment variable PSModulePath. Use the following commands to see where the folders are:

The folders:

C:\Program Files\WindowsPowerShell\Modules
C:\Windows\system32\WindowsPowerShell\v1.0\Modules
Contain modules that will be available to anybody using PowerShell on the local machine.

Let's keep the scope to not require administrative rights (which those folders require to change at all), and create the Documents\WindowsPowerShell\Modules folder.    

The full path for my instance of PowerShell can be found by using:

(Get-ChildItem Env:\PSModulePath).Value.Split(';')[0]

When you find the one that matches, use the following command to create the folder:

$location = (Get-ChildItem Env:\PSModulePath).Value.Split(';')[0]

New-Item -Path $location -ItemType Directory

Set-Location $location

PS C:\Users\Shaunak\Documents\WindowsPowerShell\Modules> 

In that folder create a script called Script2.psm1

New-ModuleManifest -Path .\Script2.psd1 -NestedModules 'Script2.psm1'

Use Get-ChildItem to list out the files

PS C:\Users\Shaunak\Documents\WindowsPowerShell\Modules> Get-ChildItem


    Directory: C:\Users\Shaunak\Documents\WindowsPowerShell\Modules


Mode                LastWriteTime         Length Name                                                                                
----                -------------         ------ ----                                                                                
-a----        4/14/2018  10:08 AM           2629 Script2.ps1                                                                         
-a----        4/14/2018   3:41 PM           7740 Script2.psd1                                                                        
-a----        4/14/2018  10:09 AM           2629 Script2.psm1                                                                        
IMPORT A MODULE
Let's import the module we created!

Make sure you see it via:

Get-Module -ListAvailable

When developing your own modules, Import-Module and Remove-Module will be your friends. When you import a module, it is imported into memory in its current state at that moment. That means if you make any changes after importing, you will have to remove and then re-import the module.

Import-Module Part6


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

Get-Help .\part7example.ps1

Accepting Pipeline Input:
__________________________________

The pipeline in PowerShell is what commands use when separated with the pipeline operator '|'. It allows commands to pass the output values to the next command in the sequence. You can pipe as many commands together as necessary to complete your task. 

Pipeline structure:

Command1 (output) -> | Command2 (output) -> | Command3

Let's start with Get-Process.

Get-Process
This command will give you a list of all running processes, and some information for each process.

What if we just cared about the first 10 processes, sorted by CPU usage?

Let's try:

Get-Process | Sort-Object CPU -Descending | Select-Object -First 10

The above command takes Get-Process, then pipes it to Sort-Object (which we have sorting by CPU, descending), and then pipes that to Select-Object so we can specify that we want to see the First 10 results only. 

We can use the same command, but specify -Last 10 to see the last 10 results.

Get-Process | Sort-Object CPU -Descending | Select-Object -Last 10

Pretty handy! What if we wanted to see this in a different way? You can take the above command, and then pipe it to Out-GridView.

Get-Process | Sort-Object CPU -Descending | Select-Object -Last 10 | Out-GridView

<<to be continued...>>

__________________________________

ALL ABOUT STRINGS!

__________________________________

JOBS
__________________________________

ERROR HANDLING
__________________________________

CREATING CUSTOM OBJECTS
__________________________________

IMPORTING, USING, AND EXPORTING DATA
__________________________________

UTILIZING THE WEB: PART 1 (INVOKE-WEBREQUEST)
__________________________________

PowerShell can do quite a bit with web sites, and web services. 

Some of what we can do includes:

-Checking if a website is up
-Downloading files
-Logging in to webpages
-Parsing the content we receive
-Utilizing REST methods

Invoke-WebRequest is a command that allows us to retrieve content from web pages. The methods supported when using Invoke-WebRequest are:

Trace
Put
Post
Options
Patch
Merge
Delete
Default
Head
Get (Default)
Let's take a look at some different ways to utilize Invoke-WebRequest

DOWNLOADING A FILE:

Let's download a file! In this particular example, we will download an addon for World of Warcraft.

The page we'll be looking at is http://www.tukui.org/dl.php

$downloadURL = 'http://www.anubandh.com/'
$downloadRequest = Invoke-WebRequest -Uri $downloadURL

Here I set the $downloadURL variable to store the main page we want to go to, and then use $downloadRequest to store the results of Invoke-WebRequest (using the $downloadURL as the URI).

Let's take a look at what's in $downloadRequest.

StatusCode        : 200
StatusDescription : OK
Content           : <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
                    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
                    <html xmlns="http://www.w3.org/1999/xhtml">
                    
                    <head>
                    <meta name="google-site-ve...
RawContent        : HTTP/1.1 200 OK
                    Pragma: no-cache
                    Transfer-Encoding: chunked
                    Cache-Control: no-store
                    Content-Type: text/html;charset=ISO-8859-1
                    Date: Mon, 16 Apr 2018 04:22:14 GMT
                    Expires: Thu, 01 Jan 1970 00:00...
Forms             : {search, searchAdv, login}
Headers           : {[Pragma, no-cache], [Transfer-Encoding, chunked], [Cache-Control, no-store], [Content-Type, 
                    text/html;charset=ISO-8859-1]...}
Images            : {@{innerHTML=; innerText=; outerHTML=<IMG src="https://www.anubandh.com/images/colorfullstrip_top.gif" 
                    width="99.8%" height=19>; outerText=; tagName=IMG; src=https://www.anubandh.com/images/colorfullstrip_top.gif; 
                    width=99.8%; height=19}, @{innerHTML=; innerText=; outerHTML=<IMG 
                    src="https://www.anubandh.com/images/HomePageBanner.gif" width=747 height=104>; outerText=; tagName=IMG; 
                    src=https://www.anubandh.com/images/HomePageBanner.gif; width=747; height=104}, @{innerHTML=; innerText=; 
                    outerHTML=<IMG src="https://www.anubandh.com/images/colorfullstrip_bottom.gif" width="100%" height=20>; 
                    outerText=; tagName=IMG; src=https://www.anubandh.com/images/colorfullstrip_bottom.gif; width=100%; height=20}, 
                    @{innerHTML=; innerText=; outerHTML=<IMG border=0 alt="Advance Search" 
                    src="https://www.anubandh.com/images/btn_advancesearch.gif" width=107 height=20>; outerText=; tagName=IMG; 
                    border=0; alt=Advance Search; src=https://www.anubandh.com/images/btn_advancesearch.gif; width=107; 
                    height=20}...}
InputFields       : {@{innerHTML=; innerText=; outerHTML=<INPUT height=20 alt=Search 
                    src="https://www.anubandh.com/images/btn_search.gif" type=image width=57 valign="top">; outerText=; 
                    tagName=INPUT; height=20; alt=Search; src=https://www.anubandh.com/images/btn_search.gif; type=image; width=57; 
                    valign=top}, @{innerHTML=; innerText=; outerHTML=<INPUT class=textbox size=10 name=searchParamVal>; outerText=; 
                    tagName=INPUT; class=textbox; size=10; name=searchParamVal}, @{innerHTML=; innerText=; outerHTML=<INPUT 
                    height=20 alt=Search src="https://www.anubandh.com/images/btn_search.gif" type=image width=57 align=left 
                    border=0>; outerText=; tagName=INPUT; height=20; alt=Search; src=https://www.anubandh.com/images/btn_search.gif; 
                    type=image; width=57; align=left; border=0}, @{innerHTML=; innerText=; outerHTML=<INPUT class=textbox size=13 
                    name=login_name>; outerText=; tagName=INPUT; class=textbox; size=13; name=login_name}...}
Links             : {@{innerHTML=<IMG border=0 alt="Advance Search" src="https://www.anubandh.com/images/btn_advancesearch.gif" 
                    width=107 height=20> ; innerText= ; outerHTML=<A 
                    href="https://www.anubandh.com/marriage_bureau/index.jsp?search_type=advance&amp;page_no=0"><IMG border=0 
                    alt="Advance Search" src="https://www.anubandh.com/images/btn_advancesearch.gif" width=107 height=20> </A>; 
                    outerText= ; tagName=A; 
                    href=https://www.anubandh.com/marriage_bureau/index.jsp?search_type=advance&amp;page_no=0}, @{innerHTML=<IMG 
                    border=0 alt=Home src="https://www.anubandh.com/images/btn_home.gif" width=107 height=20> ; innerText= ; 
                    outerHTML=<A href="../marriage_bureau/index.jsp"><IMG border=0 alt=Home 
                    src="https://www.anubandh.com/images/btn_home.gif" width=107 height=20> </A>; outerText= ; tagName=A; 
                    href=../marriage_bureau/index.jsp}, @{innerHTML=<SPAN class=login>Forgot Password?</SPAN>; innerText=Forgot 
                    Password?; outerHTML=<A href="https://www.anubandh.com/marriage_bureau/ForgotPassword.jsp"><SPAN 
                    class=login>Forgot Password?</SPAN></A>; outerText=Forgot Password?; tagName=A; 
                    href=https://www.anubandh.com/marriage_bureau/ForgotPassword.jsp}, @{innerHTML=<SPAN 
                    class=login>Register</SPAN>; innerText=Register; outerHTML=<A href="https://www.anubandh.com/index.html"><SPAN 
                    class=login>Register</SPAN></A>; outerText=Register; tagName=A; href=https://www.anubandh.com/index.html}...}
ParsedHtml        : mshtml.HTMLDocumentClass
RawContentLength  : 56075

$downloadRequest.Content gives us the entire code of the website
Similarly all other Properties like Forms Headers InputFields Links are also useful

We'll go over some of the other properties later, and focus on Links for now. The Links property returns all the links found on the web site. $downloadRequest.Links

innerHTML : Contact Us 
innerText : Contact Us 
outerHTML : <A href="https://www.anubandh.com//marriage_bureau/ContactInfo.jsp?screen=1">Contact Us </A>
outerText : Contact Us 
tagName   : A
href      : https://www.anubandh.com//marriage_bureau/ContactInfo.jsp?screen=1

innerHTML : Disclaimer
innerText : Disclaimer
outerHTML : <A href="https://www.anubandh.com//marriage_bureau/Disclaimer.jsp?screen=1">Disclaimer</A>
outerText : Disclaimer
tagName   : A
href      : https://www.anubandh.com//marriage_bureau/Disclaimer.jsp?screen=1

The list continues, but you get the idea. This is one of my favorite things about the Invoke-WebRequest command. The way it returns links is very easy to parse through.

Lets search for Sujit Tangadpalliwar

PS C:\Users\Shaunak> $downloadRequest.Links | Where-Object {$_ -like '*Sujit*' -and $_ -like '*Tangadp*'}


innerHTML : Sujit Tangadpalliwar (ID: 20933) 
innerText : Sujit Tangadpalliwar (ID: 20933) 
outerHTML : <A href="https://www.anubandh.com/marriage_bureau/profile_table.jsp?user_id=20933">Sujit Tangadpalliwar (ID: 20933) </A>
outerText : Sujit Tangadpalliwar (ID: 20933) 
tagName   : A
href      : https://www.anubandh.com/marriage_bureau/profile_table.jsp?user_id=20933




	
	
	
	
	
	