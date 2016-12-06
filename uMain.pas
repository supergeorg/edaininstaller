unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.ExtCtrls, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  ShellApi, Inifiles, uAbout;

type
  TfMain = class(TForm)
    iBackground: TImageViewer;
    bExit: TButton;
    Sprache: TLang;
    bInfo: TButton;
    cbBFME2DVD: TCheckBox;
    eBFME2DVD: TEdit;
    cbROTWKDVD: TCheckBox;
    eROTWKDVD: TEdit;
    bInstallBFME2: TButton;
    bPatchBFME2: TButton;
    bInstallROTWK: TButton;
    bPatchROTWK: TButton;
    bInstallEdain: TButton;
    bInstallModChanger: TButton;
    sLanguage: TSwitch;
    lLanguage: TLabel;
    procedure bExitClick(Sender: TObject);
    procedure cbBFME2DVDChange(Sender: TObject);
    procedure sLanguageSwitch(Sender: TObject);
    procedure cbROTWKDVDChange(Sender: TObject);
    procedure bInstallBFME2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bPatchBFME2Click(Sender: TObject);
    procedure bInstallROTWKClick(Sender: TObject);
    procedure bPatchROTWKClick(Sender: TObject);
    procedure bInstallEdainClick(Sender: TObject);
    procedure bInstallModChangerClick(Sender: TObject);
    procedure bInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;
  path:  String;

implementation

{$R *.fmx}

procedure TfMain.bExitClick(Sender: TObject);
begin
 halt;
end;

procedure TfMain.bInfoClick(Sender: TObject);
begin
 fAbout.Show;
end;

procedure TfMain.bInstallBFME2Click(Sender: TObject);
begin
if cbBFME2DVD.IsChecked=true then
begin
  if fileexists(eBFME2DVD.Text+':\Autorun.exe') then
  begin
    ShellExecute(0, 'open', PChar(eBFME2DVD.Text+':\Autorun.exe'),'',PChar(eBFME2DVD.Text+':\'),1)
  end else showmessage(Sprache.LangStr[Sprache.Lang].Values['snobfme2dvd']);
end else
begin
  if fileexists(path+'BFME2\Autorun.exe') then
  begin
    ShellExecute(0, 'open', PChar(path+'BFME2\Autorun.exe'),'',PChar(path+'BFME2\'),1)
  end else showmessage(Sprache.LangStr[Sprache.Lang].Values['snobfme2folder']);
end;
end;

procedure TfMain.bInstallEdainClick(Sender: TObject);
var cfg_ini:TInifile;
    EdainVersion:String;
begin
cfg_ini:=TInifile.Create(path+'EdainInstaller.ini');
EdainVersion:=cfg_ini.ReadString('Edain','Version','EdainMod4.3.exe');
cfg_ini.Free;
if FileExists(PChar(path+'Edain\'+EdainVersion+'.exe')) then
  begin
    ShellExecute(0, 'open', PChar(path+'Edain\'+EdainVersion+'.exe'),'','',1);
    //showmessage(Sprache.LangStr[Sprache.Lang].Values['sinstallsuccess']);
  end else showmessage(Sprache.LangStr[Sprache.Lang].Values['sedainnotfound']);
end;

procedure TfMain.bInstallModChangerClick(Sender: TObject);
begin
if FileExists(PChar(path+'Edain\edainswitcherinstaller.exe')) then
  begin
    ShellExecute(0, 'open', PChar(path+'Edain\edainswitcherinstaller.exe'),'','',1);
    //showmessage(Sprache.LangStr[Sprache.Lang].Values['sinstallsuccess']);
  end else showmessage(Sprache.LangStr[Sprache.Lang].Values['smodswitchernotfound']);
end;

procedure TfMain.bInstallROTWKClick(Sender: TObject);
begin
if cbROTWKDVD.IsChecked=true then
begin
  if fileexists(eROTWKDVD.Text+':\Autorun.exe') then
  begin
    ShellExecute(0, 'open', PChar(eROTWKDVD.Text+':\Autorun.exe'),'',PChar(eROTWKDVD.Text+':\'),1)
  end else showmessage(Sprache.LangStr[Sprache.Lang].Values['snorotwkdvd']);
end else
begin
  if fileexists(path+'ROTWK\Autorun.exe') then
  begin
    ShellExecute(0, 'open', PChar(path+'ROTWK\Autorun.exe'),'',PChar(path+'ROTWK\'),1)
  end else showmessage(Sprache.LangStr[Sprache.Lang].Values['snorotwkfolder']);
end;
end;

procedure TfMain.bPatchBFME2Click(Sender: TObject);
begin
if FileExists(PChar(path+'Patches\lotrbfme2-65542-'+Sprache.LangStr[Sprache.Lang].Values['langstr']+'.exe')) then
  begin
    ShellExecute(0, 'open', PChar(path+'Patches\lotrbfme2-65542-'+Sprache.LangStr[Sprache.Lang].Values['langstr']+'.exe'),'','',1);
    //showmessage(Sprache.LangStr[Sprache.Lang].Values['spatchsuccess']);
  end else showmessage(Sprache.LangStr[Sprache.Lang].Values['spatchnotfound']);
end;

procedure TfMain.bPatchROTWKClick(Sender: TObject);
begin
if FileExists(PChar(path+'Patches\LotrBfMe2EP1-131073-'+Sprache.LangStr[Sprache.Lang].Values['langstr']+'.exe')) then
  begin
    ShellExecute(0, 'open', PChar(path+'Patches\LotrBfMe2EP1-131073-'+Sprache.LangStr[Sprache.Lang].Values['langstr']+'.exe'),'','',1);
    //showmessage(Sprache.LangStr[Sprache.Lang].Values['spatchsuccess']);
  end else showmessage(Sprache.LangStr[Sprache.Lang].Values['spatchnotfound']);
end;

procedure TfMain.cbBFME2DVDChange(Sender: TObject);
begin
 eBFME2DVD.Enabled:=cbBFME2DVD.IsChecked;
end;

procedure TfMain.cbROTWKDVDChange(Sender: TObject);
begin
 eROTWKDVD.Enabled:=cbROTWKDVD.IsChecked;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
 path:=ExtractFilePath(ParamStr(0));
 Sprache.Lang:='DE';
end;

procedure TfMain.sLanguageSwitch(Sender: TObject);
begin
 if sLanguage.IsChecked=true
 then begin Sprache.Lang:='EN'; lLanguage.Text:=Sprache.LangStr[Sprache.Lang].Values['lng_en']; end
 else begin Sprache.Lang:='DE'; lLanguage.Text:=Sprache.LangStr[Sprache.Lang].Values['lng_de']; end;
end;

end.
