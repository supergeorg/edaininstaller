unit uAbout;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ExtCtrls, ShellApi, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TfAbout = class(TForm)
    iBanner: TImageViewer;
    lAbout: TLabel;
    lRights: TLabel;
    bGithub: TButton;
    bModdb: TButton;
    bForum: TButton;
    procedure bModdbClick(Sender: TObject);
    procedure bForumClick(Sender: TObject);
    procedure bGithubClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAbout: TfAbout;

implementation

{$R *.fmx}

procedure TfAbout.bForumClick(Sender: TObject);
begin
 ShellExecute(0,'open',PChar('http://forum.modding-union.com/index.php/topic,16740'),nil,nil, 1);
end;

procedure TfAbout.bGithubClick(Sender: TObject);
begin
 ShellExecute(0,'open',PChar('https://github.com/supergeorg/edaininstaller'),nil,nil, 1);
end;

procedure TfAbout.bModdbClick(Sender: TObject);
begin
 ShellExecute(0,'open',PChar('http://www.moddb.com/mods/edain-mod'),nil,nil, 1);
end;

end.
