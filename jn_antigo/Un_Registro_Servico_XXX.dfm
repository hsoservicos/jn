object _Registro_Servico: T_Registro_Servico
  Left = 330
  Top = 103
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Registro de Servi'#231'o'
  ClientHeight = 493
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 6
    Top = 351
    Width = 133
    Height = 29
    Caption = 'Nova O.S.'
    OnClick = SpeedButton1Click
  end
  object gbOS: TGroupBox
    Left = 4
    Top = 3
    Width = 136
    Height = 218
    Caption = '[ Servi'#231'os ]'
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object dbgOS: TDBGrid
      Left = 2
      Top = 15
      Width = 132
      Height = 201
      Align = alClient
      Ctl3D = False
      DataSource = dsServ
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Verdana'
      TitleFont.Style = []
      OnKeyPress = dbgOSKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'OS'
          Title.Caption = 'O.S. N'#186
          Width = 110
          Visible = True
        end>
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 6
    Top = 224
    Width = 132
    Height = 25
    Cursor = crHandPoint
    DataSource = dsServ
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Flat = True
    Ctl3D = False
    Hints.Strings = (
      'Primeiro registro'
      'Registro anterior'
      'Proximo registro'
      'Ultimo registro')
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object gbCliente: TGroupBox
    Left = 141
    Top = 3
    Width = 517
    Height = 164
    Caption = '[ Dados do Cliente ]'
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    object lblCliente: TLabel
      Left = 5
      Top = 15
      Width = 94
      Height = 13
      Hint = 'Abrir o M'#243'dulo de Manuten'#231#227'o de Clientes registrados.'
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
      OnClick = lblClienteClick
    end
    object cbClientes: TComboBox
      Left = 5
      Top = 31
      Width = 427
      Height = 21
      BevelKind = bkFlat
      Ctl3D = False
      ItemHeight = 13
      MaxLength = 50
      ParentCtl3D = False
      TabOrder = 0
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    end
    object edtEndereco: TLabeledEdit
      Left = 5
      Top = 70
      Width = 506
      Height = 18
      Hint = 'Nome da rua'
      Ctl3D = False
      EditLabel.Width = 53
      EditLabel.Height = 13
      EditLabel.Caption = 'Endere'#231'o'
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
      TabOrder = 1
    end
    object edtBairro: TLabeledEdit
      Left = 7
      Top = 105
      Width = 217
      Height = 18
      Hint = 'Nome do bairro'
      Ctl3D = False
      EditLabel.Width = 35
      EditLabel.Height = 13
      EditLabel.Caption = 'Bairro'
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
      TabOrder = 2
    end
    object edtCidade: TLabeledEdit
      Left = 224
      Top = 105
      Width = 217
      Height = 18
      Hint = 'Nome da Cidade ou Municipio'
      Ctl3D = False
      EditLabel.Width = 40
      EditLabel.Height = 13
      EditLabel.Caption = 'Cidade'
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
      TabOrder = 3
    end
    object edtCEP: TLabeledEdit
      Left = 441
      Top = 105
      Width = 70
      Height = 18
      Hint = 'C'#243'digo de endere'#231'amento postal'
      Ctl3D = False
      EditLabel.Width = 23
      EditLabel.Height = 13
      EditLabel.Caption = 'CEP'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 10
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Text = '99.999-999'
    end
    object edtFone1: TLabeledEdit
      Left = 7
      Top = 139
      Width = 66
      Height = 18
      Hint = '1'#186' N'#250'mero do telefone de contato'
      Ctl3D = False
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = 'Telefone'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 9
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Text = '9999.9999'
    end
    object edtFone2: TLabeledEdit
      Left = 73
      Top = 139
      Width = 66
      Height = 18
      Hint = '2'#186' N'#250'mero do telefone de contato'
      Ctl3D = False
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = 'Telefone'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 8
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Text = '9999.9999'
    end
    object edtFax: TLabeledEdit
      Left = 139
      Top = 139
      Width = 66
      Height = 18
      Hint = 'N'#250'mero do fax de contato'
      Ctl3D = False
      EditLabel.Width = 20
      EditLabel.Height = 13
      EditLabel.Caption = 'Fax'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 8
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      Text = '9999.9999'
    end
    object edtCelular: TLabeledEdit
      Left = 205
      Top = 139
      Width = 66
      Height = 18
      Hint = 'N'#250'mero do celular de contato'
      Ctl3D = False
      EditLabel.Width = 41
      EditLabel.Height = 13
      EditLabel.Caption = 'Celular'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 9
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      Text = '9999.9999'
    end
    object edtEmail: TLabeledEdit
      Left = 271
      Top = 139
      Width = 240
      Height = 18
      Hint = 'Endere'#231'o de e-mail'
      CharCase = ecLowerCase
      Ctl3D = False
      EditLabel.Width = 31
      EditLabel.Height = 13
      EditLabel.Caption = 'Email'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 50
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
  end
  object rgConsultar: TRadioGroup
    Left = 4
    Top = 251
    Width = 136
    Height = 97
    Caption = '[ Consultar Servi'#231'o ]'
    Ctl3D = False
    ItemIndex = 0
    Items.Strings = (
      'Todas O.S.'
      'O.S. N'#186
      'Cliente'
      'N'#186' de S'#233'rie')
    ParentCtl3D = False
    TabOrder = 3
    OnClick = rgConsultarClick
  end
  object gbEquipamento: TGroupBox
    Left = 141
    Top = 169
    Width = 517
    Height = 133
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
    object lblEquipamento: TLabel
      Left = 5
      Top = 15
      Width = 74
      Height = 13
      Hint = 'Abrir o M'#243'dulo de Manuten'#231#227'o de Equipamentos registrados.'
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
      OnClick = lblEquipamentoClick
    end
    object lblArea: TLabel
      Left = 227
      Top = 89
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
      OnClick = lblAreaClick
    end
    object cbEquipamento: TComboBox
      Left = 5
      Top = 31
      Width = 260
      Height = 21
      BevelKind = bkFlat
      Ctl3D = False
      ItemHeight = 13
      MaxLength = 50
      ParentCtl3D = False
      TabOrder = 0
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    end
    object edtDefeito: TLabeledEdit
      Left = 5
      Top = 70
      Width = 506
      Height = 18
      Hint = 'Dados do defeito informado pelo cliente e/ou dados opicionais.'
      Ctl3D = False
      EditLabel.Width = 112
      EditLabel.Height = 13
      EditLabel.Caption = 'Defeito / Opicionais'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 100
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object edtSerie: TLabeledEdit
      Left = 5
      Top = 105
      Width = 217
      Height = 18
      Hint = 'N'#250'mero de S'#233'rie do Equipamento.'
      Ctl3D = False
      EditLabel.Width = 97
      EditLabel.Height = 13
      EditLabel.Caption = 'N'#250'mero de S'#233'rie'
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
      TabOrder = 2
    end
    object edtComplemento: TLabeledEdit
      Left = 266
      Top = 31
      Width = 245
      Height = 18
      Hint = 'Complemento do equipamento'
      Ctl3D = False
      EditLabel.Width = 80
      EditLabel.Height = 13
      EditLabel.Caption = 'Complemento'
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 50
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object cbArea: TComboBox
      Left = 227
      Top = 105
      Width = 283
      Height = 21
      BevelKind = bkFlat
      Ctl3D = False
      ItemHeight = 13
      MaxLength = 50
      ParentCtl3D = False
      TabOrder = 4
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    end
  end
  object gbServico: TGroupBox
    Left = 141
    Top = 304
    Width = 517
    Height = 186
    Caption = '[ Dados do Servi'#231'o ]'
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 5
    object lblSituacao: TLabel
      Left = 5
      Top = 15
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
      OnClick = lblSituacaoClick
    end
    object lblTecnicos: TLabel
      Left = 249
      Top = 15
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
      OnClick = lblTecnicosClick
    end
    object lblExecutante: TLabel
      Left = 249
      Top = 54
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
      OnClick = lblExecutanteClick
    end
    object Label1: TLabel
      Left = 7
      Top = 94
      Width = 74
      Height = 13
      Caption = 'Observa'#231#245'es'
      Transparent = True
    end
    object cbSitauacao: TComboBox
      Left = 5
      Top = 31
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
    object LabeledEdit2: TLabeledEdit
      Left = 7
      Top = 71
      Width = 217
      Height = 18
      Ctl3D = False
      EditLabel.Width = 35
      EditLabel.Height = 13
      EditLabel.Caption = 'Bairro'
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
    object cbTecnico: TComboBox
      Left = 249
      Top = 31
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
      Left = 249
      Top = 70
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
      Left = 7
      Top = 110
      Width = 505
      Height = 70
      Hint = 'Observa'#231#245'es adicionais do Funcion'#225'rio.'
      Ctl3D = False
      Lines.Strings = (
        'Campo de Observa'#231#245'es'
        'aaaaaaaaaaaaaaaa'
        'bbbbbbbbbbbbbbbb'
        
          'ddddddddddddddddd cccccccccccccccccccx xxxxxxxxxxxxxxxxxxxxxxxxx' +
          'xx')
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
  end
  object gbConsultaOS: TGroupBox
    Left = 530
    Top = 51
    Width = 128
    Height = 46
    Caption = '[ Informe o N'#186' da O.S. ]'
    Color = clAqua
    ParentColor = False
    TabOrder = 6
    Visible = False
    object edtConsultaOS: TEdit
      Left = 14
      Top = 19
      Width = 99
      Height = 19
      Hint = 'Favor informar o N'#250'mero da Ordem de Servi'#231'o a ser consultado.'
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '000000000000000'
      OnExit = edtConsultaOSExit
    end
  end
  object gbConsultaCliente: TGroupBox
    Left = 267
    Top = 3
    Width = 391
    Height = 47
    Caption = '[ Informe o Nome do Cliente ]'
    Color = clAqua
    ParentColor = False
    TabOrder = 7
    Visible = False
    object cbConsultaCliente: TComboBox
      Left = 7
      Top = 17
      Width = 376
      Height = 21
      BevelKind = bkFlat
      Ctl3D = False
      ItemHeight = 13
      MaxLength = 50
      ParentCtl3D = False
      TabOrder = 0
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      OnExit = cbConsultaClienteExit
    end
  end
  object gbConsultaSerie: TGroupBox
    Left = 529
    Top = 97
    Width = 129
    Height = 46
    Caption = '[ Informe o N'#186' da S'#233'rie ]'
    Color = clAqua
    ParentColor = False
    TabOrder = 8
    Visible = False
    object edtConsultaSerie: TEdit
      Left = 15
      Top = 19
      Width = 99
      Height = 19
      Hint = 'Favor informar o N'#250'mero de S'#233'rie a ser consultado.'
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '000000000000000'
      OnExit = edtConsultaSerieExit
    end
  end
  object dsServ: TDataSource
    DataSet = _dm.qr06
    OnDataChange = dsServDataChange
    Left = 64
    Top = 61
  end
end
