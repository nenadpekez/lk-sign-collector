program lk_sign_collector;

uses
  Vcl.Forms,
  Main1 in 'Main1.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
