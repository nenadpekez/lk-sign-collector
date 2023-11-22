object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 541
  ClientWidth = 827
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
  object Image1: TImage
    Left = 40
    Top = 160
    Width = 185
    Height = 217
  end
  object Panel1: TPanel
    Left = 40
    Top = 40
    Width = 185
    Height = 41
    Caption = 'Panel1'
    TabOrder = 0
  end
  object msg: TPanel
    Left = 328
    Top = 112
    Width = 185
    Height = 41
    Caption = 'msg'
    TabOrder = 1
  end
  object mmoPodaci: TMemo
    Left = 304
    Top = 168
    Width = 369
    Height = 281
    Lines.Strings = (
      'mmoPodaci')
    TabOrder = 2
  end
  object Button1: TButton
    Left = 344
    Top = 49
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
end
