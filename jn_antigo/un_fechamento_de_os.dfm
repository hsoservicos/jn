object _fechamento_de_os: T_fechamento_de_os
  Left = 1272
  Top = 118
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Fechamento de Servi'#231'os'
  ClientHeight = 391
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblFechada: TLabel
    Left = 4
    Top = 44
    Width = 106
    Height = 23
    Caption = 'O.S. Fechada.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object gbServico: TGroupBox
    Left = 5
    Top = 4
    Width = 109
    Height = 37
    Caption = '[ Servi'#231'o N'#186' ]'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object edtOs: TEdit
      Left = 8
      Top = 15
      Width = 93
      Height = 14
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = clMoneyGreen
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = '9999999999'
      OnExit = edtOsExit
    end
  end
  object gbDadosServico: TGroupBox
    Left = 114
    Top = 4
    Width = 517
    Height = 92
    Caption = '[ Dados do Servi'#231'o ]'
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object lblSituacao: TLabel
      Left = 5
      Top = 49
      Width = 49
      Height = 13
      Cursor = crHandPoint
      Caption = 'Situa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblTecnicos: TLabel
      Left = 249
      Top = 13
      Width = 43
      Height = 13
      Cursor = crHandPoint
      Caption = 'T'#233'cnico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblEquipamento: TLabel
      Left = 200
      Top = 49
      Width = 74
      Height = 13
      Cursor = crHandPoint
      Caption = 'Equipamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object cbSituacao: TComboBox
      Left = 5
      Top = 65
      Width = 186
      Height = 21
      Hint = 'Favor informar a Situa'#231#227'o do equipamento.'
      BevelKind = bkFlat
      CharCase = ecUpperCase
      Ctl3D = False
      ItemHeight = 13
      MaxLength = 50
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = 'XXXXXXXXXXXXXXXXXXXX'
    end
    object cbTecnico: TComboBox
      Left = 249
      Top = 29
      Width = 264
      Height = 21
      Hint = 'Favor informar o T'#233'cnico.'
      BevelKind = bkFlat
      CharCase = ecUpperCase
      Ctl3D = False
      ItemHeight = 13
      MaxLength = 50
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    end
    object edtDataEntrada: TLabeledEdit
      Left = 96
      Top = 29
      Width = 70
      Height = 19
      Hint = 'Data de Entrada do Aparelho'
      Ctl3D = False
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = 'Entrada'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 10
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object edtNumero: TLabeledEdit
      Left = 6
      Top = 29
      Width = 84
      Height = 19
      Hint = 'Data de Entrada do Aparelho'
      Ctl3D = False
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = 'N'#186' da O.S.'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 10
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object edtOrcamento: TLabeledEdit
      Left = 169
      Top = 29
      Width = 70
      Height = 19
      Ctl3D = False
      EditLabel.Width = 63
      EditLabel.Height = 13
      EditLabel.Caption = 'Or'#231'amento'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 30
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
  end
  object gbDadosFechamento: TGroupBox
    Left = 114
    Top = 98
    Width = 517
    Height = 271
    Caption = '[ Dados do Fechamento do Servi'#231'o ]'
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    object Label2: TLabel
      Left = 292
      Top = 13
      Width = 49
      Height = 13
      Cursor = crHandPoint
      Hint = 'Abrir o M'#243'dulo de Manuten'#231#227'o de Situa'#231#245'es registradas.'
      Caption = 'Situa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object Label5: TLabel
      Left = 5
      Top = 122
      Width = 74
      Height = 13
      Caption = 'Observa'#231#245'es'
      Transparent = True
    end
    object lblExecutante: TLabel
      Left = 5
      Top = 50
      Width = 63
      Height = 13
      Cursor = crHandPoint
      Hint = 'Abrir o M'#243'dulo de Manuten'#231#227'o de T'#233'cnicos registradas.'
      Caption = 'Executante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object cbSituacaoAtual: TComboBox
      Left = 292
      Top = 29
      Width = 186
      Height = 21
      Hint = 'Favor informar a Situa'#231#227'o do equipamento.'
      BevelKind = bkFlat
      CharCase = ecUpperCase
      Ctl3D = False
      ItemHeight = 13
      MaxLength = 50
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Text = 'XXXXXXXXXXXXXXXXXXXX'
    end
    object edtObservacoes: TMemo
      Left = 5
      Top = 138
      Width = 508
      Height = 57
      Hint = 'Observa'#231#245'es adicionais do observadas pelo Funcion'#225'rio.'
      Ctl3D = False
      Lines.Strings = (
        'Campo de Observa'#231#245'es aaaaaaaaaaaaaaaa'
        'bbbbbbbbbbbbbbbb'
        
          'ddddddddddddddddd cccccccccccccccccccx xxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xx'
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object edtSaida: TLabeledEdit
      Left = 5
      Top = 29
      Width = 70
      Height = 21
      Hint = 'Data da Sa'#237'da do Aparelho'
      AutoSize = False
      Ctl3D = False
      EditLabel.Width = 32
      EditLabel.Height = 13
      EditLabel.Caption = 'Sa'#237'da'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 10
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = edtSaidaExit
    end
    object chkPago: TCheckBox
      Left = 78
      Top = 31
      Width = 59
      Height = 17
      Hint = 'Foi Pago ?'
      Caption = 'Pago ?'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnExit = chkPagoExit
    end
    object edtPrevisto: TLabeledEdit
      Left = 139
      Top = 29
      Width = 70
      Height = 21
      Hint = 'Data prevista para Pagamento.'
      AutoSize = False
      Ctl3D = False
      EditLabel.Width = 74
      EditLabel.Height = 13
      EditLabel.Caption = 'Pat'#186' Previsto'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 10
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnExit = edtPrevistoExit
    end
    object edtPago: TLabeledEdit
      Left = 214
      Top = 29
      Width = 70
      Height = 21
      Hint = 'Valor pago pelo servi'#231'o.'
      AutoSize = False
      Ctl3D = False
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = 'Valor Pago'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 30
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object edtServicoExecutado: TLabeledEdit
      Left = 5
      Top = 102
      Width = 508
      Height = 19
      Ctl3D = False
      EditLabel.Width = 106
      EditLabel.Height = 13
      EditLabel.Caption = 'Servi'#231'o Executado'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 120
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object cbExecutante: TComboBox
      Left = 5
      Top = 66
      Width = 264
      Height = 21
      Hint = 'Favor informar o T'#233'cnico.'
      BevelKind = bkFlat
      CharCase = ecUpperCase
      Ctl3D = False
      ItemHeight = 13
      MaxLength = 50
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    end
    object edtPortador: TLabeledEdit
      Left = 5
      Top = 211
      Width = 481
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      EditLabel.Width = 165
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome do Portaddor na Sa'#237'da'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 50
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
  end
  object stb: TStatusBar
    Left = 0
    Top = 371
    Width = 635
    Height = 20
    Panels = <
      item
        Width = 50
      end>
  end
  object btnFechar: TBitBtn
    Left = 6
    Top = 339
    Width = 107
    Height = 30
    Caption = 'Fechar O.S.'
    TabOrder = 4
    OnClick = btnFecharClick
    Glyph.Data = {
      0E060000424D0E06000000000000360000002800000016000000160000000100
      180000000000D8050000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F8BAD1B87AB27C5DA6615D
      A6627BB27DB7CFB5F8F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFF75AA7425A0362BC64D49E977
      5CFF9160FF9750EF7F30CC5528A33B75AA74FFFCFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFDEE3DB208F2931D25550EF7C56F0
      815BF48860F99064FD9661FA925CF78B57F68437D85F21902BDDE3DAFFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFDEE4DB0A89163FE06349E36D4C
      E5744EEA7847EE7757F4875EF78D5BF48A58F18352EB7C4FE97745E76D0E8A1A
      DDE4DAFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFDFF1C8B2336D8563FD960
      45DE6843E26A55E87BFBFEFC6CF1914EF07C56EF8154ED7D4FE8774AE37046DF
      693DDE601D8D26FFFDFFFFFFFFFFFFFF0000FFFFFFFFFFFF76AB751CBD3638D2
      553DD65B3AD95C50E271FAFEFBFFFFFFFFFFFF69ED8C4BE9754EE87549E47046
      E06A42DB633ED85E23C23D75AB75FFFFFFFFFFFF0000FFFFFFFAF8F91691202F
      CE4A34CD4F30D14F4BDA68F9FDFAFFFFFFFFFFFFFFFFFFFFFFFF7BEB9659E47B
      59E27947DD683CD75B3AD35735D452189324FDF9FBFFFFFF0000FFFFFFBAD2B9
      08A3182DC84426C7414DD565FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF7FE8975EE07A66DF7E4BD76732CE4D33CD4C0BA61FBDD4BCFFFFFF0000FFFF
      FF79B17915B5281FC03547CD5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF81E39562DC796BDB7F48D05F2AC64219B92F79AF79FFFFFF
      0000FFFFFF58A05913BA2632C143FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3F4D9
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80DF9167D8796FD87F2DC4411CC03158A0
      5AFFFFFF0000FFFFFF57A05801B113D1F1D4FFFFFFFFFFFFFFFFFFFFFFFFBAED
      C264D877A3E8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86DD9372D6804DCA5D13
      BA2758A059FFFFFF0000FFFFFF79AF7800A60D5CCB68EBF9ECFFFFFFFFFFFFBE
      EDC474D98382DC8E76DA85ADE9B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDD97
      61CE6D06AB1478B079FFFFFF0000FFFFFFBBD3BB008F006ED07584D78BF9FDFA
      C4ECC97CD88788DB938ADD948ADE9580DB8CB3E9BBFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF7DD786009100BBD3BAFFFFFF0000FFFFFFFCFAFB0282065CCB638FD9
      948ED99589D9908FDB9790DC9891DC9A92DE9A91DD9A89DB92B7E9BDFFFFFFFF
      FFFFFFFFFFF9FDF963CE6B028407FCF9FBFFFFFF0000FFFFFFFFFFFF70A97019
      A51FA0DFA496DA9A96DB9C97DC9D99DD9E98DD9F9ADD9F9ADEA099DE9F90DB97
      BCE9BFFFFFFFF5FCF69CDEA019A62071AA71FFFFFFFFFFFF0000FFFFFFFFFFFF
      FFFFFF037A0571CE76ABE1AEA1DDA3A1DEA5A1DEA6A2DFA6A2DFA7A2DFA7A2DF
      A7A2DFA699DC9EBFE8C1A9E1AD71CF76047B06FFFFFFFFFFFFFFFFFF0000FFFF
      FFFFFFFFFFFFFFE1E8E000710087D58ABAE7BCADE1B0ACE1AFACE1AFACE1AFAD
      E1B0ACE1B0ACE1AFAFE2B2B7E6B987D78B007200E0E8E0FFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFE1E8E00279034BB34CB5E6B6C7ECC8C0E8C2
      BEE6BFBEE6C0C1E8C2C7EBC9B5E7B74CB54E037A04E0E8E0FFFFFFFFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF69A7690B820B279C
      2868C16988D48988D48965C066289D290A820B69A769FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
      F9FAB4D1B46AAA6A4597454597456BAA6BB4D0B4FAF9FAFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
  end
end
