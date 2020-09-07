@ECHO OFF &SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
title Felipe.#8581 ~ Donate: bit.ly/3goAOyc 
cd /D "%~dp0"


echo.
echo.
echo Tweaking improves latency, input lag, system responsiveness, not FPS. You can
echo improve min and lows frametimes, depending on your hardware but do not expect
echo your computer to suddenly start hitting higher fps unless you did shit before 
echo This is not realistic and that's why it's called optimization, not a miracle
echo       "If you want more FPS, buy a new one PC with better hardware."
echo.
echo.
echo I offer a Post-Install that works flawless on MY PC and should work on others
echo     For more, search for this in google: "Danske's Windows Tweaking Guide"
echo  For full optimization, download Folders.zip and install all Recommendables
echo.
echo.

IF EXIST "C:\Windows\system32\adminrightstest" (
rmdir C:\Windows\system32\adminrightstest >NUL 2>&1
)
mkdir C:\Windows\system32\adminrightstest >NUL 2>&1
if %errorlevel% neq 0 (
POWERSHELL "Start-Process \"%~nx0\" -Verb RunAs"
if !errorlevel! neq 0 (
POWERSHELL "Start-Process '%~nx0' -Verb RunAs"
if !errorlevel! neq 0 (
ECHO You should run this script as Admin in order to allow system changes
ECHO The tweaker will now exit
pause
exit
)
)
exit
)
rmdir C:\Windows\system32\adminrightstest >NUL 2>&1

ECHO Preparation...
ECHO Enabling and starting required services

SC CONFIG Winmgmt start= auto >NUL 2>&1 
SC CONFIG TrustedInstaller start= demand >NUL 2>&1
SC CONFIG AppInfo start= demand >NUL 2>&1
SC CONFIG DeviceInstall start= demand >NUL 2>&1
SC START Winmgmt >NUL 2>&1
SC START TrustedInstaller >NUL 2>&1
SC START AppInfo >NUL 2>&1
SC START DeviceInstall >NUL 2>&1

ECHO Disabling possible autoruns
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Spotify" /f >NUL 2>&1
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Discord" /f >NUL 2>&1

ECHO Disabling Tracking Services and Data Collection
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f > NUL 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f > NUL 2>&1

ECHO Disabling Telemetry
echo "" > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl >NUL 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSync" /t REG_DWORD /d 2 /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSyncUserOverride" /t REG_DWORD /d "1" /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\EnhancedStorageDevices" /v "TCGSecurityActivationDisabled" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d "1" /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\safer\codeidentifiers" /v "authenticodeenabled" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowIndexingEncryptedStoresOrItems" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AlwaysUseAutoLangDetection" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "value" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "value" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f > NUL 2>&1
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f > NUL 2>&1
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /t REG_DWORD /d "0" /f > NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /t REG_DWORD /d 0x1 /f > NUL 2>&1

ECHO Disables SmartScreen
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d "Off" /f > NUL 2>&1
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v ContentEvaluation /t REG_DWORD /d "0" /f > NUL 2>&1

ECHO Disable Timeline
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f > NUL 2>&1

ECHO Disable PageFileShutdown and ActiveProbing
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "1" /f > NUL 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d "0" /f > NUL 2>&1

ECHO Set Time to UTC
RED ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /t REG_DWORD /d "1" /f > NUL 2>&1

ECHO Remove Metadata Tracking
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /f > NUL 2>&1

ECHO Remove Storage Sense
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense" /f > NUL 2>&1

ECHO Enables All Folders in Explorer Navigation Panel
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO Setting Execution Policy to Unrestricted
POWERSHELL "Set-ExecutionPolicy -ExecutionPolicy Unrestricted" >NUL 2>&1

ECHO Cleaning all nvidia settings
del "C:\ProgramData\NVIDIA Corporation\Drs\nvdrsdb0.bin" >NUL 2>&1
del "C:\ProgramData\NVIDIA Corporation\Drs\nvdrsdb1.bin" >NUL 2>&1
del "C:\ProgramData\NVIDIA Corporation\Drs\nvdrssel.bin" >NUL 2>&1

ECHO Unlocking SILK Smoothness
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID61684" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO Removing Kernel Blacklist
REG DELETE "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\GraphicsDrivers\BlockList\Kernel" /va /reg:64 /f >NUL 2>&1

ECHO Removing Image File Execution Options
POWERSHELL "Remove-Item -Path \"HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\*\" -Recurse -ErrorAction SilentlyContinue" >NUL 2>&1

ECHO Disabling UAC
REG ADD "HKLM\System\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableVirtualization" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ValidateAdminCodeSignatures" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO Disabling mitigations
POWERSHELL "ForEach($v in (Get-Command -Name \"Set-ProcessMitigation\").Parameters[\"Disable\"].Attributes.ValidValues){Set-ProcessMitigation -System -Disable $v.ToString() -ErrorAction SilentlyContinue}"  >NUL 2>&1

ECHO Disabling RAM compression
POWERSHELL Disable-MMAgent -MemoryCompression -ApplicationPreLaunch -ErrorAction SilentlyContinue >NUL 2>&1

ECHO Disabling Hibernation
powercfg -h off >NUL 2>&1

ECHO Disabling Winsock Send Autotuning (dynamic send-buffer)
NETSH winsock set autotuning off >NUL 2>&1

ECHO Enabling Windows Components
dism /online /enable-feature /featurename:DesktopExperience /all /norestart >NUL 2>&1
dism /online /enable-feature /featurename:DesktopExperience /norestart >NUL 2>&1
dism /online /enable-feature /featurename:LegacyComponents /all /norestart >NUL 2>&1
dism /online /enable-feature /featurename:LegacyComponents /norestart >NUL 2>&1
dism /online /enable-feature /featurename:DirectPlay /all /norestart >NUL 2>&1
dism /online /enable-feature /featurename:DirectPlay /norestart >NUL 2>&1
dism /online /enable-feature /featurename:NetFx4-AdvSrvs /all /norestart >NUL 2>&1
dism /online /enable-feature /featurename:NetFx4-AdvSrvs /norestart >NUL 2>&1
dism /online /enable-feature /featurename:NetFx3 /all /norestart >NUL 2>&1
dism /online /enable-feature /featurename:NetFx3 /norestart >NUL 2>&1

ECHO Enabling AL HRTF
ECHO hrtf ^= true > "%appdata%\alsoft.ini"
ECHO hrtf ^= true > "C:\ProgramData\alsoft.ini"

ECHO Debloating Softwares
REM Google Chrome
taskkill /f /im chrome.exe >NUL 2>&1
schtasks.exe /change /TN "\GoogleUpdateTaskMachineCore" /Disable >NUL 2>&1
schtasks.exe /change /TN "\GoogleUpdateTaskMachineUA" /Disable >NUL 2>&1
sc delete gupdate >NUL 2>&1
sc delete gupdatem >NUL 2>&1
sc delete GoogleChromeElevationService >NUL 2>&1
REM Notepad++
del /F /Q "%ProgramFiles%\Notepad++\updater" >NUL 2>&1
REM Easy7Zip
REG ADD "HKCU\Software\7-Zip\Options" /v "CascadedMenu" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKCU\Software\7-Zip\Options" /v "MenuIcons" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKCU\Software\7-Zip\Options" /v "ContextMenu" /t REG_DWORD /d "4132" /f >NUL 2>&1
REG ADD "HKCU\Software\7-Zip\FM\Columns" /v "RootFolder" /t REG_BINARY /d "0100000000000000010000000400000001000000A0000000" /f >NUL 2>&1
del "C:\Users\Public\Desktop\7-Zip File Manager.lnk" >NUL 2>&1
REM Discord
taskkill /f /im discord.exe >NUL 2>&1
rmdir /s /q "%appdata%\discord\0.0.307\modules\discord_dispatch" >NUL 2>&1
rmdir /s /q "%appdata%\discord\0.0.307\modules\discord_krisp" >NUL 2>&1
rmdir /s /q "%appdata%\discord\0.0.307\modules\discord_media" >NUL 2>&1
rmdir /s /q "%appdata%\discord\0.0.307\modules\discord_rpc" >NUL 2>&1
rmdir /s /q "%appdata%\discord\0.0.307\modules\discord_erlpack" >NUL 2>&1
rmdir /s /q "%appdata%\discord\0.0.307\modules\discord_game_utils" >NUL 2>&1
rmdir /s /q "%appdata%\discord\0.0.307\modules\discord_spellcheck" >NUL 2>&1
attrib +r "%localappdata%\Discord\Update.exe" >NUL 2>&1
REM Spotify
taskkill /f /im spotify.exe >NUL 2>&1
del /f/s/q "%appdata%\Spotify\SpotifyMigrator.exe" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\SpotifyStartupTask.exe" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\Apps\Buddy-list.spa" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\Apps\Concert.spa" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\Apps\Concerts.spa" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\Apps\Error.spa" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\Apps\Findfriends.spa" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\Apps\Legacy-lyrics.spa" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\Apps\Lyrics.spa" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\Apps\Show.spa" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\Apps\Buddy-list.spa" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\am.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\ar.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\ar.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\bg.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\bn.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\ca.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\cs.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\cs.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\da.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\de.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\de.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\el.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\el.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\en-GB.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\es.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\es.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\es-419.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\es-419.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\et.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\fa.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\fi.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\fi.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\fil.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\fr.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\fr.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\fr-CA.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\gu.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\he.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\he.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\hi.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\hr.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\hu.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\hu.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\id.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\id.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\it.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\it.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\ja.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\ja.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\kn.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\ko.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\ko.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\lt.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\lv.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\ml.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\mr.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\ms.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\ms.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\nb.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\nl.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\nl.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\pl.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\pl.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\pt-PT.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\pt-BR.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\pt-BR.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\ro.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\ru.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\ru.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\sk.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\sl.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\sr.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\sv.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\sv.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\sw.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\ta.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\te.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\th.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\th.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\tr.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\tr.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\uk.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\vi.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\vi.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\zh-CN.pak" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\zh-Hant.mo" >NUL 2>&1
del /f/s/q "%appdata%\Spotify\locales\zh-TW.pak" >NUL 2>&1
ECHO ui.hardware_acceleration=false > %appdata%\Spotify\prefs

ECHO Adding lines to hosts file
SET NEWLINE=^& echo.
FIND /C /I "telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 telemetry.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "vortex.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 vortex.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "vortex-win.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 vortex-win.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "telecommand.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 telecommand.telemetry.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "telecommand.telemetry.microsoft.com.nsatc.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 telecommand.telemetry.microsoft.com.nsatc.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "oca.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 oca.telemetry.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "oca.telemetry.microsoft.com.nsatc.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 oca.telemetry.microsoft.com.nsatc.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sqm.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sqm.telemetry.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sqm.telemetry.microsoft.com.nsatc.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sqm.telemetry.microsoft.com.nsatc.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "watson.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 watson.telemetry.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "watson.telemetry.microsoft.com.nsatc.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 watson.telemetry.microsoft.com.nsatc.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "redir.metaservices.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 redir.metaservices.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "choice.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 choice.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "choice.microsoft.com.nsatc.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 choice.microsoft.com.nsatc.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "df.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 df.telemetry.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "wes.df.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 wes.df.telemetry.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "reports.wes.df.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 reports.wes.df.telemetry.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "services.wes.df.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 services.wes.df.telemetry.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sqm.df.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sqm.df.telemetry.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "watson.ppe.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 watson.ppe.telemetry.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "telemetry.appex.bing.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 telemetry.appex.bing.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "telemetry.urs.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 telemetry.urs.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "telemetry.appex.bing.net:443" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 telemetry.appex.bing.net:443>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "settings-sandbox.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 settings-sandbox.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "vortex-sandbox.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 vortex-sandbox.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "watson.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 watson.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "survey.watson.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 survey.watson.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "watson.live.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 watson.live.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "statsfe2.ws.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 statsfe2.ws.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "corpext.msitadfs.glbdns2.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 corpext.msitadfs.glbdns2.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "compatexchange.cloudapp.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 compatexchange.cloudapp.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cs1.wpc.v0cdn.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cs1.wpc.v0cdn.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "a-0001.a-msedge.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 a-0001.a-msedge.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "fe2.update.microsoft.com.akadns.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 fe2.update.microsoft.com.akadns.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "statsfe2.update.microsoft.com.akadns.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 statsfe2.update.microsoft.com.akadns.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sls.update.microsoft.com.akadns.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sls.update.microsoft.com.akadns.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "diagnostics.support.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 diagnostics.support.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "corp.sts.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 corp.sts.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "statsfe1.ws.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 statsfe1.ws.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pre.footprintpredict.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pre.footprintpredict.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "i1.services.social.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 i1.services.social.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "i1.services.social.microsoft.com.nsatc.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 i1.services.social.microsoft.com.nsatc.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "feedback.windows.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 feedback.windows.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "feedback.microsoft-hohm.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 feedback.microsoft-hohm.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "feedback.search.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 feedback.search.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn.content.prod.cms.msn.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn.content.prod.cms.msn.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn.content.prod.cms.msn.com.edgekey.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn.content.prod.cms.msn.com.edgekey.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "e10663.g.akamaiedge.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 e10663.g.akamaiedge.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "dmd.metaservices.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 dmd.metaservices.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "schemas.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 schemas.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "go.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 go.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "40.76.0.0/14" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 40.76.0.0/14>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "40.96.0.0/12" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 40.96.0.0/12>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "40.124.0.0/16" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 40.124.0.0/16>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "40.112.0.0/13" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 40.112.0.0/13>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "40.125.0.0/17" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 40.125.0.0/17>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "40.74.0.0/15" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 40.74.0.0/15>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "40.80.0.0/12" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 40.80.0.0/12>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "40.120.0.0/14" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 40.120.0.0/14>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "137.116.0.0/16" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 137.116.0.0/16>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "23.192.0.0/11" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 23.192.0.0/11>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "23.32.0.0/11" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 23.32.0.0/11>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "23.64.0.0/14" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 23.64.0.0/14>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "23.55.130.182" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 23.55.130.182>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "a.ads1.msads.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 a.ads1.msads.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "a.ads1.msn.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 a.ads1.msn.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "a.ads2.msads.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 a.ads2.msads.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "a.ads2.msn.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 a.ads2.msn.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.live.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.live.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.msn.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.msn.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bingads.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bingads.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "browser.events.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 browser.events.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cache.datamart.windows.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cache.datamart.windows.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "events.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 events.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "manage.devcenter.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 manage.devcenter.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mobile.events.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mobile.events.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mobile.pipe.aria.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mobile.pipe.aria.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "onecollector.cloudapp.aria.akadns.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 onecollector.cloudapp.aria.akadns.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "prod.nexusrules.live.com.akadns.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 prod.nexusrules.live.com.akadns.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ris.api.iris.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ris.api.iris.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "self.events.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 self.events.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "settings-win.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 settings-win.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "spynet2.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 spynet2.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "spynetalt.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 spynetalt.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "telecommand.alpha.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 telecommand.alpha.telemetry.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "telecommand.df.telemetry.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 telecommand.df.telemetry.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "telemetry.appex.bing.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 telemetry.appex.bing.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "telemetry.urs.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 telemetry.urs.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "telemetrysvc-by3p.smartscreen.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 telemetrysvc-by3p.smartscreen.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "us.vortex-win.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 us.vortex-win.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "v10-win.vortex.data.microsoft.com.akadns.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 v10-win.vortex.data.microsoft.com.akadns.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "v10.events.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 v10.events.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "v10.vortex-win.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 v10.vortex-win.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "v20.vortex-win.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 v20.vortex-win.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "vortex-bn2.metron.live.com.nsatc.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 vortex-bn2.metron.live.com.nsatc.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "vortex-cy2.metron.live.com.nsatc.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 vortex-cy2.metron.live.com.nsatc.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "vortex.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 vortex.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "vortex.data.microsoft.com.akadns.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 vortex.data.microsoft.com.akadns.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "web.vortex.data.microsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 web.vortex.data.microsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "telemetry.remoteapp.windowsazure.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 telemetry.remoteapp.windowsazure.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "static.2mdn.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 static.2mdn.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "b.ads1.msn.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 b.ads1.msn.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "b.ads2.msads.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 b.ads2.msads.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "b.rad.msn.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 b.rad.msn.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tele.trafficmanager.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tele.trafficmanager.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "1beb2a44.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 1beb2a44.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "1q2w3.fun" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 1q2w3.fun>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "1q2w3.me" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 1q2w3.me>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "1.1.1.1" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 1.1.1.1>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "1.1.1.1" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 1.1.1.1>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "1.1.1.1" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 1.1.1.1>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "1.1.1.1" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 1.1.1.1>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "300ca0d0.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 300ca0d0.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "310ca263.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 310ca263.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "320ca3f6.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 320ca3f6.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "330ca589.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 330ca589.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "340ca71c.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 340ca71c.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "360caa42.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 360caa42.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "370cabd5.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 370cabd5.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "3c0cb3b4.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 3c0cb3b4.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "3d0cb547.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 3d0cb547.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "abc.pema.cl" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 abc.pema.cl>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ad-miner.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ad-miner.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adminer.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adminer.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.blue" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.blue>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "api.inwemo.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 api.inwemo.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "azvjudwr.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 azvjudwr.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "baiduccdn1.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 baiduccdn1.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "berserkpl.net.pl" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 berserkpl.net.pl>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "biberukalap.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 biberukalap.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bjorksta.men" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bjorksta.men>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "blockchain.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 blockchain.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "candid.zone" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 candid.zone>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn.adless.io" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn.adless.io>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn.cloudcoins.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn.cloudcoins.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "chainblock.science" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 chainblock.science>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cnhv.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cnhv.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coin-have.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coin-have.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coin-hive.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coin-hive.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinblind.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinblind.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinerra.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinerra.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinhive.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinhive.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinhiveproxy.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinhiveproxy.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinlab.biz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinlab.biz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinnebula.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinnebula.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "crypto-loot.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 crypto-loot.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "crypto-webminer.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 crypto-webminer.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "crypto.csgocpu.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 crypto.csgocpu.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cryptoloot.pro" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cryptoloot.pro>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cryweb.github.io" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cryweb.github.io>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "crywebber.github.io" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 crywebber.github.io>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "dev.cryptobara.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 dev.cryptobara.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "digger.cryptobara.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 digger.cryptobara.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "flare-analytics.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 flare-analytics.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "go.megabanners.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 go.megabanners.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "gridiogrid.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 gridiogrid.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "gus.host" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 gus.host>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hive.tubetitties.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hive.tubetitties.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hodlers.party" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hodlers.party>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hodling.faith" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hodling.faith>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "host.d-ns.ga" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 host.d-ns.ga>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "intactoffers.club" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 intactoffers.club>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "jroqvbvw.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 jroqvbvw.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "jsccnn.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 jsccnn.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "jscdndel.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 jscdndel.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "jyhfuqoh.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 jyhfuqoh.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "kdowqlpt.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 kdowqlpt.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "load.jsecoin.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 load.jsecoin.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "m.anyfiles.ovh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 m.anyfiles.ovh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mine.nahnoji.cz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mine.nahnoji.cz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mine.torrent.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mine.torrent.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minemytraffic.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minemytraffic.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner.cryptobara.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner.cryptobara.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner.nablabee.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner.nablabee.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner.pr0gramm.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner.pr0gramm.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minero-proxy-01.now.sh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minero-proxy-01.now.sh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minero-proxy-02.now.sh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minero-proxy-02.now.sh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minero-proxy-03.now.sh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minero-proxy-03.now.sh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minero.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minero.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "monerominer.rocks" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 monerominer.rocks>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "noblock.pro" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 noblock.pro>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "okeyletsgo.ml" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 okeyletsgo.ml>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "papoto.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 papoto.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "playerassets.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 playerassets.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ppoi.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ppoi.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "projectpoi.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 projectpoi.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "reservedoffers.club" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 reservedoffers.club>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "rocks.io" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 rocks.io>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "smectapop12.pl" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 smectapop12.pl>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sparnove.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sparnove.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "static.sparechange.io" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 static.sparechange.io>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tokyodrift.ga" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tokyodrift.ga>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webassembly.stream" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webassembly.stream>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webmine.cz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webmine.cz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webmine.pro" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webmine.pro>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webminepool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webminepool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webminepool.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webminepool.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "wsp.marketgid.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 wsp.marketgid.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.cryptonoter.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.cryptonoter.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.freecontent.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.freecontent.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.mutuza.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.mutuza.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.sparechange.io" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.sparechange.io>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "xbasfbno.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 xbasfbno.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cnhv.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cnhv.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coin-hive.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coin-hive.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinhive.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinhive.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "authedmine.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 authedmine.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "api.jsecoin.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 api.jsecoin.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "load.jsecoin.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 load.jsecoin.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "server.jsecoin.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 server.jsecoin.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner.pr0gramm.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner.pr0gramm.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minemytraffic.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minemytraffic.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "crypto-loot.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 crypto-loot.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cryptaloot.pro" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cryptaloot.pro>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cryptoloot.pro" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cryptoloot.pro>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinerra.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinerra.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coin-have.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coin-have.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minero.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minero.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minero-proxy-01.now.sh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minero-proxy-01.now.sh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minero-proxy-02.now.sh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minero-proxy-02.now.sh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minero-proxy-03.now.sh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minero-proxy-03.now.sh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "api.inwemo.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 api.inwemo.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "rocks.io" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 rocks.io>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adminer.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adminer.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ad-miner.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ad-miner.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "jsccnn.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 jsccnn.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "jscdndel.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 jscdndel.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinhiveproxy.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinhiveproxy.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinblind.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinblind.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinnebula.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinnebula.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "monerominer.rocks" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 monerominer.rocks>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn.cloudcoins.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn.cloudcoins.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinlab.biz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinlab.biz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "go.megabanners.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 go.megabanners.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "baiduccdn1.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 baiduccdn1.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "wsp.marketgid.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 wsp.marketgid.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "papoto.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 papoto.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "flare-analytics.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 flare-analytics.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.sparechange.io" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.sparechange.io>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "static.sparechange.io" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 static.sparechange.io>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner.nablabee.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner.nablabee.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "m.anyfiles.ovh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 m.anyfiles.ovh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.coinimp.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.coinimp.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.coinimp.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.coinimp.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.freecontent.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.freecontent.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.freecontent.date" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.freecontent.date>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.freecontent.faith" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.freecontent.faith>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.freecontent.loan" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.freecontent.loan>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.freecontent.racing" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.freecontent.racing>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.freecontent.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.freecontent.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.blockchained.party" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.blockchained.party>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.cryptonoter.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.cryptonoter.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.mutuza.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.mutuza.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "crypto-webminer.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 crypto-webminer.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn.adless.io" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn.adless.io>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hegrinhar.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hegrinhar.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "verresof.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 verresof.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hemnes.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hemnes.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tidafors.xyz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tidafors.xyz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "moneone.ga" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 moneone.ga>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "plexcoin.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 plexcoin.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.monkeyminer.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.monkeyminer.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "go2.mercy.ga" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 go2.mercy.ga>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinpirate.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinpirate.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "d.cpufan.club" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 d.cpufan.club>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "krb.devphp.org.ua" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 krb.devphp.org.ua>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "nfwebminer.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 nfwebminer.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cfcdist.gdn" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cfcdist.gdn>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "node.cfcdist.gdn" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 node.cfcdist.gdn>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webxmr.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webxmr.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "xmr.mining.best" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 xmr.mining.best>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webminepool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webminepool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webminepool.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webminepool.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hive.tubetitties.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hive.tubetitties.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "playerassets.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 playerassets.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tokyodrift.ga" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tokyodrift.ga>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webassembly.stream" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webassembly.stream>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.webassembly.stream" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.webassembly.stream>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "okeyletsgo.ml" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 okeyletsgo.ml>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "candid.zone" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 candid.zone>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webmine.pro" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webmine.pro>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "andlache.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 andlache.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bablace.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bablace.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bewaslac.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bewaslac.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "biberukalap.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 biberukalap.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bowithow.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bowithow.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "butcalve.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 butcalve.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "evengparme.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 evengparme.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "gridiogrid.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 gridiogrid.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hatcalter.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hatcalter.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "kedtise.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 kedtise.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ledinund.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ledinund.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "nathetsof.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 nathetsof.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "renhertfo.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 renhertfo.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "rintindown.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 rintindown.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sparnove.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sparnove.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "witthethim.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 witthethim.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "1q2w3.fun" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 1q2w3.fun>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "1q2w3.me" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 1q2w3.me>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bjorksta.men" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bjorksta.men>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "crypto.csgocpu.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 crypto.csgocpu.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "noblock.pro" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 noblock.pro>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner.cryptobara.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner.cryptobara.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "digger.cryptobara.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 digger.cryptobara.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "dev.cryptobara.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 dev.cryptobara.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "reservedoffers.club" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 reservedoffers.club>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mine.torrent.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mine.torrent.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "host.d-ns.ga" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 host.d-ns.ga>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "abc.pema.cl" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 abc.pema.cl>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "js.nahnoji.cz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 js.nahnoji.cz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mine.nahnoji.cz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mine.nahnoji.cz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webmine.cz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webmine.cz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.webmine.cz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.webmine.cz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "intactoffers.club" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 intactoffers.club>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.blue" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.blue>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "smectapop12.pl" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 smectapop12.pl>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "berserkpl.net.pl" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 berserkpl.net.pl>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hodlers.party" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hodlers.party>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hodling.faith" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hodling.faith>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "chainblock.science" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 chainblock.science>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minescripts.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minescripts.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn.minescripts.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn.minescripts.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner.nablabee.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner.nablabee.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "wss.nablabee.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 wss.nablabee.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "clickwith.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 clickwith.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "dronml.ml" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 dronml.ml>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "niematego.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 niematego.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tulip18.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tulip18.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "p.estream.to" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 p.estream.to>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "didnkinrab.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 didnkinrab.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ledhenone.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ledhenone.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "losital.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 losital.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mebablo.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mebablo.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "moonsade.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 moonsade.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "nebabrop.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 nebabrop.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pearno.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pearno.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "rintinwa.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 rintinwa.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "willacrit.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 willacrit.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www2.adfreetv.ch" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www2.adfreetv.ch>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minr.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minr.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "new.minr.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 new.minr.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "test.minr.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 test.minr.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "staticsfs.host" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 staticsfs.host>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn-code.host" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn-code.host>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "g-content.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 g-content.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ad.g-content.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ad.g-content.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn.static-cnt.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn.static-cnt.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cnt.statistic.date" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cnt.statistic.date>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "jquery-uim.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 jquery-uim.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn.jquery-uim.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn.jquery-uim.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn-jquery.host" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn-jquery.host>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "p1.interestingz.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 p1.interestingz.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "kippbeak.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 kippbeak.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pasoherb.gq" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pasoherb.gq>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "axoncoho.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 axoncoho.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "depttake.ga" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 depttake.ga>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "flophous.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 flophous.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pr0gram.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pr0gram.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "authedmine.eu" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 authedmine.eu>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.monero-miner.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.monero-miner.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.datasecu.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.datasecu.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jquery-cdn.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jquery-cdn.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.etzbnfuigipwvs.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.etzbnfuigipwvs.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.terethat.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.terethat.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "freshrefresher.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 freshrefresher.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "api.pzoifaum.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 api.pzoifaum.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ws.pzoifaum.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ws.pzoifaum.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "api.bhzejltg.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 api.bhzejltg.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ws.bhzejltg.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ws.bhzejltg.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "d.cfcnet.top" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 d.cfcnet.top>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "vip.cfcnet.top" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 vip.cfcnet.top>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "eu.cfcnet.top" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 eu.cfcnet.top>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "as.cfcnet.top" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 as.cfcnet.top>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "us.cfcnet.top" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 us.cfcnet.top>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "eu.cfcdist.loan" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 eu.cfcdist.loan>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "as.cfcdist.loan" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 as.cfcdist.loan>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "us.cfcdist.loan" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 us.cfcdist.loan>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "gustaver.ddns.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 gustaver.ddns.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "worker.salon.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 worker.salon.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s2.appelamule.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s2.appelamule.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mepirtedic.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mepirtedic.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn.streambeam.io" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn.streambeam.io>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adzjzewsma.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adzjzewsma.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ffinwwfpqi.gq" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ffinwwfpqi.gq>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ininmacerad.pro" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ininmacerad.pro>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mhiobjnirs.gq" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mhiobjnirs.gq>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "open-hive-server-1.pp.ua" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 open-hive-server-1.pp.ua>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pool.hws.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pool.hws.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pool.etn.spacepools.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pool.etn.spacepools.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "api.aalbbh84.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 api.aalbbh84.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.aymcsx.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.aymcsx.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aeros01.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aeros01.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aeros02.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aeros02.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aeros03.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aeros03.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aeros04.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aeros04.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aeros05.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aeros05.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aeros06.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aeros06.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aeros07.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aeros07.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aeros08.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aeros08.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aeros09.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aeros09.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aeros10.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aeros10.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aeros11.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aeros11.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aeros12.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aeros12.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "npcdn1.now.sh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 npcdn1.now.sh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mxcdn2.now.sh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mxcdn2.now.sh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sxcdn6.now.sh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sxcdn6.now.sh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mxcdn1.now.sh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mxcdn1.now.sh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sxcdn02.now.sh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sxcdn02.now.sh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sxcdn4.now.sh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sxcdn4.now.sh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "jqcdn2.herokuapp.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 jqcdn2.herokuapp.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sxcdn1.herokuapp.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sxcdn1.herokuapp.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sxcdn5.herokuapp.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sxcdn5.herokuapp.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "wpcdn1.herokuapp.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 wpcdn1.herokuapp.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "jqcdn01.herokuapp.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 jqcdn01.herokuapp.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "jqcdn03.herokuapp.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 jqcdn03.herokuapp.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "1q2w3.website" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 1q2w3.website>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "video.videos.vidto.me" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 video.videos.vidto.me>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.play1.videos.vidto.me" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.play1.videos.vidto.me>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "playe.vidto.se" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 playe.vidto.se>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "video.streaming.estream.to" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 video.streaming.estream.to>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "eth-pocket.de" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 eth-pocket.de>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "xvideosharing.site" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 xvideosharing.site>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bestcoinsignals.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bestcoinsignals.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "eucsoft.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 eucsoft.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "traviilo.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 traviilo.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "wasm24.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 wasm24.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "xmr.cool" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 xmr.cool>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "api.netflare.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 api.netflare.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdnjs.cloudflane.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdnjs.cloudflane.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.cloudflane.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.cloudflane.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "clgserv.pro" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 clgserv.pro>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hide.ovh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hide.ovh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "graftpool.ovh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 graftpool.ovh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "encoding.ovh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 encoding.ovh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "altavista.ovh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 altavista.ovh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "scaleway.ovh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 scaleway.ovh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "nexttime.ovh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 nexttime.ovh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "never.ovh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 never.ovh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "2giga.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 2giga.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webminerpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webminerpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minercry.pt" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minercry.pt>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adplusplus.fr" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adplusplus.fr>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ethtrader.de" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ethtrader.de>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "gobba.myeffect.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 gobba.myeffect.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bauersagtnein.myeffect.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bauersagtnein.myeffect.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "besti.ga" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 besti.ga>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "jurty.ml" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 jurty.ml>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "jurtym.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 jurtym.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mfio.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mfio.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mwor.gq" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mwor.gq>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "oei1.gq" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 oei1.gq>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "wordc.ga" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 wordc.ga>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "berateveng.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 berateveng.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ctlrnwbv.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ctlrnwbv.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ermaseuc.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ermaseuc.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "kdmkauchahynhrs.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 kdmkauchahynhrs.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "uoldid.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 uoldid.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jqrcdn.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jqrcdn.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jqassets.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jqassets.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jqcdn.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jqcdn.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jquerrycdn.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jquerrycdn.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jqwww.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jqwww.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "lightminer.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 lightminer.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.lightminer.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.lightminer.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "browsermine.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 browsermine.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "api.browsermine.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 api.browsermine.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "dl.browsermine.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 dl.browsermine.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mlib.browsermine.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mlib.browsermine.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minr.browsermine.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minr.browsermine.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "static.browsermine.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 static.browsermine.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ws.browsermine.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ws.browsermine.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bmst.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bmst.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bmnr.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bmnr.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bmcm.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bmcm.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bmcm.ml" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bmcm.ml>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "videoplayer2.xyz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 videoplayer2.xyz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.video2.stream.vidzi.tv" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.video2.stream.vidzi.tv>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "001.0x1f4b0.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 001.0x1f4b0.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "002.0x1f4b0.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 002.0x1f4b0.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "003.0x1f4b0.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 003.0x1f4b0.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "004.0x1f4b0.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 004.0x1f4b0.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "005.0x1f4b0.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 005.0x1f4b0.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "006.0x1f4b0.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 006.0x1f4b0.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "007.0x1f4b0.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 007.0x1f4b0.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "008.0x1f4b0.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 008.0x1f4b0.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "authedwebmine.cz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 authedwebmine.cz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.authedwebmine.cz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.authedwebmine.cz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "skencituer.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 skencituer.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "site.flashx.cc" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 site.flashx.cc>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play1.flashx.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play1.flashx.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play2.flashx.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play2.flashx.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play4.flashx.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play4.flashx.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play5.flashx.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play5.flashx.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "js.vidoza.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 js.vidoza.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mm.zubovskaya-banya.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mm.zubovskaya-banya.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mysite.irkdsu.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mysite.irkdsu.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.estream.nu" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.estream.nu>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.estream.to" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.estream.to>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.estream.xyz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.estream.xyz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.play.estream.nu" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.play.estream.nu>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.play.estream.to" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.play.estream.to>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.play.estream.xyz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.play.estream.xyz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.tainiesonline.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.tainiesonline.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.vidzi.tv" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.vidzi.tv>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.pampopholf.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.pampopholf.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s3.pampopholf.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s3.pampopholf.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.malictuiar.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.malictuiar.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s3.malictuiar.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s3.malictuiar.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.play.tainiesonline.stream" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.play.tainiesonline.stream>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ocean2.authcaptcha.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ocean2.authcaptcha.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "rock2.authcaptcha.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 rock2.authcaptcha.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "stone2.authcaptcha.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 stone2.authcaptcha.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sass2.authcaptcha.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sass2.authcaptcha.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sea2.authcaptcha.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sea2.authcaptcha.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.flowplayer.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.flowplayer.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.pc.belicimo.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.pc.belicimo.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.power.tainiesonline.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.power.tainiesonline.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.s01.vidtodo.pro" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.s01.vidtodo.pro>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "wm.yololike.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 wm.yololike.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.mix.kinostuff.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.mix.kinostuff.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.on.animeteatr.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.on.animeteatr.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.mine.gay-hotvideo.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.mine.gay-hotvideo.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.www.intellecthosting.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.www.intellecthosting.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mytestminer.xyz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mytestminer.xyz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.vb.wearesaudis.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.vb.wearesaudis.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "flowplayer.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 flowplayer.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s2.flowplayer.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s2.flowplayer.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s3.flowplayer.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s3.flowplayer.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "thersprens.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 thersprens.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s2.thersprens.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s2.thersprens.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s3.thersprens.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s3.thersprens.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "gramombird.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 gramombird.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.gramombird.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.gramombird.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ugmfvqsu.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ugmfvqsu.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bsyauqwerd.party" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bsyauqwerd.party>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ccvwtdtwyu.trade" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ccvwtdtwyu.trade>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "baywttgdhe.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 baywttgdhe.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pdheuryopd.loan" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pdheuryopd.loan>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "iaheyftbsn.review" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 iaheyftbsn.review>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "djfhwosjck.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 djfhwosjck.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "najsiejfnc.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 najsiejfnc.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "zndaowjdnf.stream" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 zndaowjdnf.stream>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "yqaywudifu.date" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 yqaywudifu.date>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "malictuiar.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 malictuiar.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "proofly.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 proofly.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "zminer.zaloapp.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 zminer.zaloapp.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "vkcdnservice.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 vkcdnservice.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "dexim.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 dexim.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "acbp0020171456.page.tl" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 acbp0020171456.page.tl>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "vuryua.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 vuryua.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minexmr.stream" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minexmr.stream>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "gitgrub.pro" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 gitgrub.pro>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "d8acddffe978b5dfcae6.date" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 d8acddffe978b5dfcae6.date>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "eth-pocket.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 eth-pocket.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "autologica.ga" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 autologica.ga>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "whysoserius.club" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 whysoserius.club>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aster18cdn.nl" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aster18cdn.nl>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "nerohut.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 nerohut.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "gnrdomimplementation.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 gnrdomimplementation.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pon.ewtuyytdf45.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pon.ewtuyytdf45.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hhb123.tk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hhb123.tk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "dzizsih.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 dzizsih.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "nddmcconmqsy.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 nddmcconmqsy.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "silimbompom.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 silimbompom.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "unrummaged.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 unrummaged.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "fruitice.realnetwrk.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 fruitice.realnetwrk.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "synconnector.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 synconnector.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "toftofcal.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 toftofcal.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "gasolina.ml" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 gasolina.ml>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "8jd2lfsq.me" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 8jd2lfsq.me>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "afflow.18-plus.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 afflow.18-plus.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "afminer.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 afminer.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aservices.party" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aservices.party>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "becanium.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 becanium.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "brominer.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 brominer.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn-analytics.pl" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn-analytics.pl>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn.static-cnt.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn.static-cnt.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cloudcdn.gdn" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cloudcdn.gdn>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coin-service.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coin-service.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinpot.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinpot.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinrail.io" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinrail.io>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "etacontent.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 etacontent.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I " exdynsrv.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 exdynsrv.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "formulawire.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 formulawire.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "go.bestmobiworld.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 go.bestmobiworld.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "goldoffer.online" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 goldoffer.online>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hallaert.online" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hallaert.online>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hashing.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hashing.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "igrid.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 igrid.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "laserveradedomaina.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 laserveradedomaina.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "machieved.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 machieved.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "nametraff.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 nametraff.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "offerreality.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 offerreality.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ogrid.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ogrid.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "panelsave.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 panelsave.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "party-vqgdyvoycc.now.sh" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 party-vqgdyvoycc.now.sh>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pertholin.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pertholin.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "premiumstats.xyz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 premiumstats.xyz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "serie-vostfr.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 serie-vostfr.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "salamaleyum.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 salamaleyum.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "smartoffer.site" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 smartoffer.site>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "stonecalcom.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 stonecalcom.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "thewhizmarketing.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 thewhizmarketing.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "thewhizproducts.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 thewhizproducts.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "thewise.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 thewise.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "traffic.tc-clicks.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 traffic.tc-clicks.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "vcfs6ip5h6.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 vcfs6ip5h6.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "web.dle-news.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 web.dle-news.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webmining.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webmining.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "wp-monero-miner.de" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 wp-monero-miner.de>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "wtm.monitoringservice.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 wtm.monitoringservice.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "xy.nullrefexcep.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 xy.nullrefexcep.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "yrdrtzmsmt.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 yrdrtzmsmt.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "wss.rand.com.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 wss.rand.com.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.verifier.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.verifier.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jshosting.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jshosting.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jshosting.date" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jshosting.date>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jshosting.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jshosting.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jshosting.faith" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jshosting.faith>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jshosting.loan" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jshosting.loan>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jshosting.party" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jshosting.party>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jshosting.racing" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jshosting.racing>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jshosting.review" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jshosting.review>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jshosting.science" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jshosting.science>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jshosting.stream" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jshosting.stream>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jshosting.trade" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jshosting.trade>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jshosting.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jshosting.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.freecontent.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.freecontent.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.freecontent.party" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.freecontent.party>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.freecontent.review" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.freecontent.review>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.freecontent.science" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.freecontent.science>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.freecontent.stream" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.freecontent.stream>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.freecontent.trade" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.freecontent.trade>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.accountant" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.accountant>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.date" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.date>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.faith" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.faith>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.loan" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.loan>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.party" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.party>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.racing" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.racing>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.review" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.review>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.science" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.science>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.stream" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.stream>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.trade" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.trade>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.hostingcloud.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.hostingcloud.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "minerad.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 minerad.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coin-cube.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coin-cube.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coin-services.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coin-services.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "service4refresh.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 service4refresh.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "money-maker-script.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 money-maker-script.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "money-maker-default.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 money-maker-default.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "de-ner-mi-nis4.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 de-ner-mi-nis4.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "de-nis-ner-mi-5.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 de-nis-ner-mi-5.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "de-mi-nis-ner2.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 de-mi-nis-ner2.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "de-mi-nis-ner.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 de-mi-nis-ner.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mi-de-ner-nis3.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mi-de-ner-nis3.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s2.soodatmish.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s2.soodatmish.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s2.thersprens.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s2.thersprens.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.feesocrald.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.feesocrald.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn1.pebx.pl" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn1.pebx.pl>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.nexioniect.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.nexioniect.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.besstahete.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.besstahete.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s2.myregeneaf.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s2.myregeneaf.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s3.myregeneaf.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s3.myregeneaf.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "reauthenticator.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 reauthenticator.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "rock.reauthenticator.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 rock.reauthenticator.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "serv1swork.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 serv1swork.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "str1kee.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 str1kee.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "f1tbit.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 f1tbit.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "g1thub.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 g1thub.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "swiftmining.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 swiftmining.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cashbeet.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cashbeet.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "wmtech.website" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 wmtech.website>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.notmining.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.notmining.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coinminingonline.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coinminingonline.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "alflying.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 alflying.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "alflying.date" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 alflying.date>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "alflying.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 alflying.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "anybest.host" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 anybest.host>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "anybest.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 anybest.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "anybest.site" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 anybest.site>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "anybest.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 anybest.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "dubester.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 dubester.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "dubester.site" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 dubester.site>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "dubester.space" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 dubester.space>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "flightsy.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 flightsy.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "flightsy.date" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 flightsy.date>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "flightsy.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 flightsy.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "flighty.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 flighty.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "flightzy.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 flightzy.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "flightzy.date" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 flightzy.date>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "flightzy.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 flightzy.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "gettate.date" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 gettate.date>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "gettate.faith" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 gettate.faith>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "gettate.racing" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 gettate.racing>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mighbest.host" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mighbest.host>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mighbest.pw" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mighbest.pw>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mighbest.site" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mighbest.site>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "zymerget.bid" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 zymerget.bid>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "zymerget.date" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 zymerget.date>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "zymerget.faith" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 zymerget.faith>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "zymerget.party" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 zymerget.party>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "zymerget.stream" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 zymerget.stream>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "zymerget.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 zymerget.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "statdynamic.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 statdynamic.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "alpha.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 alpha.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "api.miner.beeppool.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 api.miner.beeppool.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "beatingbytes.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 beatingbytes.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "besocial.online" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 besocial.online>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "beta.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 beta.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bulls.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bulls.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "de1.eu.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 de1.eu.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ethmedialab.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ethmedialab.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "feilding.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 feilding.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "foxton.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 foxton.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ganymed.beeppool.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ganymed.beeppool.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "himatangi.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 himatangi.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "levin.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 levin.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mine.terorie.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mine.terorie.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-1.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-1.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-10.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-10.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-11.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-11.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-12.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-12.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-13.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-13.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-14.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-14.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-15.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-15.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-16.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-16.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-17.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-17.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-18.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-18.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-19.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-19.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-2.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-2.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-3.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-3.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-4.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-4.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-5.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-5.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-6.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-6.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-7.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-7.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-8.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-8.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-9.team.nimiq.agency" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-9.team.nimiq.agency>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-deu-1.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-deu-1.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-deu-2.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-deu-2.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-deu-3.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-deu-3.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-deu-4.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-deu-4.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-deu-5.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-deu-5.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-deu-6.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-deu-6.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-deu-7.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-deu-7.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner-deu-8.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner-deu-8.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner.beeppool.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner.beeppool.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mon-deu-1.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mon-deu-1.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mon-deu-2.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mon-deu-2.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mon-deu-3.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mon-deu-3.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mon-fra-1.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mon-fra-1.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mon-fra-2.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mon-fra-2.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mon-gbr-1.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mon-gbr-1.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "nimiq.terorie.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 nimiq.terorie.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "nimiqtest.ml" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 nimiqtest.ml>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ninaning.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ninaning.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "node.alpha.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 node.alpha.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "node.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 node.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "nodeb.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 nodeb.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "nodeone.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 nodeone.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "proxy-can-1.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 proxy-can-1.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "proxy-deu-1.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 proxy-deu-1.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "proxy-deu-2.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 proxy-deu-2.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "proxy-fra-1.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 proxy-fra-1.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "proxy-fra-2.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 proxy-fra-2.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "proxy-fra-3.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 proxy-fra-3.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "proxy-gbr-1.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 proxy-gbr-1.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "proxy-gbr-2.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 proxy-gbr-2.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "proxy-pol-1.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 proxy-pol-1.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "proxy-pol-2.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 proxy-pol-2.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "script.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 script.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-1.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-1.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-1.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-1.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-1.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-1.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-10.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-10.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-10.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-10.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-10.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-10.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-11.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-11.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-11.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-11.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-11.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-11.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-12.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-12.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-12.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-12.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-12.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-12.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-13.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-13.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-13.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-13.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-13.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-13.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-14.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-14.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-14.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-14.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-14.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-14.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-15.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-15.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-15.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-15.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-15.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-15.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-16.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-16.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-16.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-16.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-16.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-16.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-17.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-17.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-17.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-17.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-17.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-17.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-18.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-18.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-18.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-18.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-18.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-18.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-19.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-19.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-19.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-19.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-19.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-19.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-2.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-2.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-2.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-2.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-2.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-2.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-20.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-20.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-20.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-20.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-20.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-20.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-3.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-3.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-3.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-3.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-3.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-3.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-4.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-4.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-4.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-4.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-4.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-4.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-5.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-5.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-5.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-5.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-5.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-5.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-6.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-6.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-6.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-6.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-6.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-6.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-7.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-7.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-7.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-7.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-7.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-7.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-8.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-8.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-8.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-8.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-8.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-8.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-9.nimiq-network.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-9.nimiq-network.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-9.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-9.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-9.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-9.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-can-1.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-can-1.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-can-2.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-can-2.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-deu-1.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-deu-1.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-deu-2.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-deu-2.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-deu-3.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-deu-3.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-deu-4.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-deu-4.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-fra-1.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-fra-1.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-fra-2.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-fra-2.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-fra-3.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-fra-3.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-fra-4.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-fra-4.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-fra-5.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-fra-5.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-fra-6.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-fra-6.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-gbr-1.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-gbr-1.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-gbr-2.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-gbr-2.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-gbr-3.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-gbr-3.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-gbr-4.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-gbr-4.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-pol-1.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-pol-1.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-pol-2.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-pol-2.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-pol-3.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-pol-3.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed-pol-4.inf.nimiq.network" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed-pol-4.inf.nimiq.network>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "seed1.sushipool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 seed1.sushipool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "shannon.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 shannon.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sunnimiq.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sunnimiq.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sunnimiq1.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sunnimiq1.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sunnimiq2.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sunnimiq2.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sunnimiq3.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sunnimiq3.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sunnimiq4.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sunnimiq4.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sunnimiq5.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sunnimiq5.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sunnimiq6.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sunnimiq6.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tokomaru.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tokomaru.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "whanganui.nimiqpool.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 whanganui.nimiqpool.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.besocial.online" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.besocial.online>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "miner.nimiq.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 miner.nimiq.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "jscoinminer.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 jscoinminer.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.jscoinminer.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.jscoinminer.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.tercabilis.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.tercabilis.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "play.istlandoll.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 play.istlandoll.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s01.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s01.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s02.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s02.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s03.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s03.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s04.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s04.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s05.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s05.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s06.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s06.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s07.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s07.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s08.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s08.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s09.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s09.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s10.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s10.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s100.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s100.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s11.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s11.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s12.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s12.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s13.hostcontent.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s13.hostcontent.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "binarybusiness.de" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 binarybusiness.de>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bitcoin-pay.eu" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bitcoin-pay.eu>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cloud-miner.de" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cloud-miner.de>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cloud-miner.eu" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cloud-miner.eu>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "easyhash.de" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 easyhash.de>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "srcip.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 srcip.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "srcips.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 srcips.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "4967133.fls.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 4967133.fls.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "6498008.fls.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 6498008.fls.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aax-us-east.amazon-adsystem.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aax-us-east.amazon-adsystem.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "aax.amazon-adsystem.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 aax.amazon-adsystem.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ad-apac.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ad-apac.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ad-emea.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ad-emea.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ad-g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ad-g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ad.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ad.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ad.mo.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ad.mo.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ad.pl.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ad.pl.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ad.sg.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ad.sg.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ad.uk.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ad.uk.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adclick.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adclick.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adman.gr" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adman.gr>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "admarketing.yahoo.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 admarketing.yahoo.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "admarvel.s3.amazonaws.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 admarvel.s3.amazonaws.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "admedia.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 admedia.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "admicro1.vcmedia.vn" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 admicro1.vcmedia.vn>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "admicro2.vcmedia.vn" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 admicro2.vcmedia.vn>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "admitad.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 admitad.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "admixer.co.kr" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 admixer.co.kr>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "admixer.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 admixer.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "admob.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 admob.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "admulti.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 admulti.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adnxs.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adnxs.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adobesupportnumber.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adobesupportnumber.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adocean.pl" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adocean.pl>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adonly.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adonly.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adotsolution.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adotsolution.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adotube.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adotube.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adprotected.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adprotected.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adpublisher.s3.amazonaws.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adpublisher.s3.amazonaws.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adquota.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adquota.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads-twitter.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads-twitter.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.ad2iction.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.ad2iction.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.admoda.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.admoda.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.aerserv.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.aerserv.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.easy-ads.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.easy-ads.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.facebook.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.facebook.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.fotoable.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.fotoable.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.glispa.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.glispa.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.linkedin.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.linkedin.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.marvel.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.marvel.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.matomymobile.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.matomymobile.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.mediaforge.com.edgekey.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.mediaforge.com.edgekey.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.midatlantic.aaa.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.midatlantic.aaa.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.mobilefuse.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.mobilefuse.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.mobilityware.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.mobilityware.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.mobvertising.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.mobvertising.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.mopub.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.mopub.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.n-ws.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.n-ws.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.ookla.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.ookla.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.pdbarea.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.pdbarea.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.pinger.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.pinger.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.pinterest.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.pinterest.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.pubmatic.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.pubmatic.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.reddit" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.reddit>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.reward.rakuten.jp" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.reward.rakuten.jp>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.taptapnetworks.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.taptapnetworks.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.tremorhub.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.tremorhub.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.xlxtra.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.xlxtra.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.yahoo.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.yahoo.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads.youtube.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads.youtube.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ads2.contentabc.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ads2.contentabc.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adsafeprotected.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adsafeprotected.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adsame.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adsame.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adscale.de" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adscale.de>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adsee.jp" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adsee.jp>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adserver.goforandroid.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adserver.goforandroid.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adserver.kimia.es" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adserver.kimia.es>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adserver.mobillex.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adserver.mobillex.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adserver.pandora.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adserver.pandora.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adserver.ubiyoo.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adserver.ubiyoo.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adserver.unityads.unity3d.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adserver.unityads.unity3d.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adservetx.media.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adservetx.media.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adservice.google.co.uk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adservice.google.co.uk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adservice.google.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adservice.google.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adservice.google.ge" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adservice.google.ge>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adservice.google.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adservice.google.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adservice.google.ga" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adservice.google.ga>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adservice.google.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adservice.google.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adshost2.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adshost2.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adsmo.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adsmo.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adsmoloco.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adsmoloco.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adsniper.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adsniper.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adspirit.de" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adspirit.de>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adspynet.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adspynet.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adsrvmedia.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adsrvmedia.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adsrvr.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adsrvr.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adsymptotic.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adsymptotic.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adtaily.pl" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adtaily.pl>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adtech.de" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adtech.de>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adtilt.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adtilt.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adtrack.king.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adtrack.king.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adultadworld.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adultadworld.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adups.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adups.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adv.mxmcdn.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adv.mxmcdn.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adversal.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adversal.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adverticum.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adverticum.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "advertise.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 advertise.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "advertising.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 advertising.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "advertur.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 advertur.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "advombat.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 advombat.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adwhirl.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adwhirl.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adwired.mobi" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adwired.mobi>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adwods.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adwods.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adx.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adx.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adz.mobi" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adz.mobi>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adzerk.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adzerk.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adzmedia.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adzmedia.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adzmobi.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adzmobi.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "adzworld.in" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 adzworld.in>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "affinity.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 affinity.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "affiz.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 affiz.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "agile-support.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 agile-support.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "airpush.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 airpush.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "almancakurslari.gen.tr" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 almancakurslari.gen.tr>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "altitude-arena.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 altitude-arena.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "am15.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 am15.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amazing-your-prize86.loan" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amazing-your-prize86.loan>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amazon-adsystem.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amazon-adsystem.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amazoncareers.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amazoncareers.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amazoncash.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amazoncash.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amazoncash.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amazoncash.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amazonfromhome.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amazonfromhome.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amazongigs.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amazongigs.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amazonhiring.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amazonhiring.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amazonmoney.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amazonmoney.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amazonprofits.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amazonprofits.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amazonprofits.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amazonprofits.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amazonrecruiter.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amazonrecruiter.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amazonwealth.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amazonwealth.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amazonwork.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amazonwork.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amedi.cl" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amedi.cl>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "americageekpayment.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 americageekpayment.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "americageeks.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 americageeks.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amoad.com>" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amoad.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amobee.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amobee.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "amptrack.dailymail.c" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 amptrack.dailymail.co.uk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.brave.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.brave.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.facebook.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.facebook.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.ff.avast.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.ff.avast.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.google.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.google.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.libertymutual.com.edgekey.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.libertymutual.com.edgekey.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.modul.ac.at" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.modul.ac.at>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.pinterest.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.pinterest.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.pointdrive.linkedin.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.pointdrive.linkedin.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.query.yahoo.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.query.yahoo.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.twitter.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.twitter.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "analytics.yahoo.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 analytics.yahoo.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "andomedia.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 andomedia.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "api.appfireworks.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 api.appfireworks.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "api.fusepowered.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 api.fusepowered.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "api.kiip.me" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 api.kiip.me>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "api.leadbolt.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 api.leadbolt.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "api.usebutton.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 api.usebutton.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "app-measurement.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 app-measurement.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "app-trackings.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 app-trackings.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "app.adjust.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 app.adjust.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "app.link" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 app.link>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "appads.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 appads.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "appclick.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 appclick.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "appleforsystem.ga" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 appleforsystem.ga>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "appmetrica.yandex.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 appmetrica.yandex.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "appscase.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 appscase.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "banners.klm.com.edgekey.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 banners.klm.com.edgekey.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "basecrew.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 basecrew.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "beacon.clickequations.net.edgekey.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 beacon.clickequations.net.edgekey.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "beacon.eb-collector.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 beacon.eb-collector.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "beacons.gcp.gvt2.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 beacons.gcp.gvt2.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "beacons.gvt2.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 beacons.gvt2.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "beacons2.gvt2.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 beacons2.gvt2.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "beacons3.gvt2.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 beacons3.gvt2.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "beacons4.gvt2.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 beacons4.gvt2.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "beacons5.gvt2.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 beacons5.gvt2.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "becoquin.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 becoquin.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bid.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bid.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "biokamakozmetik.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 biokamakozmetik.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "bloggingfornetworking.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 bloggingfornetworking.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "branch.io" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 branch.io>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "brotherprintersupportphonenumber.co.uk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 brotherprintersupportphonenumber.co.uk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "c.aaxads.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 c.aaxads.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "c.amazon-adsystem.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 c.amazon-adsystem.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdex.mu" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdex.mu>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdn.doublesclick.me" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdn.doublesclick.me>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cdnjs.cloudflare.com.cdn.cloudflare.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cdnjs.cloudflare.com.cdn.cloudflare.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cesid.com.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cesid.com.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "check-testingyourprize16.live" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 check-testingyourprize16.live>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "chiropractic-wellness.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 chiropractic-wellness.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "classyleague.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 classyleague.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "clickandflirt.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 clickandflirt.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "client-event-reporter.twitch.tv" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 client-event-reporter.twitch.tv>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cm.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cm.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "coin-hive.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 coin-hive.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "combee84.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 combee84.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "countess.twitch.tv" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 countess.twitch.tv>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "crash.discordapp.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 crash.discordapp.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "crash.steampowered.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 crash.steampowered.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "cum.fr" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 cum.fr>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "d2v02itv0y9u9t.cloudfront.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 d2v02itv0y9u9t.cloudfront.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "d355fqgqddpk8.cloudfront.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 d355fqgqddpk8.cloudfront.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "digitechinfosolutions.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 digitechinfosolutions.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "download4.co" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 download4.co>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "driverupdate.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 driverupdate.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "dunmebach.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 dunmebach.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "easyads.bg" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 easyads.bg>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "easydownloadnow.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 easydownloadnow.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "economylube.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 economylube.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "errorconnect.webcam" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 errorconnect.webcam>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "euyexxwe.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 euyexxwe.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "events.gfe.nvidia.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 events.gfe.nvidia.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "events.redditmedia.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 events.redditmedia.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "fasterpropertybuyers.co.uk" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 fasterpropertybuyers.co.uk>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "fastframe.com.br" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 fastframe.com.br>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "fgsmjjpn.top" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 fgsmjjpn.top>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "firebaselogging.googleapis.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 firebaselogging.googleapis.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "flirt.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 flirt.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "forchaklaws.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 forchaklaws.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "format557-info.ml" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 format557-info.ml>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "freshmarketer.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 freshmarketer.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "geniegamer.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 geniegamer.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ghochv3eng.trafficmanager.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ghochv3eng.trafficmanager.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "gmil.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 gmil.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "google-analytics.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 google-analytics.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "googleads.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 googleads.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "googleads4.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 googleads4.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "googleanalytics.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 googleanalytics.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "googlesyndication.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 googlesyndication.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "googletagmanager.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 googletagmanager.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "goretail.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 goretail.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "gstaticadssl.l.google.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 gstaticadssl.l.google.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "harvestbiblefellowship.us" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 harvestbiblefellowship.us>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "heshimed.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 heshimed.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hostedocsp.globalsign.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hostedocsp.globalsign.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "hotmailcustomersupport.com.au" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 hotmailcustomersupport.com.au>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "i-mobile.co.jp" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 i-mobile.co.jp>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "i-vengo.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 i-vengo.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "i.skimresources.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 i.skimresources.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ia-tracker.fbsbx.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ia-tracker.fbsbx.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "iad.appboy.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 iad.appboy.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "iadsdk.apple.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 iadsdk.apple.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "iamediaserve.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 iamediaserve.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "imasdk.googleapis.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 imasdk.googleapis.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "improving.duckduckgo.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 improving.duckduckgo.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "incoming.telemetry.mozilla.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 incoming.telemetry.mozilla.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "infolinks.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 infolinks.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "inmobi.cn" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 inmobi.cn>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "inmobi.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 inmobi.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "inmobi.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 inmobi.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "inmobicdn.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 inmobicdn.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "inmobisdk-a.akamaihd.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 inmobisdk-a.akamaihd.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "inner-active.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 inner-active.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "inner-active.mobi" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 inner-active.mobi>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "innity.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 innity.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "innovid.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 innovid.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "insightexpressai.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 insightexpressai.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "integral-marketing.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 integral-marketing.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "intellitxt.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 intellitxt.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "intermarkets.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 intermarkets.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "internetcareer.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 internetcareer.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "itshurley.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 itshurley.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "jnhosting.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 jnhosting.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "kallohonka.fi" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 kallohonka.fi>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "kipos.xyz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 kipos.xyz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "kurankitabevi.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 kurankitabevi.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "laze35.site" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 laze35.site>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "lb.usemaxserver.de" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 lb.usemaxserver.de>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "log.byteoversea.com.edgekey.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 log.byteoversea.com.edgekey.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "log.pinterest.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 log.pinterest.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "logfiles.zoom.us" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 logfiles.zoom.us>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "lord16.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 lord16.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mads.amazon-adsystem.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mads.amazon-adsystem.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mail-ads.google.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mail-ads.google.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "malengotours.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 malengotours.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "matjournal.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 matjournal.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "metrics.advisorchannel.com.edgekey.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 metrics.advisorchannel.com.edgekey.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "metrics.asos.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 metrics.asos.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "metrics.att.com.edgekey.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 metrics.att.com.edgekey.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "metrics.cvshealth.com.edgekey.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 metrics.cvshealth.com.edgekey.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "metrics.dynad.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 metrics.dynad.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "metrics.fedex.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 metrics.fedex.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "muonpreux.review" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 muonpreux.review>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "myphonesupport.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 myphonesupport.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "mytilene.fr" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 mytilene.fr>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "myway.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 myway.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "n4403ad.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 n4403ad.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "notify.bugsnag.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 notify.bugsnag.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "onatonline.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 onatonline.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "oneclicksupport.info" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 oneclicksupport.info>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "onlinetechsoft.weebly.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 onlinetechsoft.weebly.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "p4-fbm4tfy4du3vk-rsg77dtzm53vwr6k-854535-i1-v6exp3.v4.metric.gstatic.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 p4-fbm4tfy4du3vk-rsg77dtzm53vwr6k-854535-i1-v6exp3.v4.metric.gstatic.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "p4-fbm4tfy4du3vk-rsg77dtzm53vwr6ks-854535-i2-v6exp3.ds.metric.gstatic.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 p4-fbm4tfy4du3vk-rsg77dtzm53vwr6ks-854535-i2-v6exp3.ds.metric.gstatic.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "page-confrim-safe.ml" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 page-confrim-safe.ml>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pagead.googlesyndication.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pagead.googlesyndication.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pagead.l.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pagead.l.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pagead1.googlesyndication.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pagead1.googlesyndication.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pagead2.googlesyndication.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pagead2.googlesyndication.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pagead46.l.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pagead46.l.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pagefair.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pagefair.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "partner.googleadservices.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 partner.googleadservices.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "partner.intentmedia.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 partner.intentmedia.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "partnerad.l.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 partnerad.l.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "partnerearning.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 partnerearning.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "passporttraveleg.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 passporttraveleg.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pcoptimizerpro.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pcoptimizerpro.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "perf-events.cloud.unity3d.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 perf-events.cloud.unity3d.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pflexads.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pflexads.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "phluant.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 phluant.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pixel.ad" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pixel.ad>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pixel.admobclick.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pixel.admobclick.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pixel.facebook.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pixel.facebook.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "platinumphonesupport.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 platinumphonesupport.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ponmile.myjino.ru" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ponmile.myjino.ru>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "pubads.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 pubads.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "public.cloud.unity3d.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 public.cloud.unity3d.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "reportcentral.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 reportcentral.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "rereddit.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 rereddit.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "retailpay.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 retailpay.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "revsherri.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 revsherri.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "rtb2.doubleverify.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 rtb2.doubleverify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "s.amazon-adsystem.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 s.amazon-adsystem.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "saltofearthlightofworld.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 saltofearthlightofworld.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "securepubads.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 securepubads.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sessions.bugsnag.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sessions.bugsnag.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "settings.crashlytics.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 settings.crashlytics.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "slicktimesavers.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 slicktimesavers.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "smetrics.midatlantic.aaa.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 smetrics.midatlantic.aaa.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "smmknight.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 smmknight.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "spicychats.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 spicychats.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "sporthome.cl" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 sporthome.cl>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ssl.google-analytics.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ssl.google-analytics.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "st-n.ads1-adnow.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 st-n.ads1-adnow.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "static.ads-twitter.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 static.ads-twitter.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "static.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 static.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "stats.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 stats.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "stats.mediaforge.com.edgekey.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 stats.mediaforge.com.edgekey.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "stats.wp.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 stats.wp.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "stockretail.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 stockretail.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "storejobs.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 storejobs.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "strnet24.cf" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 strnet24.cf>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "survey.g.doubleclick.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 survey.g.doubleclick.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tagmanager.google.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tagmanager.google.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "telemetry.gfe.nvidia.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 telemetry.gfe.nvidia.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "theunknowncomposer.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 theunknowncomposer.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "togethernetworks.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 togethernetworks.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tom006.site" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tom006.site>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tps20512.doubleverify.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tps20512.doubleverify.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "track.adform.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 track.adform.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "track.cpatool.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 track.cpatool.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "track.effiliation.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 track.effiliation.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "track.wattpad.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 track.wattpad.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "track.zappos.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 track.zappos.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tracking.admarketplace.net.edgekey.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tracking.admarketplace.net.edgekey.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tracking.bp01.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tracking.bp01.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tracking.epicgames.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tracking.epicgames.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tracking.feedmob.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tracking.feedmob.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tracking.feedperfect.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tracking.feedperfect.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tracking.intl.miui.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tracking.intl.miui.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tracking.klickthru.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tracking.klickthru.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tracking.opencandy.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tracking.opencandy.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "tracking.opencandy.com.s3.amazonaws.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 tracking.opencandy.com.s3.amazonaws.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "trafficjunky.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 trafficjunky.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "trafficsourceoftoplevelcontentsources.download" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 trafficsourceoftoplevelcontentsources.download>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "trovi.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 trovi.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "ulla.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 ulla.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "universalpapercupmachines.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 universalpapercupmachines.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "us04logfiles.zoom.us" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 us04logfiles.zoom.us>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "usa-usage.ime.cootek.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 usa-usage.ime.cootek.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "usa.cc" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 usa.cc>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "uyoutube.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 uyoutube.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "v6analytics.htmedia.in.edgekey.net" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 v6analytics.htmedia.in.edgekey.net>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "video-ad-stats.googlesyndication.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 video-ad-stats.googlesyndication.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "vietbacsecurity.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 vietbacsecurity.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "vm5apis.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 vm5apis.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "wapsort.win" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 wapsort.win>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webserve.xyz" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webserve.xyz>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "webstorejobs.org" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 webstorejobs.org>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www-google-analytics.l.google.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www-google-analytics.l.google.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www-googletagmanager.l.google.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www-googletagmanager.l.google.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.google-analytics.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.google-analytics.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.googletagmanager.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.googletagmanager.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.googletagservices.com" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 www.googletagservices.com>>%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "youtube.cleverads.vn" %WINDIR%\system32\drivers\etc\hosts > NUL 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO %NEWLINE%^0.0.0.0 youtube.cleverads.vn>>%WINDIR%\System32\drivers\etc\hosts

REM Removing any ThreadPriority dwords
FOR /F "eol=E" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services" /S /F "ThreadPriority"^| FINDSTR /V "ThreadPriority"') DO (
REG DELETE "%%a" /F /V "ThreadPriority" >NUL 2>&1
FOR /F "tokens=*" %%z IN ("%%a") DO (
SET STR=%%z
SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\services\=!
SET STR=!STR:\Parameters=!
ECHO Deleting ThreadPriority !STR!
)
)

REM Services IoLatencyCap to 0
FOR /F "eol=E" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services" /S /F "IoLatencyCap"^| FINDSTR /V "IoLatencyCap"') DO (
REG ADD "%%a" /F /V "IoLatencyCap" /T REG_DWORD /d 0 >NUL 2>&1
FOR /F "tokens=*" %%z IN ("%%a") DO (
SET STR=%%z
SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\services\=!
SET STR=!STR:\Parameters=!
ECHO Setting IoLatencyCap !STR!...
)
)

REM Disabling HIPM and DIPM
FOR /F "eol=E" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services" /S /F "EnableHIPM"^| FINDSTR /V "EnableHIPM"') DO (
REG ADD "%%a" /F /V "EnableHIPM" /T REG_DWORD /d 0 >NUL 2>&1
REG ADD "%%a" /F /V "EnableDIPM" /T REG_DWORD /d 0 >NUL 2>&1
FOR /F "tokens=*" %%z IN ("%%a") DO (
SET STR=%%z
SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\=!
ECHO Disabling HIPM and DIPM !STR!...
)
)

REM Disabling all CdpUserSvcs
FOR /F "eol=E" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services" /F "cdpusersvc"') DO (
REG ADD "%%a" /F /V "Start" /T REG_DWORD /d 4 >NUL 2>&1
FOR /F "tokens=*" %%z IN ("%%a") DO (
SET STR=%%z
SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\services\=!
ECHO Disabling !STR!...
)
)

REM Removing adapters off QoS Service...
FOR /F %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services\Psched\Parameters\Adapters"') DO ( 
REG DELETE %%a /F >NUL 2>&1
FOR /F "tokens=*" %%z IN ("%%a") DO (
SET STR=%%z
SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Psched\Parameters\Adapters\=!
ECHO QoS Adapter Fix !STR!...
)
)

REM Disabling QoS and NdisCap
FOR /F "tokens=3*" %%I IN ('REG QUERY "HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkCards" /F "ServiceName" /S^| FINDSTR /I /L "ServiceName"') DO (
FOR /F %%a IN ('REG QUERY "HKLM\System\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}" /F "%%I" /D /E /S^| FINDSTR /I /L "\\Class\\"') DO SET "REGPATH=%%a"
FOR /F "tokens=3*" %%n in ('REG QUERY "!REGPATH!" /V "FilterList"') DO SET newFilterList=%%n
SET newFilterList=!newFilterList:-{B5F4D659-7DAA-4565-8E41-BE220ED60542}=!
SET newFilterList=!newFilterList:-{430BDADD-BAB0-41AB-A369-94B67FA5BE0A}=!
REG QUERY !REGPATH! /V "FilterList" | FINDSTR /I "{B5F4D659-7DAA-4565-8E41-BE220ED60542} {430BDADD-BAB0-41AB-A369-94B67FA5BE0A}" >NUL 2>&1
IF NOT ERRORLEVEL 1 (
REG ADD !REGPATH! /F /V "FilterList" /T REG_MULTI_SZ /d "!newFilterList!" >NUL 2>&1
ECHO QoS and NdisCap Fix
)

REM Fixing Teredo in adapters
FOR /F "tokens=3*" %%n in ('REG QUERY "!REGPATH!" /V "UpperBind"') DO SET newUpperBind=%%n
SET newUpperBind=!newUpperBind:Tcpip6\0=!
SET newUpperBind=!newUpperBind:\0Tcpip6=!
REG QUERY !REGPATH! /V "UpperBind" | FINDSTR /I "Tcpip6" >NUL 2>&1
IF NOT ERRORLEVEL 1 (
REG ADD !REGPATH! /F /V "UpperBind" /T REG_MULTI_SZ /d "!newUpperBind!" >NUL 2>&1
ECHO Teredo Fix
)
)

REM Fixing NetBT in adapters
FOR /F "eol=E" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services\NetBT\Parameters\Interfaces" /S /F "NetbiosOptions"^| FINDSTR /V "NetbiosOptions"') DO (
REG ADD "%%a" /F /V "NetbiosOptions" /T REG_DWORD /d 1 >NUL 2>&1
FOR /F "tokens=*" %%z IN ("%%a") DO (
SET STR=%%z
SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NetBT\Parameters\Interfaces\=!
ECHO NetBT Fix !STR!...
)
)

REM Idle tweaks that might dont even work
FOR /F "eol=E" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Control\Class\{4d36e96c-e325-11ce-bfc1-08002be10318}" /S /F "PowerSettings"') DO (
REG ADD "%%a" /F /V "ConservationIdleTime" /T REG_BINARY /d "FFFFFFFF" >NUL 2>&1
REG ADD "%%a" /F /V "IdlePowerState" /T REG_BINARY /d "FFFFFFFF" >NUL 2>&1
REG ADD "%%a" /F /V "PerformanceIdleTime" /T REG_BINARY /d "FFFFFFFF" >NUL 2>&1
)

REM Tweaking USB Hubs against power saving
FOR /F %%a in ('WMIC PATH Win32_USBHub GET DeviceID^| FINDSTR /L "VID_"') DO (
REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "EnhancedPowerManagementEnabled" /T REG_DWORD /d 0 >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "AllowIdleIrpInD3" /T REG_DWORD /d 0 >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "DeviceSelectiveSuspended" /T REG_DWORD /d 0 >NUL 2>&1	
REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "SelectiveSuspendEnabled" /T REG_DWORD /d 0 >NUL 2>&1	
REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "SelectiveSuspendOn" /T REG_DWORD /d 0 >NUL 2>&1	
REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "fid_D1Latency" /T REG_DWORD /d 0 >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "fid_D2Latency" /T REG_DWORD /d 0 >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /F /V "fid_D3Latency" /T REG_DWORD /d 0 >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\usbflags" /v "fid_D1Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\usbflags" /v "fid_D2Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\usbflags" /v "fid_D3Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
ECHO DisableIdle %%a...
)

REM Tweaking StorPort against power saving
FOR /F "tokens=*" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Enum" /S /F "StorPort"^| FINDSTR /E "StorPort"') DO (
REG ADD "%%a" /F /V "EnableIdlePowerManagement" /T REG_DWORD /d 0 >NUL 2>&1
FOR /F "tokens=*" %%z IN ("%%a") DO (
SET STR=%%z
SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\=!
SET STR=!STR:\Device Parameters\StorPort=!
ECHO DisableIdle !STR!...
)
)

REM Setting %NUMBER_OF_PROCESSORS% cores settings
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Executive" /F /V "AdditionalCriticalWorkerThreads" /T REG_DWORD /d %NUMBER_OF_PROCESSORS% >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Executive" /F /V "AdditionalDelayedWorkerThreads" /T REG_DWORD /d %NUMBER_OF_PROCESSORS% >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /F /V "MaxWorkItems" /T REG_DWORD /d %NUMBER_OF_PROCESSORS% >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" /F /V "MaxThreads" /T REG_DWORD /d %NUMBER_OF_PROCESSORS% >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\I/O System" /F /V "PassiveIntRealTimeWorkerCount" /T REG_DWORD /d %NUMBER_OF_PROCESSORS% >NUL 2>&1
NETSH int ip set global loopbackworkercount = %NUMBER_OF_PROCESSORS% >NUL 2>&1
BCDEDIT /set numproc %NUMBER_OF_PROCESSORS% >NUL 2>&1
BCDEDIT /set maxproc Yes >NUL 2>&1

ECHO Setting TCPOptimizer
NETSH interface teredo set state disabled >NUL 2>&1
NETSH interface 6to4 set state disabled >NUL 2>&1
NETSH int ip set global neighborcachelimit=4096 >NUL 2>&1
NETSH int isatap set state disable >NUL 2>&1
NETSH int tcp set global timestamps=disabled >NUL 2>&1
NETSH int tcp set heuristics disabled >NUL 2>&1
NETSH int tcp set global chimney=disabled >NUL 2>&1
NETSH int tcp set global ecncapability=disabled >NUL 2>&1
NETSH int tcp set global rsc=disabled >NUL 2>&1
NETSH int tcp set security mpp=disabled >NUL 2>&1
NETSH int tcp set security profiles=disabled >NUL 2>&1
NETSH int tcp set global dca=enabled >NUL 2>&1
NETSH int tcp set global rss=enabled >NUL 2>&1
NETSH int tcp set global netdma=enabled >NUL 2>&1
NETSH int tcp set global initialRto=3000 >NUL 2>&1
NETSH int tcp set global nonsackrttresiliency=disabled >NUL 2>&1
NETSH int tcp set global maxsynretransmissions=2 >NUL 2>&1
POWERSHELL Set-NetTCPSetting -SettingName internet -ScalingHeuristics disabled -ErrorAction SilentlyContinue
POWERSHELL Set-NetTCPSetting -SettingName internet -MinRto 300 -ErrorAction SilentlyContinue
REG ADD "HKLM\Software\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "MaxOutstandingSends" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" /v "explorer.exe" /t REG_DWORD /d "10" /f >NUL 2>&1
REG ADD "HKLM\Software\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" /v "iexplore.exe" /t REG_DWORD /d "10" /f >NUL 2>&1
REG ADD "HKLM\Software\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER" /v "explorer.exe" /t REG_DWORD /d "10" /f >NUL 2>&1
REG ADD "HKLM\Software\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER" /v "iexplore.exe" /t REG_DWORD /d "10" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d "16384" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d "16384" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DisableRawSecurity" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DynamicSendBufferDisable" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "FastCopyReceiveThreshold" /t REG_DWORD /d "16384" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d "16384" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "IgnorePushBitOnReceives" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "NonBlockingSendSpecialBuffering" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "CongestionAlgorithm" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "DelayedAckFrequency" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "DelayedAckTicks" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "FastCopyReceiveThreshold" /t REG_DWORD /d "16384" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d "16384" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "8760" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "MultihopSets" /t REG_DWORD /d "15" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "32" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "8760" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MaxSockAddrLength" /t REG_DWORD /d "16" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MinSockAddrLength" /t REG_DWORD /d "16" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "UseDelayedAcceptance" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d "255" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WinSock2\Parameters" /v "Ws2_32NumHandleBuckets" /t REG_DWORD /d "1" /f >NUL 2>&1

for /f "usebackq" %%i in (`reg query HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces`) do (
REG ADD %%i /v "UseZeroBroadcast" /d "0" /t REG_DWORD /f >NUL 2>&1
REG ADD %%i /v "TcpAckFrequency" /d "1" /t REG_DWORD /f >NUL 2>&1
REG ADD %%i /v "TCPNoDelay" /d "1" /t REG_DWORD /f >NUL 2>&1
REG ADD %%i /v "TcpDelAckTicks" /d "0" /t REG_DWORD /f >NUL 2>&1
REG ADD %%i /v "TcpInitialRTT" /d "2" /t REG_DWORD /f >NUL 2>&1
REG ADD %%i /v "TcpWindowSize" /d "43800" /t REG_DWORD /f >NUL 2>&1
REG ADD %%i /v "IPAutoconfigurationEnabled" /d "0" /t REG_DWORD /f >NUL 2>&1
)

ECHO Setting OpenDNS
WMIC nicconfig where ipenabled=true call setdnsserversearchorder ("208.67.222.222","208.67.220.220") >NUL 2>&1

ECHO Setting Ethernet Adapter, Takes time
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*ReceiveBuffers" -RegistryValue "112" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*TransmitBuffers" -RegistryValue "112" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*EEE" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*FlowControl" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*InterruptModeration" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*IPChecksumOffloadIPv4" -RegistryValue "3" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*JumboPacket" -RegistryValue "1415" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*LsoV1IPv4" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*LsoV2IPv4" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*LsoV2IPv6" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*ModernStandbyWoLMagicPacket" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*PMARPOffload" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*PMNSOffload" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*PriorityVLANTag" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*RSS" -RegistryValue "1" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*SpeedDuplex" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*TCPChecksumOffloadIPv4" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*TCPChecksumOffloadIPv6" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*UDPChecksumOffloadIPv4" -RegistryValue "3" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*UDPChecksumOffloadIPv6" -RegistryValue "3" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*WakeOnMagicPacket" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "*WakeOnPattern" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "AdvancedEEE" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "AutoDisableGigabit" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "EEELinkAdvertisement" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "EnableGreenEthernet" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "EnablePME" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "EnableTss" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "GigaLite" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "ITR" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "LogLinkStateEvent" -RegistryValue "51" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "MasterSlave" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "PowerSavingMode" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "ReduceSpeedOnPowerDown" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "S5WakeOnLan" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "ULPMode" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "WaitAutoNegComplete" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "WakeOnLink" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "WakeOnSlot" -RegistryValue "0" -ErrorAction SilentlyContinue
POWERSHELL Set-NetAdapterAdvancedProperty -Name "*" -RegistryKeyword "WolShutdownLinkSpeed" -RegistryValue "2" -ErrorAction SilentlyContinue
POWERSHELL Disable-NetAdapterEncapsulatedPacketTaskOffload -Name "*" -ErrorAction SilentlyContinue
POWERSHELL Disable-NetAdapterIPsecOffload -Name "*" -ErrorAction SilentlyContinue
POWERSHELL Disable-NetAdapterLso -Name "*" -ErrorAction SilentlyContinue
POWERSHELL Disable-NetAdapterPowerManagement -Name "*" -ErrorAction SilentlyContinue
POWERSHELL Disable-NetAdapterRsc -Name "*" -ErrorAction SilentlyContinue
POWERSHELL Set-NetOffloadGlobalSetting -Chimney disabled -ErrorAction SilentlyContinue
POWERSHELL Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing disabled -ErrorAction SilentlyContinue

ECHO Using TCPAutotuning Experimental and CUBIC Congestion
POWERSHELL Set-NetTCPSetting -SettingName internetcustom -AutoTuningLevelLocal experimental -ErrorAction SilentlyContinue

ECHO Adding low TxIntDelay
for /f %%a in ('reg query "HKLM\System\ControlSet001\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /f "PCI\VEN_" /d /s^|Findstr HKEY_') do (
reg add %%a /v "TxIntDelay" /t REG_SZ /d "5" /f >NUL 2>&1
)

ECHO Setting RSS Affinity to core2
POWERSHELL Set-NetAdapterRSS -Name "Ethernet" -BaseProcessorNumber 2

ECHO Disabling Adapter bindings
POWERSHELL Disable-NetAdapterBinding -Name "*" -ComponentID ms_implat -ErrorAction SilentlyContinue
POWERSHELL Disable-NetAdapterBinding -Name "*" -ComponentID ms_lldp -ErrorAction SilentlyContinue
POWERSHELL Disable-NetAdapterBinding -Name "*" -ComponentID ms_lltdio -ErrorAction SilentlyContinue
POWERSHELL Disable-NetAdapterBinding -Name "*" -ComponentID ms_msclient -ErrorAction SilentlyContinue
POWERSHELL Disable-NetAdapterBinding -Name "*" -ComponentID ms_pacer -ErrorAction SilentlyContinue
POWERSHELL Disable-NetAdapterBinding -Name "*" -ComponentID ms_rspndr -ErrorAction SilentlyContinue
POWERSHELL Disable-NetAdapterBinding -Name "*" -ComponentID ms_server -ErrorAction SilentlyContinue

ECHO Disabling Windows Defender
REG ADD "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableIOAVProtection" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\WOW6432Node\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\WOW6432Node\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\WOW6432Node\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d "0" /f >NUL 2>&1
REG DELETE "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SPP\Clients" /f >NUL 2>&1

ECHO Disabling Windows Update
REG ADD "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "BranchReadinessLevel" /t REG_SZ /d "CB" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "DeferFeatureUpdates" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "DeferQualityUpdates" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "ExcludeWUDrivers" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "FeatureUpdatesDeferralInDays" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "IsDeferralIsActive" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "IsWUfBConfigured" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "IsWUfBDualScanActive" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "PolicySources" /t REG_DWORD /d "2" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "BranchReadinessLevel" /t REG_DWORD /d "16" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferFeatureUpdates" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferFeatureUpdatesPeriodInDays" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ManagePreviewBuilds" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ManagePreviewBuildsPolicyValue" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "PauseFeatureUpdatesStartTime" /t REG_SZ /d "" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "DetectionFrequency" /t REG_DWORD /d "20" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "DetectionFrequencyEnabled" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "EnableFeaturedSoftware" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO Disabling Drivers
REG ADD "HKLM\System\CurrentControlSet\Services\AcpiDev" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\acpipagr" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AcpiPmi" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Acpitime" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\amdlog" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\atapi" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\bam" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Beep" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\bowser" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\CAD" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\cdfs" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\CDPUserSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\cdrom" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\CldFlt" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\CLFS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\CmBatt" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\cnghwassist" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\CompositeBus" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\condrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\CSC" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\dam" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\dfsc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\EhStorClass" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\fastfat" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\FileCrypt" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\FileInfo" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\fvevol" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\GraphicsPerfSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Intel(R) SUR QC SAM" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\iorate" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\kdnic" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\KSecPkg" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\LanmanServer" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\lltdio" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\LMS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\luafv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\MEIx64" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\MMCSS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Modem" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\mpsdrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\MpsSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Mrxsmb10" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Mrxsmb20" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\mrxsmb" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\msisadrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\MsLldp" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\mssecflt" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\mssmbios" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NdisCap" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NdisTapi" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NdisVirtualBus" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NdisWan" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Ndproxy" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Ndu" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\ndu" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NetBIOS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NetBT" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Npsvctrig" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Null" /v "Start" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PEAUTH" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Power" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PptpMiniport" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Psched" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\QWAVE" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\QWAVEdrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\RasAcd" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\RasAgileVpn" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Rasl2tp" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\RasPppoe" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\RasSstp" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\rdbss" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\rdpbus" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\rdyboost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\rspndr" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\sermouse" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\spaceport" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\srv2" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Srvnet" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SystemUsageReportSvc_QUEENCREEK" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Tcpip6" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\tcpipreg" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\tdx" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\TPM" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\tunnel" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\udfs" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\UEFI" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\UMBus" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\vdrvroot" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Vid" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Volmgrx" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\vwifibus" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\vwififlt" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Wanarp" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\wanarpv6" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Wcifs" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Wcnfs" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Wdboot" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WdFilter" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WdNisDrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Wdnsfltr" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WindowsTrustedRT" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WindowsTrustedRTProxy" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WmiAcpi" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\ws2ifsl" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\TabletInputService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\TapiSrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WcesComm" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\RapiMgr" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\MpsSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\CertPropSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\hidserv" /F /V "DependOnService" /T REG_MULTI_SZ /d "" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\fvevol" /v "ErrorControl" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Dhcp" /v "DependOnService" /t REG_MULTI_SZ /d "NSI\0Afd" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e967-e325-11ce-bfc1-08002be10318}" /v "LowerFilters" /t REG_MULTI_SZ /d "" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{71a27cdd-812a-11d0-bec7-08002be2092f}" /v "LowerFilters" /t REG_MULTI_SZ /d "" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e96c-e325-11ce-bfc1-08002be10318}" /v "UpperFilters" /t REG_MULTI_SZ /d "" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{6bdd1fc6-810f-11d0-bec7-08002be2092f}" /v "UpperFilters" /t REG_MULTI_SZ /d "" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e967-e325-11ce-bfc1-08002be10318}" /v "LowerFilters" /t REG_MULTI_SZ /d "" /f >NUL 2>&1

ECHO Disabling DMA memory protection and cores isolation
REG ADD "HKLM\Software\Policies\Microsoft\FVE" /v "DisableExternalDMAUnderLock" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "HVCIMATRequired" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO Disabling FSO Globally and GameDVR
REG ADD "HKCU\Software\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKCU\Software\Microsoft\GameBar" /v "GamePanelStartupTipIndex" /t REG_DWORD /d "3" /f >NUL 2>&1
REG ADD "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f >NUL 2>&1
REG ADD "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f >NUL 2>&1
REG ADD "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKCU\System\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "2" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
REG DELETE "HKCU\System\GameConfigStore\Children" /f >NUL 2>&1
REG DELETE "HKCU\System\GameConfigStore\Parents" /f >NUL 2>&1

ECHO Manually disabling FSO in some games
REG ADD "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Riot Games\VALORANT\live\ShooterGame\Binaries\Win64\VALORANT-Win64-Shipping.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE RUNASADMIN" /f >NUL 2>&1

ECHO Disabling driver updates and searching
REG ADD "HKLM\Software\Microsoft\PolicyManager\current\device\Update" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\PolicyManager\default\Update" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\PolicyManager\default\Update\ExcludeWUDriversInQualityUpdate" /v "value" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO Disabling automatic folder type discovery
REG ADD "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "FolderType" /t REG_SZ /d "NotSpecified" /f >NUL 2>&1
REG DELETE "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f >NUL 2>&1

ECHO Disabling shortcut text for shortcuts
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /t REG_BINARY /d "00000000" /f >NUL 2>&1

ECHO Disabling Mouse Keys Keyboard Shortcut
REG ADD "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "186" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Accessibility\MouseKeys" /v "MaximumSpeed" /t REG_SZ /d "40" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Accessibility\MouseKeys" /v "TimeToMaximumSpeed" /t REG_SZ /d "3000" /f >NUL 2>&1

ECHO Disabling Data Execution Prevention
REG ADD "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoDataExecutionPrevention" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\System" /v "DisableHHDEP" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO Disabling WMI
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\AppModel" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Cellcore" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Circular Kernel Context Logger" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\CloudExperienceHostOobe" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DataMarket" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\HolographicDevice" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\iclsClient" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\iclsProxy" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\LwtNetLog" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Mellanox-Kernel" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-AssignedAccess-Trace" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-Setup" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\NBSMBLOGGER" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\PEAuthLog" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\RdrLog" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\ReadyBoot" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SetupPlatform" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SetupPlatformTel" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SocketHeciServer" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SpoolerLogger" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\TCPIPLOGGER" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\TileStore" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Tpm" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\TPMProvisioningService" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\UBPM" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WdiContextLog" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WFP-IPsec Trace" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSession" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSessionRepro" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WinPhoneCritical" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO Disabling Process and Kernel Mitigations
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f >NUL 2>&1


ECHO Network throttling and System responsiveness
::REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f >NUL 2>&1
::REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "10" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f >NUL 2>&1

ECHO Games scheduling
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f >NUL 2>&1

ECHO Hide Language Bar
REG ADD "HKCU\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t REG_DWORD /d "3" /f >NUL 2>&1
REG ADD "HKCU\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKCU\Software\Microsoft\CTF\LangBar" /v "Transparency" /t REG_DWORD /d "255" /f >NUL 2>&1
REG ADD "HKCU\Software\Microsoft\CTF\LangBar" /v "Label" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO Turn Off Enhance Pointer Precision
REG ADD "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "0" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f >NUL 2>&1

ECHO Mouse Pointers Scheme None
REG ADD "HKCU\Control Panel\Cursors" /v "AppStarting" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "Arrow" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "ContactVisualization" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "Crosshair" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "GestureVisualization" /t REG_DWORD /d "31" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "Hand" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "Help" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "IBeam" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "No" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "NWPen" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "Scheme Source" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "SizeAll" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "SizeNESW" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "SizeNS" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "SizeNWSE" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "SizeWE" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "UpArrow" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /v "Wait" /t REG_EXPAND_SZ /d "" /f >NUL 2>&1
REG ADD "HKCU\Control Panel\Cursors" /ve /t REG_SZ /d "" /f >NUL 2>&1

ECHO Homegroup removal From Navigation Pane and File Explorer
REG ADD "HKCR\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489612" /f >NUL 2>&1
REG ADD "HKLM\Software\Wow6432Node\Classes\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489612" /f >NUL 2>&1
REG ADD "HKCR\WOW6432Node\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489444" /f >NUL 2>&1
REG ADD "HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489444" /f >NUL 2>&1

ECHO Control Panel tweaks
REG ADD "HKU\.DEFAULT\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Desktop" /v "MouseWheelRouting" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Mouse" /v "Beep" /t REG_SZ /d "No" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Mouse" /v "ExtendedSounds" /t REG_SZ /d "No" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Sound" /v "Beep" /t REG_SZ /d "no" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Sound" /v "ExtendedSounds" /t REG_SZ /d "no" /f >NUL 2>&1
REM Disable Acessibility keys
REG ADD "HKU\.DEFAULT\Control Panel\Accessibility\HighContrast" /v "Flags" /t REG_SZ /d "0" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "0" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "0" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Accessibility\SoundSentry" /v "Flags" /t REG_SZ /d "0" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "0" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Accessibility\TimeOut" /v "Flags" /t REG_SZ /d "0" /f >NUL 2>&1
REG ADD "HKU\.DEFAULT\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "0" /f >NUL 2>&1

ECHO Power settings tweaks
REG ADD "HKCU\Control Panel\PowerCfg" /v "CurrentPowerPolicy" /t REG_SZ /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Power" /v "PowerSettingProfile" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisabled" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{BDB3AF7A-F67E-4d1e-945D-E2790352BE0A}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{BDB3AF7A-F67E-4d1e-945D-E2790352BE0A}" /v "Operator" /t REG_DWORD /d "2" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{BDB3AF7A-F67E-4d1e-945D-E2790352BE0A}" /v "Type" /t REG_DWORD /d "4157" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{BDB3AF7A-F67E-4d1e-945D-E2790352BE0A}" /v "Value" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{CD9230EE-218E-44b9-8AE5-EE7AA5DAD08F}" /ve /t REG_SZ /d "{db57eb61-1aa2-4906-9396-23e8b8024c32}" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{CD9230EE-218E-44b9-8AE5-EE7AA5DAD08F}" /v "Operator" /t REG_DWORD /d "2" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{CD9230EE-218E-44b9-8AE5-EE7AA5DAD08F}" /v "Type" /t REG_DWORD /d "4106" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}\{F6CC25DF-6E8F-4cf8-A242-B1343F565884}\{CD9230EE-218E-44b9-8AE5-EE7AA5DAD08F}" /v "Value" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab" /v "ACSettingIndex" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab" /v "DCSettingIndex" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO Memory tweaks, fixing memory leaks
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "192" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /t REG_DWORD /d "192" /f >NUL 2>&1

ECHO Enabling Kernel-Managed Memory and disable Meltdown/Spectre patches
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >NUL 2>&1

ECHO Applying hidden ghidra gpu dwords
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "EnablePreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "ComputePreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "EnableMidGfxPreemptionVGPU" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "EnableMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "EnableAsyncMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "EnableSCGMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "EnableMidGfxPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "EnableMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "EnablePreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "ComputePreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "EnableMidGfxPreemptionVGPU" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "EnableMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "EnableAsyncMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "EnableSCGMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "EnableMidGfxPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "EnableMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnablePreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "ComputePreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableMidGfxPreemptionVGPU" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableAsyncMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableSCGMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableMidGfxPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnablePreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ComputePreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableMidGfxPreemptionVGPU" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAsyncMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableSCGMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableMidGfxPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "ComputePreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableMidGfxPreemptionVGPU" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableAsyncMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableSCGMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableMidGfxPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableMidBufferPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableBlockWrite" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "StutterMode" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D_DEF" /t REG_SZ /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D" /t REG_BINARY /d "3100" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ShaderCache" /t REG_BINARY /d "3200" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation_OPTION" /t REG_BINARY /d "3200" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation" /t REG_BINARY /d "3100" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "VSyncControl" /t REG_BINARY /d "3000" /f >NUL 2>&1

ECHO Applying hidden ghidra non-gpu dwords
REG ADD "HKLM\System\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power" /v "PerfCalculateActualUtilization" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power" /v "SleepReliabilityDetailedDiagnostics" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power" /v "QosManagesIdleProcessors" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power" /v "DisableSensorWatchdog" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogProfileOffset" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogPeriod" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO Win32PrioritySeparation = 22
REM Process scheduling to 22dec
REG ADD "HKLM\System\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "22" /f >NUL 2>&1

ECHO MaintenanceDisabled = 1
REM Disabling automatic maintenance
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO HiberbootEnabled = 0
REM Disabling fast startup
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO PowerThrottlingOff = 1
REM Disabling power throttling
REG ADD "HKLM\System\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO FeatureSettingsOverride and Mask = 3
REM Disabling spectre and meltdown
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >NUL 2>&1

ECHO DisablePagingExecutive = 1
REM Disabling paging executive
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO ThemeChangesDesktopIcons = 0
REM Disabling allow themes to change desktop icons
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes" /v "ThemeChangesDesktopIcons" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO ThemeChangesMousePointers = 0
REM Disabling allow themes to change mouse pointers
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes" /v "ThemeChangesMousePointers" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO DisallowShaking = 1
REM Disabling aero shake
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO SaveZoneInformation = 1
REM Disabling downloads blocking
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO ExcludeWUDriversInQualityUpdate = 1
REM Disabling driver updates
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO DontOfferThroughWUAU = 1
REM Disabling malicious software removal tool from installing
REG ADD "HKLM\Software\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO AUOptions = 2
REM Windows update never notify and never install
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d "2" /f >NUL 2>&1

ECHO Windows Error Reporting = Disabled
REM Disabling error reporting
REG ADD "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO HibernateEnabled = 0
REM Disabling hibernate
REG ADD "HKLM\System\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO MenuShowDelay = 0
REM Menu show delay
REG ADD "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >NUL 2>&1

ECHO DisplayParameters = 1
REM Show BSOD details instead of the sad smiley
REG ADD "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO DisableNotificationCenter = 1
REM Disabling action center
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO JPEGImportQuality = 256
REM Wallpaper quality 100%
REG ADD "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "256" /f >NUL 2>&1

ECHO Start_TrackDocs = 0
REM Disabling jump lists
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO DisableSearchBoxSuggestions = 1
REM Disabling search history
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO AutoShareWks = 0
REM Disabling administrative shares
REG ADD "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO Keyboard Layout Toggle = 3
REM Disabling Keyboard Hotkeys
REG ADD "HKCU\Keyboard Layout\Toggle" /v "Language Hotkey" /t REG_SZ /d "3" /f >NUL 2>&1
REG ADD "HKCU\Keyboard Layout\Toggle" /v "Hotkey" /t REG_SZ /d "3" /f >NUL 2>&1
REG ADD "HKCU\Keyboard Layout\Toggle" /v "Layout Hotkey" /t REG_SZ /d "3" /f >NUL 2>&1

ECHO W32Time = NoSync
REM Set Time Zone Automatically Off
REG ADD "HKLM\System\CurrentControlSet\Services\W32Time\Parameters" /v "Type" /t REG_SZ /d "NoSync" /f >NUL 2>&1

ECHO FlyoutMenuSettings = 0
REM Turn Off Sleep And Lock In Power Options
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowSleepOption" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowLockOption" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO UserDuckingPreference = 3
REM Sound Communications Do Nothing
REG ADD "HKCU\Software\Microsoft\Multimedia\Audio" /v "UserDuckingPreference" /t REG_DWORD /d "3" /f >NUL 2>&1

ECHO FirewallRules = deleted
REM Remove Firewall Rules
REG DELETE "HKLM\System\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /f >NUL 2>&1

ECHO Start_TrackProgs = 0
REM Disabling Store And Display Recently Opened Programs In The Start Menu
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f >NUL 2>&1
 
ECHO DelayedDesktopSwitchTimeout = 0
REM Speed Up Start Time
REG ADD "HKCU\AppEvents\Schemes" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DelayedDesktopSwitchTimeout" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO HideSCANetwork = 1
REM Disabling Network Notification Icon
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCANetwork" /t REG_DWORD /d "1" /f >NUL 2>&1
REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCANetwork" /f >NUL 2>&1

ECHO DisableStartupSound = 1
REM Disabling Startup Sound
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\BootAnimation" /v "DisableStartupSound" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO Start_LargeMFUIcons = 0
REM Small Start Menu Icons
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_LargeMFUIcons" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO OEMBackground = 1
REM Black Background
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background" /v "OEMBackground" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO VisualFXSetting = 2
REM System properties - performance options - adjust for best performance
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "2" /f >NUL 2>&1

ECHO DisableGwx = 1
REM Disabling KB4524752 Support Notifications
REG ADD "HKLM\Software\Policies\Microsoft\Windows\Gwx" /v "DisableGwx" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO DisableOSUpgrade = 1
REM Disabling KB4524752 Support Notifications
REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO MaintenanceDisabled = 1
REM Removing Windows Bullshits
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO PrefetchParameters = 0
REM Disabling Prefetcher and Superfetch
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO EnableAutoTray = 0
REM Show all icons and notifications on the taskbar
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t REG_DWORD /d "0" /f >NUL 2>&1 >NUL 2>&1

ECHO DisableWindowsConsumerFeatures = 1
REM Disabling Consumer experiences from Microsoft
REG ADD "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO WUDF Logs = 0
REM Disabling WPP Software Tracing Logs
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogEnable" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogLevel" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO Peernet Disabled = 0
REM Turn off Microsoft Peer-to-Peer Networking Services
REG ADD "HKLM\Software\Policies\Microsoft\Peernet" /v "Disabled" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO DEPOff = 1
REM Turn off Data Execution Prevention
REG ADD "HKLM\Software\Policies\Microsoft\Internet Explorer\Main" /v "DEPOff" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO VerboseStatus = 1
REM Display highly detailed status messages
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "VerboseStatus" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO StartupDelayInMSec = 0
REM Trick to make system Startup faster
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /t REG_DWORD /d "0" /f >NUL 2>&1

REM Turn off Pen feedback
ECHO TurnOffPenFeedback = 1
REG ADD "HKLM\Software\Policies\Microsoft\TabletPC" /v "TurnOffPenFeedback" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO MenuShowDelay = 0
REM Making menu more responsive
REG ADD "HKU\.DEFAULT\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >NUL 2>&1

ECHO fAllowToGetHelp = 0
REM Disable Remote Assistance Connections
REG ADD "HKLM\System\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO ProtectionMode = 0
REM Disabling additional NTFS/ReFS mitigations
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO LargeSystemCache = 1
REM Using big system memory caching to improve microstuttering
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO DisablePagingExecutive = 1
REM Disallow drivers to get paged into virtual memory
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO MaximumSharedReadyQueueSize = 1
REM Specifies the size of the queue for shared kernel operations before its flagged as ready
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "MaximumSharedReadyQueueSize" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO AlpcWakePolicy = 1
REM Specifies the Wake Policy of LPC controllers during activity, 1 will any activity provide best latency
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager" /v "AlpcWakePolicy" /t REG_DWORD /d "1" /f >NUL 2>&1

ECHO Timer Coaslescings = 0
REM Disabling Timer coalescing that is a energy-saving technique
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f >NUL 2>&1

ECHO BCDEDIT useplatformclock = No
REM Disable synthetic timer
BCDEDIT /set useplatformclock No >NUL 2>&1

ECHO BCDEDIT timeout = 0
REM Sets the boot timeout to 0, use 5 for dual boot so you have time to choose between the Operating Systems
bcdedit /timeout 0 >NUL 2>&1

ECHO BCDEDIT nx = AlwaysOff
REM Disabling Data Execution Prevention Security Feature
BCDEDIT /set nx AlwaysOff >NUL 2>&1

ECHO BCDEDIT ems and bootems = No
REM Disabling Emergency Management Services
BCDEDIT /set ems No >NUL 2>&1
BCDEDIT /set bootems No >NUL 2>&1

ECHO BCDEDIT extendedinput = Yes
REM Enabling boot applications to leverage BIOS support for extended console input
BCDEDIT /set extendedinput Yes >NUL 2>&1

ECHO BCDEDIT forcefipscrypto = No
REM Not forcing the use of FIPS cryptography checks on boot applications
BCDEDIT /set forcefipscrypto No >NUL 2>&1

ECHO BCDEDIT halbreakpoint = No
REM Make HAL to stop at a breakpoint early in HAL initialization
BCDEDIT /set halbreakpoint No >NUL 2>&1

ECHO BCDEDIT integrityservices = disable
REM Disabling code integrity services
BCDEDIT /set integrityservices disable >NUL 2>&1

ECHO BCDEDIT tpmbootentropy = ForceDisable
REM Disabling TPM Boot Entropy policy Security Feature
BCDEDIT /set tpmbootentropy ForceDisable >NUL 2>&1

ECHO BCDEDIT disabledynamictick = Yes
REM Disabling tick powersaving feature
BCDEDIT /set disabledynamictick Yes >NUL 2>&1

ECHO BCDEDIT bootmenupolicy = Legacy
REM Changing bootmenupolicy to be able to F8
BCDEDIT /set bootmenupolicy Legacy >NUL 2>&1

ECHO BCDEDIT debug = No
REM Disabling kernel debugger
BCDEDIT /set debug No >NUL 2>&1

ECHO BCDEDIT pae = ForceEnable
REM Enabling PAE version of the Windows kernel system load
BCDEDIT /set pae ForceEnable >NUL 2>&1

ECHO BCDEDIT hypervisorlaunchtype = Off
REM Disabling Virtual Secure Mode from Hyper-V
BCDEDIT /set hypervisorlaunchtype Off >NUL 2>&1

ECHO BCDEDIT disableelamdrivers = Yes
REM Disables the Controls the loading of Early Launch Antimalware (ELAM) drivers
BCDEDIT /set disableelamdrivers Yes >NUL 2>&1

ECHO BCDEDIT isolatedcontext = No
ECHO BCDEDIT allowedinmemorysettings = 0x0
REM Disabling kernel memory mitigation of SGX
BCDEDIT /set isolatedcontext No >NUL 2>&1
BCDEDIT /set allowedinmemorysettings 0x0 >NUL 2>&1

ECHO BCDEDIT vm = No
ECHO BCDEDIT vsmlaunchtype = Off
REM Disabling DMA memory protection and cores isolation
BCDEDIT /set vm No >NUL 2>&1
BCDEDIT /set vsmlaunchtype Off >NUL 2>&1

ECHO BCDEDIT linearaddress57 = OptOut
ECHO BCDEDIT increaseuserva = 268435328
REM Disable 57-bits 5-level paging, Only 100% effective on 10th gen Intel
BCDEDIT /set linearaddress57 OptOut >NUL 2>&1
BCDEDIT /set increaseuserva 268435328 >NUL 2>&1

ECHO BCDEDIT firstmegabytepolicy = UseAll
ECHO BCDEDIT avoidlowmemory = 0x8000000
ECHO BCDEDIT nolowmem = Yes
REM Avoid the use of uncontiguous portions of low-memory from the OS. Boosts memory performance and improves microstuttering at least 80% of the cases. 
REM Also fixes the command buffer stutter after disabling 5-level paging on 10th gen Intel. Causes system freeze on unstable memory sticks.
bcdedit /set firstmegabytepolicy UseAll >NUL 2>&1
bcdedit /set avoidlowmemory 0x8000000 >NUL 2>&1
bcdedit /set nolowmem Yes >NUL 2>&1

ECHO BCDEDIT x2apicpolicy = disable
ECHO BCDEDIT uselegacyapicmode = yes
ECHO BCDEDIT tscsyncpolicy = legacy
REM Adding those bcdedits that riot claims that zoy claims that is better for hit-reg, im testing, you can delete those 3 lines if doesnt want
bcdedit /set x2apicpolicy disable >NUL 2>&1
bcdedit /set uselegacyapicmode yes >NUL 2>&1
bcdedit /set tscsyncpolicy legacy >NUL 2>&1

REM Settings based on Windows Version
for /f "tokens=3*" %%A in ('reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v "ProductName"') do set "WinVersion=%%A %%B"
echo %WinVersion% | find "Windows 7" > nul
if %errorlevel% equ 0 (
ECHO Applying Specific Windows 7 tweaks
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability" /v "TimeStampInterval" /t REG_DWORD /d "0" /f >NUL 2>&1
REM Disable synt tick
BCDEDIT /set useplatformtick Yes >NUL 2>&1
REM Drivers Foolproof
REG ADD "HKLM\System\CurrentControlSet\Services\Power" /v "Start" /t REG_DWORD /d 2 /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\atapi" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
REM Service List
REG ADD "HKLM\System\CurrentControlSet\services\AudioSrv" /v "DependOnService" /t REG_MULTI_SZ /d "AudioEndpointBuilder\0RpcSs" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AeLookupSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\ALG" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AppIDSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AppMgmt" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\aspnet_state" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AxInstSV" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\BDESVC" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Browser" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\CertPropSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\clr_optimization_v2.0.50727_32" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\clr_optimization_v2.0.50727_64" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\clr_optimization_v4.0.30319_32" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\clr_optimization_v4.0.30319_64" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\COMSysApp" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Dnscache" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\dot3svc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\EapHost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\EFS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\EventSystem" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\fdPHost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\FDResPub" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\FontCache" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\hidserv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\HomeGroupListener" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\HomeGroupProvider" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\idsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\IEEtwCollectorService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\IKEEXT" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\IPBusEnum" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\iphlpsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\KeyIso" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\KtmRm" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\LanmanServer" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\LanmanWorkstation" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\lltdsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\lmhosts" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\MozillaMaintenance" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\MpsSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\MSDTC" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\MSiSCSI" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Netlogon" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NetMsmqActivator" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NetPipeActivator" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\netprofm" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NetTcpActivator" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NetTcpPortSharing" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NlaSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\p2pimsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\p2psvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PcaSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PeerDistSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PerfHost" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\pla" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PNRPAutoReg" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PNRPsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PolicyAgent" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\ProtectedStorage" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\QWAVE" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\RemoteRegistry" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\RpcLocator" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SamSs" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SCardSvr" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SCPolicySvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SDRSVC" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\seclogon" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SENS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SharedAccess" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\ShellHWDetection" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SNMPTRAP" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\sppuinotify" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SSDPSRV" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SstpSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\stisvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\StorSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\swprv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\TBS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\THREADORDER" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\TrkWks" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\UI0Detect" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\upnphost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\UxSms" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\VSS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\W32Time" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WatAdminSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\wbengine" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\wcncsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WcsPlugInService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WebClient" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Wecsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Wlansvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\wmiApSrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WPCSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WPDBusEnum" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\wudfsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WwanSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
)
echo %WinVersion% | find "Windows 8.1" > nul
if %errorlevel% equ 0 (
ECHO Applying Specific Windows 8 tweaks
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability" /v "TimeStampInterval" /t REG_DWORD /d "0" /f >NUL 2>&1
REM Specific mitigation code win8
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /t REG_BINARY /d "00000000000000000000000000000000" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions" /t REG_BINARY /d "00000000000000000000000000000000" /f >NUL 2>&1
REM Disable synt tick
BCDEDIT /set useplatformtick Yes >NUL 2>&1
REM Service list
REG ADD "HKLM\System\CurrentControlSet\Services\AeLookupSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\ALG" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AppIDSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AppMgmt" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AppReadiness" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AppXSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\AxInstSV" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\bthserv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\CertPropSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\COMSysApp" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\defragsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\DeviceAssociationService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Dhcp" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Dnscache" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\dot3svc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\DPS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\DsmSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Eaphost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\EFS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\EventLog" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\EventSystem" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\fdPHost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\FDResPub" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\FontCache" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\hidserv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\hkmsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\IEEtwCollectorService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\IKEEXT" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\iphlpsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\KeyIso" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\KtmRm" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\LanmanServer" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\LanmanWorkstation" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\lltdsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\lmhosts" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\MMCSS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\MpsSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\MSDTC" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\MSiSCSI" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\MsKeyboardFilter" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\napagent" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NcaSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NcbService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NcdAutoSetup" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Netlogon" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Netman" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\netprofm" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NetTcpPortSharing" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NlaSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\nsi" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\p2pimsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\p2psvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PcaSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PeerDistSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PerfHost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\pla" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PlugPlay" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PNRPAutoReg" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PNRPsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PolicyAgent" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Power" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PrintNotify" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\QWAVE" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\RasAuto" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\RasMan" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\RemoteAccess" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\RpcLocator" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SamSs" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SCardSvr" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\ScDeviceEnum" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Schedule" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SCPolicySvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\seclogon" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SENS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SensrSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SessionEnv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SharedAccess" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\ShellHWDetection" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\smphost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SNMPTRAP" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SSDPSRV" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SstpSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\stisvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\StorSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\svsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\swprv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\SystemEventsBroker" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\TabletInputService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\TapiSrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\TermService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\THREADORDER" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\TimeBroker" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\TrkWks" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\UI0Detect" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\UmRdpService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\upnphost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\VaultSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\vds" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\VSS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\W32Time" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\wbengine" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Wcmsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\wcncsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WcsPlugInService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WdiServiceHost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WdiSystemHost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WebClient" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Wecsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WEPHOSTSVC" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WerSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WiaRpc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WinRM" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WlanSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\wlidsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\wmiApSrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WPCSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WPDBusEnum" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\wudfsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WwanSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
)
echo %WinVersion% | find "Windows 10" > nul
if %errorlevel% equ 0 (
ECHO Applying Specific Windows 10 tweaks
REM Specific mitigation code win10
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /t REG_BINARY /d "22222222222222222002000000200000" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions" /t REG_BINARY /d "20000020202022220000000000000000" /f >NUL 2>&1
REM Disable synt tick
BCDEDIT /set useplatformtick No >NUL 2>&1
REM Service List
REG ADD "HKLM\System\CurrentControlSet\Services\AppVClient" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\CertPropSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\DPS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\GraphicsPerfSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\LanmanServer" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\lmhosts" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\mpssvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\NetTcpPortSharing" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\PcaSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\QWAVE" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\RemoteAccess" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\RemoteRegistry" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\shpamsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\ssh-agent" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\TabletInputService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\TapiSrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\tzautoupdate" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\UevAgentService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WdiServiceHost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WdiSystemHost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WerSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
)

ECHO.
ECHO Script will now make questions, answer wisely!
ECHO.

ECHO.
Echo. Disable Webcam?
Echo. 
Echo. [1] Yes
Echo. 
Echo. [2] No
Echo. 
choice /c:12 /n > NUL 2>&1
if errorlevel 2 goto WEBCAM
if errorlevel 1 goto NOWEBCAM

:NOWEBCAM
ECHO Your Answer:
ECHO 1
REG ADD "HKLM\System\CurrentControlSet\Services\swenum" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
ECHO.
goto :nextquestion

:WEBCAM
ECHO Your Answer:
ECHO 2
ECHO.
goto :nextquestion

:nextquestion
ECHO.
Echo. SSD as main drive?
Echo. 
Echo. [1] Yes
Echo. 
Echo. [2] No
Echo. 
choice /c:12 /n > NUL 2>&1
if errorlevel 2 goto NOSSD
if errorlevel 1 goto SSD

:SSD
ECHO Your Answer:
ECHO 1
fsutil behavior set disabledeletenotify 0 >NUL 2>&1
ECHO.
goto :nextquestion

:NOSSD
ECHO Your Answer:
ECHO 2
ECHO.
goto :nextquestion

:nextquestion
ECHO.
Echo. Tweak processes with IFEO Prioritys?
Echo. 
Echo. [1] Yes
Echo. 
Echo. [2] No
Echo. 
choice /c:12 /n > NUL 2>&1
if errorlevel 2 goto NOIFEO
if errorlevel 1 goto IFEO

:IFEO
ECHO Your Answer:
ECHO 1
ECHO.
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\audiodg.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "2" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ntoskrnl.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ntoskrnl.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe" /v "MinimumStackCommitInBytes" /t REG_DWORD /d "32768" /f >NUL 2>&1
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f >NUL 2>&1
goto :nextquestion

:NOIFEO
ECHO Your Answer:
ECHO 2
ECHO.
goto :nextquestion

:nextquestion
ECHO.
Echo. Tweak pagefile to 32gb?
Echo. 
Echo. [1] Yes
Echo. 
Echo. [2] No
Echo. 
choice /c:12 /n > NUL 2>&1
if errorlevel 2 goto NOPAGEFILE
if errorlevel 1 goto PAGEFILE

:PAGEFILE
ECHO Your Answer:
ECHO 1
ECHO.
for /f "skip=1" %%A in ('wmic os get TotalVisibleMemorySize') do ( 
set system_ram=%%A
goto :ramchecker
)
:ramchecker
if %system_ram% GEQ 16277216 if %system_ram% LEQ 17277216 goto 16gb
:16gb
WMIC pagefileset where name="C:\\pagefile.sys" delete >NUL 2>&1
WMIC pagefileset create name="C:\pagefile.sys" >NUL 2>&1
WMIC computersystem where name="%computername%" set AutomaticManagedPagefile=False >NUL 2>&1
WMIC pagefileset where name="C:\\pagefile.sys" set InitialSize=32768,MaximumSize=32768 >NUL 2>&1
goto :nextquestion

:NOPAGEFILE
ECHO Your Answer:
ECHO 2
ECHO.
goto :nextquestion

:nextquestion
ECHO.
Echo. Tweak drivers with ThreadPriority?
Echo. 
Echo. [1] Yes
Echo. 
Echo. [2] No
Echo. 
choice /c:12 /n > NUL 2>&1
if errorlevel 2 goto NOTP
if errorlevel 1 goto TP

:TP
ECHO Your Answer:
ECHO 1
Reg.exe add "HKLM\System\CurrentControlSet\Services\Ntfs\Parameters" /v "ThreadPriority" /t REG_DWORD /d "0" /f >NUL 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\storahci\Parameters" /v "ThreadPriority" /t REG_DWORD /d "0" /f >NUL 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\stornvme\Parameters" /v "ThreadPriority" /t REG_DWORD /d "0" /f >NUL 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\Audiosrv\Parameters" /v "ThreadPriority" /t REG_DWORD /d "0" /f >NUL 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\disk\Parameters" /v "ThreadPriority" /t REG_DWORD /d "0" /f >NUL 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\iaStorAC\Parameters" /v "ThreadPriority" /t REG_DWORD /d "0" /f >NUL 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\iaStorAVC\Parameters" /v "ThreadPriority" /t REG_DWORD /d "0" /f >NUL 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\HDAudBus\Parameters" /v "ThreadPriority" /t REG_DWORD /d "0" /f >NUL 2>&1
ECHO.
goto :nextquestion

:NOTP
ECHO Your Answer:
ECHO 2m
ECHO.
goto :nextquestion

:nextquestion
ECHO.
Echo. Do you play VALORANT?
Echo. 
Echo. [1] Yes
Echo. 
Echo. [2] No
Echo. 
choice /c:12 /n > NUL 2>&1
if errorlevel 2 goto NOVALORANT
if errorlevel 1 goto VALORANT

:VALORANT
ECHO Your Answer:
ECHO 1
BCDEDIT /set nx OptIn >NUL 2>&1
BCDEDIT /set testsigning off >NUL 2>&1
BCDEDIT /set nointegritychecks off >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableVirtualization" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t REG_DWORD /d "1" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "5" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ValidateAdminCodeSignatures" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t REG_DWORD /d "0" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser" /t REG_DWORD /d "3" /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t REG_DWORD /d "0" /f >NUL 2>&1
ECHO.
goto :nextquestion

:NOVALORANT
ECHO Your Answer:
ECHO 2
ECHO.
goto :nextquestion

:nextquestion
ECHO.
Echo. Disable AFD? (Will make set STATIC IP a must)
Echo. 
Echo. [1] Yes
Echo. 
Echo. [2] No
Echo. 
choice /c:12 /n > NUL 2>&1
if errorlevel 2 goto NOAFD
if errorlevel 1 goto AFD

:AFD
ECHO Your Answer:
ECHO 1
REG ADD "HKLM\System\CurrentControlSet\Services\AFD" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Services\Dhcp" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
C:\Windows\System32\ncpa.cpl
ECHO.
goto :ending

:NOAFD
ECHO Your Answer:
ECHO 2
ECHO.
goto :ending

:ending
ECHO Finished with tweaking
ECHO Report feedbacks, end of script
pause

::Reg.exe add "HKLM\System\CurrentControlSet\Services\usbccgp\Parameters" /v "ThreadPriority" /t REG_DWORD /d "15" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\usbehci\Parameters" /v "ThreadPriority" /t REG_DWORD /d "15" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\usbhub\Parameters" /v "ThreadPriority" /t REG_DWORD /d "15" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\USBHUB3\Parameters" /v "ThreadPriority" /t REG_DWORD /d "15" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\usbohci\Parameters" /v "ThreadPriority" /t REG_DWORD /d "15" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\usbuhci\Parameters" /v "ThreadPriority" /t REG_DWORD /d "15" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\USBXHCI\Parameters" /v "ThreadPriority" /t REG_DWORD /d "15" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\mouhid\Parameters" /v "ThreadPriority" /t REG_DWORD /d "15" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\services\nvlddmkm\Parameters" /v "ThreadPriority" /t REG_DWORD /d "15" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\DXGKrnl\Parameters" /v "ThreadPriority" /t REG_DWORD /d "15" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\HidUsb\Parameters" /v "ThreadPriority" /t REG_DWORD /d "15" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\kbdhid\Parameters" /v "ThreadPriority" /t REG_DWORD /d "15" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\monitor\Parameters" /v "ThreadPriority" /t REG_DWORD /d "15" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "ThreadPriority" /t REG_DWORD /d "0" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\NDIS\Parameters" /v "ThreadPriority" /t REG_DWORD /d "0" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "ThreadPriority" /t REG_DWORD /d "0" /f >NUL 2>&1
::Reg.exe add "HKLM\System\CurrentControlSet\Services\TCPIP6\Parameters" /v "ThreadPriority" /t REG_DWORD /d "0" /f >NUL 2>&1
