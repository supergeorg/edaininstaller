program EdainInstaller;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {fMain},
  uAbout in 'uAbout.pas' {fAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfAbout, fAbout);
  Application.Run;
end.
