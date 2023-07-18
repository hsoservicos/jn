object _Alterar_Servicos: T_Alterar_Servicos
  Left = 700
  Top = 183
  Width = 712
  Height = 484
  BorderIcons = []
  Caption = 'Altera'#231#227'o de Servi'#231'os'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbSair: TSpeedButton
    Left = 4
    Top = 418
    Width = 126
    Height = 28
    Caption = 'Finalizar'
    OnClick = sbSairClick
  end
  object gbOS: TGroupBox
    Left = 4
    Top = 3
    Width = 126
    Height = 42
    Caption = '[ O.S. N'#186' ]'
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object edtOs: TEdit
      Left = 7
      Top = 16
      Width = 111
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Text = '999999999999999'
    end
  end
  object gbCliente: TGroupBox
    Left = 132
    Top = 3
    Width = 568
    Height = 120
    Caption = '[ Dados do Cliente ]'
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    object lblCliente: TLabel
      Left = 3
      Top = 14
      Width = 94
      Height = 13
      Caption = 'Nome do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label2: TLabel
      Left = 3
      Top = 39
      Width = 55
      Height = 13
      Caption = 'Endere'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label3: TLabel
      Left = 3
      Top = 65
      Width = 34
      Height = 13
      Caption = 'Bairro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label4: TLabel
      Left = 248
      Top = 65
      Width = 40
      Height = 13
      Caption = 'Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label5: TLabel
      Left = 493
      Top = 65
      Width = 25
      Height = 13
      Caption = 'CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label6: TLabel
      Left = 2
      Top = 93
      Width = 51
      Height = 13
      Caption = 'Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label7: TLabel
      Left = 67
      Top = 93
      Width = 51
      Height = 13
      Caption = 'Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label8: TLabel
      Left = 195
      Top = 93
      Width = 40
      Height = 13
      Caption = 'Celular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label9: TLabel
      Left = 131
      Top = 93
      Width = 21
      Height = 13
      Caption = 'Fax'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label10: TLabel
      Left = 259
      Top = 93
      Width = 31
      Height = 13
      Caption = 'Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblNome: TLabel
      Left = 3
      Top = 25
      Width = 561
      Height = 13
      Caption = 
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblEndereo: TLabel
      Left = 3
      Top = 50
      Width = 561
      Height = 13
      Caption = 
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblBairro: TLabel
      Left = 3
      Top = 77
      Width = 241
      Height = 13
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblCidade: TLabel
      Left = 248
      Top = 77
      Width = 241
      Height = 13
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblCEP: TLabel
      Left = 493
      Top = 77
      Width = 65
      Height = 13
      Caption = '99.999-999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblFone1: TLabel
      Left = 3
      Top = 103
      Width = 61
      Height = 13
      Caption = '9999-9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblFone2: TLabel
      Left = 67
      Top = 103
      Width = 61
      Height = 13
      Caption = '9999-9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblFax: TLabel
      Left = 131
      Top = 103
      Width = 61
      Height = 13
      Caption = '9999-9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblCelular: TLabel
      Left = 195
      Top = 103
      Width = 61
      Height = 13
      Caption = '9999-9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblEmail: TLabel
      Left = 259
      Top = 103
      Width = 305
      Height = 13
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
  end
  object gbEquipamento: TGroupBox
    Left = 132
    Top = 125
    Width = 568
    Height = 112
    Caption = '[ Dados do Equipamento ]'
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    object Labelx: TLabel
      Left = 3
      Top = 12
      Width = 74
      Height = 13
      Caption = 'Equipamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Labelz: TLabel
      Left = 284
      Top = 84
      Width = 27
      Height = 13
      Hint = 'Abrir o M'#243'dulo de Manuten'#231#227'o de '#193'reas registradas.'
      Caption = #193'rea'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label21: TLabel
      Left = 3
      Top = 35
      Width = 76
      Height = 13
      Caption = 'Complemento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label22: TLabel
      Left = 3
      Top = 58
      Width = 115
      Height = 13
      Caption = 'Defeito / Opicionais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblEquipamento: TLabel
      Left = 3
      Top = 24
      Width = 561
      Height = 13
      Caption = 
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblComplemento: TLabel
      Left = 3
      Top = 47
      Width = 561
      Height = 13
      Caption = 
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblDefeito: TLabel
      Left = 3
      Top = 70
      Width = 561
      Height = 13
      Caption = 
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label24: TLabel
      Left = 3
      Top = 84
      Width = 95
      Height = 13
      Caption = 'N'#250'mero de S'#233'rie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblSerie: TLabel
      Left = 3
      Top = 96
      Width = 281
      Height = 13
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblArea: TLabel
      Left = 284
      Top = 96
      Width = 281
      Height = 13
      Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
  end
  object gbServico: TGroupBox
    Left = 132
    Top = 239
    Width = 568
    Height = 207
    Caption = '[ Dados do Servi'#231'o ]'
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    object lblSituacao: TLabel
      Left = 76
      Top = 12
      Width = 51
      Height = 13
      Hint = 'Abrir o M'#243'dulo de Manuten'#231#227'o de Situa'#231#245'es registradas.'
      Caption = 'Situa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblTecnicos: TLabel
      Left = 3
      Top = 48
      Width = 47
      Height = 13
      Hint = 'Abrir o M'#243'dulo de Manuten'#231#227'o de T'#233'cnicos registradas.'
      Caption = 'T'#233'cnico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblExecutante: TLabel
      Left = 298
      Top = 48
      Width = 65
      Height = 13
      Hint = 'Abrir o M'#243'dulo de Manuten'#231#227'o de T'#233'cnicos registradas.'
      Caption = 'Executante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label1: TLabel
      Left = 3
      Top = 125
      Width = 74
      Height = 13
      Caption = 'Observa'#231#245'es'
      Transparent = True
    end
    object Label11: TLabel
      Left = 3
      Top = 12
      Width = 45
      Height = 13
      Caption = 'Entrada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblEntrada: TLabel
      Left = 3
      Top = 31
      Width = 69
      Height = 13
      Caption = '99/99/9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object cbSitauacao: TComboBox
      Left = 76
      Top = 28
      Width = 186
      Height = 21
      Hint = 'Favor informar a Situa'#231#227'o do equipamento.'
      BevelKind = bkFlat
      Ctl3D = False
      ItemHeight = 13
      MaxLength = 50
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'XXXXXXXXXXXXXXXXXXXX'
    end
    object cbTecnico: TComboBox
      Left = 3
      Top = 64
      Width = 264
      Height = 21
      Hint = 'Favor informar o T'#233'cnico.'
      BevelKind = bkFlat
      Ctl3D = False
      ItemHeight = 13
      MaxLength = 50
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    end
    object cbExecutante: TComboBox
      Left = 298
      Top = 64
      Width = 264
      Height = 21
      Hint = 'Favor informar o T'#233'cnico.'
      BevelKind = bkFlat
      Ctl3D = False
      ItemHeight = 13
      MaxLength = 50
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    end
    object edtObs: TMemo
      Left = 3
      Top = 141
      Width = 559
      Height = 63
      Hint = 'Observa'#231#245'es adicionais do Funcion'#225'rio.'
      Ctl3D = False
      Lines.Strings = (
        'Campo de Observa'#231#245'es aaaaaaaaaaaaaaaa'
        'bbbbbbbbbbbbbbbb'
        
          'ddddddddddddddddd cccccccccccccccccccx xxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xx')
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnExit = edtObsExit
    end
    object edtOrdamento: TLabeledEdit
      Left = 265
      Top = 28
      Width = 112
      Height = 21
      Ctl3D = False
      EditLabel.Width = 63
      EditLabel.Height = 13
      EditLabel.Caption = 'Or'#231'amento'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 30
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object edtServico: TLabeledEdit
      Left = 4
      Top = 103
      Width = 558
      Height = 21
      Ctl3D = False
      EditLabel.Width = 106
      EditLabel.Height = 13
      EditLabel.Caption = 'Servi'#231'o Executado'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 120
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
  end
  object btnAlterar: TBitBtn
    Left = 4
    Top = 48
    Width = 126
    Height = 28
    Caption = 'Alterar O.S.'
    TabOrder = 1
    OnClick = btnAlterarClick
  end
end
