object _Aguarde: T_Aguarde
  Left = 443
  Top = 725
  BorderStyle = bsNone
  Caption = 'Aguarde'
  ClientHeight = 62
  ClientWidth = 194
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 194
    Height = 62
    Align = alClient
    Style = bsRaised
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 194
    Height = 62
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 4
    BorderStyle = bsSingle
    TabOrder = 1
    object Label1: TLabel
      Left = 44
      Top = 9
      Width = 101
      Height = 13
      Caption = 'Por Favor, Aguarde...'
      Transparent = True
    end
    object Label2: TLabel
      Left = 39
      Top = 23
      Width = 112
      Height = 13
      Caption = 'Verificando N'#186's de O.S.'
      Transparent = True
    end
    object g: TGauge
      Left = 8
      Top = 36
      Width = 174
      Height = 13
      BorderStyle = bsNone
      Color = clWhite
      ParentColor = False
      Progress = 0
    end
  end
  object BitBtn1: TBitBtn
    Left = 57
    Top = 19
    Width = 80
    Height = 25
    Caption = 'Iniciar Leitura'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
end
