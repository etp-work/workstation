; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "The Power"
#define MyAppVersion "1.0.3"
#define MyAppPublisher "Ericsson three persons"
#define MyAppExeName "DevelopmentToolkit.exe"
#define AppId "ThePowerFromEricssonThreePerson"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={#AppId}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
;InfoBeforeFile=Wellcome to the world of The Power
;InfoAfterFile=You are the power
OutputDir=target
OutputBaseFilename=ThePower
Compression=lzma
SolidCompression=yes
UninstallDisplayName=The Power
; "ArchitecturesAllowed=x86" specifies that Setup cannot run on
; anything but x86.
ArchitecturesAllowed=x86


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "..\shell\*"; DestDir: "{app}"; Flags: ignoreversion; BeforeInstall: ExistInstallationCheck()
Source: "..\shell\images\*"; DestDir: "{app}\images"; Flags: ignoreversion
Source: "..\shell\locales\*"; DestDir: "{app}\locales"; Flags: ignoreversion
Source: "..\icons\The_power_icon_128.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\xulrunner\*"; DestDir: "{app}\xulrunner"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\CustomizedTomcat\*"; DestDir: "{localappdata}\CustomizedTomcat"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename:"{app}\The_power_icon_128.ico" ; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{app}\portalkit.log"
Type: filesandordirs; Name: "{localappdata}\CustomizedTomcat"


[Code]
var CancelWithoutPrompt: boolean;
var ApplicationWasUninstalled: Boolean;
procedure ExistInstallationCheck();
begin
  if RegKeyExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{#AppId}_is1') then
  begin
      MsgBox('You have ThePower installed on your workstation, please uninstall it first. ', mbInformation, MB_OK);
      CancelWithoutPrompt := true;
      WizardForm.Close;
  end;
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  if CurPageID=wpInstalling then
    Confirm := not CancelWithoutPrompt;
end;

function InitializeUninstall(): Boolean;
begin
  if FindWindowByWindowName('DevelopmentToolkit') = 0 then
    begin
      Result := True;
    end
  else
    begin
      MsgBox('ThePower is still running, please shutdown it first.', mbInformation, MB_OK);
      Result := False;
    end;
end;

procedure InitializeUninstallProgressForm();
begin
  ApplicationWasUninstalled := true;
end;

procedure DeinitializeUninstall();
begin
  if ApplicationWasUninstalled Then Begin
      if MsgBox('Do you want to keep your profile?', mbConfirmation, MB_YESNO) <> idYes then
        DeleteFile('C:\Users\'+GetUserNameString()+'\.portalkit');
  end;
end;