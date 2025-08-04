unit Main1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, CelikApi;

type
  TMain = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    msg: TPanel;
    mmoPodaci: TMemo;
    Button1: TButton;

    procedure ReadLK(Sender: TObject);
    procedure DisplayData(const ADocData: TNormDocumentData; AFixPerData: TNormFixedPersonalData; AVarPerData: TNormVariablePersonalData);
    procedure DisplayPicture(const AImg: TStream; const jmbg: String);

    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses Jpeg;

{$R *.dfm}

procedure TMain.FormCreate(Sender: TObject);
begin
  //EidStartup(API_VERSION);

  {$REGION 'Default'}


    Application.Title := chr(8482) +' SIGN COLLECTOR';

    Self.Caption := Application.Title;
    Self.Position := poMainFormCenter;
    Self.Font.Name := 'Verdana';
    Self.Font.Size := 10;

    Self.Panel1.Caption := 'TEST';
    Self.Panel1.Align := alTop;
    Self.Panel1.AlignWithMargins := True;
    Self.Panel1.BevelInner := bvLowered;


  {$ENDREGION}
end;

procedure TMain.FormDestroy(Sender: TObject);
begin
  EidCleanup();
end;

procedure TMain.ReadLK(Sender: TObject);
var
  DocData: TNormDocumentData;
  FixedData: TNormFixedPersonalData;
  VariableData: TNormVariablePersonalData;
  ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  Image1.Picture.Bitmap.Empty;
  try
    msg.Visible:=true;
    msg.Left:=self.Width div 2 - msg.Width div 2;
    msg.Top:=self.Height div 2 - msg.Height div 2;
    Application.ProcessMessages;

    EidBeginRead('', nil);
    NormReadDocumentData(DocData);
    NormReadFixedPersonalData(FixedData);
    NormReadVariablePersonalData(VariableData);
    NormReadPicture(ms);
    EidEndRead;
    {
    edit1.Text:=convertText(FixedData.GivenName+' '+FixedData.ParentGivenName+' '+FixedData.Surname);
    edit2.Text:=convertText(FixedData.PersonalNumber);
    edit3.Text:=convertText(FixedData.PlaceOfBirth+' '+FixedData.CommunityOfBirth+' '+FixedData.StateOfBirth);
    edit4.Text:=convertText(VariableData.State);
    edit5.Text:=convertText(VariableData.Community);
    edit6.Text:=convertText(VariableData.Place);
    edit7.Text:=convertText(VariableData.Street+' '+VariableData.HouseNumber+''+VariableData.HouseLetter);
    edit8.Text:=convertText(VariableData.Entrance+' '+VariableData.Floor+' '+VariableData.ApartmentNumber);
    edit9.Text:=convertText(FixedData.Sex);
    edit10.Text:=convertText(FixedData.DateOfBirth);
    edit11.Text:=convertText(FixedData.PersonalNumber);
    edit12.Text:=convertText(DocData.DocRegNo);
    edit13.Text:=convertText(DocData.IssuingDate);
    edit14.Text:=convertText(DocData.ExpiryDate);
    edit15.Text:=convertText(DocData.IssuingAuthority);

    LKData.brojlk.value := convertText(DocData.DocRegNo);
    LKDAta.datumizdavanja.value := convertText(DocData.IssuingDate);
    LKDAta.datumisteka.value := convertText(DocData.ExpiryDate);
    LKDAta.datumpromeneadrese.value := convertText(VariableData.AddressDate);
    LKDAta.pu.value := convertText(DocData.IssuingAuthority);
    LKDAta.ime.value := convertText(FixedData.GivenName);
    LKDAta.prezime.value := convertText(FixedData.Surname);
    LKDAta.roditelj.value := convertText(FixedData.ParentGivenName);
    LKDAta.pol.value := convertText(FixedData.Sex);
    LKDAta.mestorodjenja.value := convertText(FixedData.PlaceOfBirth);
    LKDAta.opstinarodjenja.value := convertText(FixedData.CommunityOfBirth);
    LKDAta.drzavarodjenja.value := convertText(FixedData.StateOfBirth);
    LKDAta.datumrodjenja.value := convertText(FixedData.DateOfBirth);
    LKDAta.jmbg.value := convertText(FixedData.PersonalNumber);
    LKDAta.oznakadrzave.value := convertText(VariableData.State);
    LKDAta.opstina.value := convertText(VariableData.Community);
    LKDAta.mesto.value := convertText(VariableData.Place);
    LKDAta.ulica.value := convertText(VariableData.Street);
    LKDAta.kucnibroj.value := convertText(VariableData.HouseNumber);
    LKDAta.kucnoslovo.value := convertText(VariableData.HouseLetter);
    LKDAta.ulaz.value := convertText(VariableData.Entrance);
    LKDAta.sprat.value := convertText(VariableData.Floor);
    LKDAta.brojstana.value := convertText(VariableData.ApartmentNumber);


    LKData.brojlk.name := 'brojlk';
    LKDAta.datumizdavanja.name := 'datumizdavanja';
    LKDAta.datumisteka.name := 'datumisteka';
    LKDAta.datumisteka.name := 'datumpromeneadrese';
    LKDAta.pu.name := 'pu';
    LKDAta.ime.name := 'ime';
    LKDAta.prezime.name := 'prezime';
    LKDAta.roditelj.name := 'roditelj';
    LKDAta.pol.name := 'pol';
    LKDAta.mestorodjenja.name := 'mestorodjenja';
    LKDAta.opstinarodjenja.name := 'opstinarodjenja';
    LKDAta.drzavarodjenja.name := 'drzavarodjenja';
    LKDAta.datumrodjenja.name := 'datumrodjenja';
    LKDAta.jmbg.name := 'jmbg';
    LKDAta.oznakadrzave.name := 'oznakadrzave';
    LKDAta.opstina.name := 'opstina';
    LKDAta.mesto.name := 'mesto';
    LKDAta.ulica.name := 'ulica';
    LKDAta.kucnibroj.name := 'kucnibroj';
    LKDAta.kucnoslovo.name := 'kucnoslovo';
    LKDAta.ulaz.name := 'ulaz';
    LKDAta.sprat.name := 'sprat';
    LKDAta.brojstana.name := 'brojstana';

    }
    DisplayData(DocData, FixedData, VariableData);
    //DisplayPicture(ms, FixedData.PersonalNumber);
    {
    if GeneralData.broj.broj_inc=true then
    Begin
      inc(broj_overe);
    End;
    }
  finally
    ms.Free;
  end;
  msg.Visible:=false;
end;

procedure TMain.Button1Click(Sender: TObject);
begin
  Self.ReadLK(Sender);
end;

procedure TMain.DisplayData(const ADocData: TNormDocumentData; AFixPerData: TNormFixedPersonalData; AVarPerData: TNormVariablePersonalData);
begin
  mmoPodaci.Clear;
  mmoPodaci.Lines.Add('Reg.no: ' + ADocData.DocRegNo);
  mmoPodaci.Lines.Add('Tip dokumenta: ' + ADocData.DocumentType);
  mmoPodaci.Lines.Add('Datum izdavanja: ' + ADocData.IssuingDate);
  mmoPodaci.Lines.Add('Datum isteka: ' + ADocData.ExpiryDate);
  mmoPodaci.Lines.Add('Izdaje: ' + ADocData.IssuingAuthority);

  mmoPodaci.Lines.Add('-----------------------------------------');
  mmoPodaci.Lines.Add('Prezime: ' + AFixPerData.Surname);
  mmoPodaci.Lines.Add('Ime: ' + AFixPerData.GivenName);
  mmoPodaci.Lines.Add('Ime roditelja: ' + AFixPerData.ParentGivenName);
  mmoPodaci.Lines.Add('Pol: ' + AFixPerData.Sex);
  mmoPodaci.Lines.Add('Mesto roðenja: ' + AFixPerData.PlaceOfBirth);
  mmoPodaci.Lines.Add('Država: ' + AFixPerData.StateOfBirth);
  mmoPodaci.Lines.Add('Datum roðenja: ' + AFixPerData.DateOfBirth);
  mmoPodaci.Lines.Add('JMBG: ' + AFixPerData.PersonalNumber);
  mmoPodaci.Lines.Add('Opština: ' + AFixPerData.CommunityOfBirth);

  mmoPodaci.Lines.Add('-----------------------------------------');
  mmoPodaci.Lines.Add('Prebivalište - oznaka države: ' + AVarPerData.state);
  mmoPodaci.Lines.Add('Prebivalište - opština: ' + AVarPerData.community);
  mmoPodaci.Lines.Add('Prebivalište - mesto: ' + AVarPerData.place);
  mmoPodaci.Lines.Add('Prebivalište - ulica: ' + AVarPerData.street);
  mmoPodaci.Lines.Add('Prebivalište - kuæni broj: ' + AVarPerData.houseNumber);
  mmoPodaci.Lines.Add('Prebivalište - slovo uz broj: ' + AVarPerData.houseLetter);
  mmoPodaci.Lines.Add('Prebivalište - ulaz: ' + AVarPerData.entrance);
  mmoPodaci.Lines.Add('Prebivalište - sprat: ' + AVarPerData.floor);
  mmoPodaci.Lines.Add('Prebivalište - broj stana: ' + AVarPerData.apartmentNumber);
  mmoPodaci.Lines.Add('Prebivalište - promena datuma: ' + AVarPerData.AddressDate);
  mmoPodaci.Lines.Add('Prebivalište - adresna oznaka: ' + AVarPerData.AddressLabel);
end;

procedure TMain.DisplayPicture(const AImg: TStream; const jmbg: String);
var
  img: TJPEGImage;
  fs: TFileStream;
begin
  if AImg.Size > 0 then
  begin
    fs := nil;
    img := TJPEGImage.Create;
    try
      AImg.Position := 0;
      img.LoadFromStream(AImg);
      Image1.Picture.Assign(img);

      fs := TFileStream.Create(ExtractFilePath(Application.exeName)+'/img/'+jmbg+'.jpg', fmCreate);
      AImg.Position := 0;
      fs.CopyFrom(AImg, 0);
    finally
      img.Free;
      fs.Free;
    end;
  end;
end;

end.
