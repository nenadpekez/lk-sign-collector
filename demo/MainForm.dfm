object Form1: TForm1
  Left = 542
  Top = 324
  Caption = 'Form1'
  ClientHeight = 555
  ClientWidth = 641
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object imgPic: TImage
    Left = 8
    Top = 196
    Width = 155
    Height = 221
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Center = True
    Proportional = True
  end
  object btnCitajKarticu: TButton
    Left = 8
    Top = 16
    Width = 155
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Citaj LK'
    TabOrder = 0
    OnClick = btnCitajKarticuClick
  end
  object btnSaveMemoToFile: TButton
    Left = 7
    Top = 123
    Width = 155
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Sacuvaj'
    Enabled = False
    TabOrder = 2
    OnClick = btnSaveMemoToFileClick
  end
  object btnLoadFromFile: TButton
    Left = 8
    Top = 152
    Width = 155
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Ucitaj iz fajla'
    TabOrder = 3
    OnClick = btnLoadFromFileClick
  end
  object mmoPodaci: TMemo
    Left = 322
    Top = 0
    Width = 319
    Height = 555
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 1
  end
end
