program LK;

{$R *.dres}

uses
  Vcl.Forms,
  Main1 in 'Main1.pas' {Main},
  Vcl.Themes,
  Vcl.Styles,
  CelikApi in 'CelikApi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sky');
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
