[Setup]
AppName=Clip2File
AppVersion={#MyAppVersion}
AppPublisher=Clip2File Windows Tool
DefaultDirName={autopf}\Clip2File
OutputDir=Output
OutputBaseFilename=Clip2File_Installer
Compression=lzma2
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64
PrivilegesRequired=admin
DisableProgramGroupPage=yes
SetupIconFile=app_icon.ico

[Files]
Source: "target\release\clip2file.exe"; DestDir: "{app}"; Flags: ignoreversion

[Registry]
Root: HKCR; Subkey: "Directory\Background\shell\Clip2File"; ValueType: string; ValueName: ""; ValueData: "粘贴为 MD5随机文本(&P)"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Directory\Background\shell\Clip2File"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\clip2file.exe"
Root: HKCR; Subkey: "Directory\Background\shell\Clip2File\command"; ValueType: string; ValueName: ""; ValueData: """{app}\clip2file.exe"" ""%V"""

Root: HKCR; Subkey: "Directory\shell\Clip2File"; ValueType: string; ValueName: ""; ValueData: "粘贴至此 (MD5随机文本)(&P)"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Directory\shell\Clip2File"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\clip2file.exe"
Root: HKCR; Subkey: "Directory\shell\Clip2File\command"; ValueType: string; ValueName: ""; ValueData: """{app}\clip2file.exe"" ""%1"""