unit Main1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TMain = class(TForm)
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
  {$ENDREGION}
end;

end.
