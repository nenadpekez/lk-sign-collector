unit Main1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TMain = class(TForm)
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.FormCreate(Sender: TObject);
begin
  {$REGION 'Default'}
    //Application.Title := 'LK - SIGN';
    Application.Title := 'LK - SIGN APP';

    Self.Caption := Application.Title;
    Self.Panel1.Caption := 'TEST';
    Self.Panel1.Align := alTop;
    Self.Panel1.AlignWithMargins := True;
  {$ENDREGION}
end;

end.
