object _GS_Areas: T_GS_Areas
  Left = 295
  Top = 582
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Manuten'#231#227'o de '#193'reas'
  ClientHeight = 214
  ClientWidth = 328
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
  object Panel1: TPanel
    Left = 1
    Top = 0
    Width = 326
    Height = 112
    Caption = 'Panel1'
    TabOrder = 6
    object dbgAreas: TDBGrid
      Left = 1
      Top = 1
      Width = 324
      Height = 110
      Align = alClient
      Ctl3D = False
      DataSource = dsAreas
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = dbgAreasKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'SA_DESCRICAO'
          Title.Caption = 'Descri'#231#227'o da '#193'rea'
          Visible = True
        end>
    end
  end
  object dbnAreas: TDBNavigator
    Left = 3
    Top = 114
    Width = 152
    Height = 30
    Cursor = crHandPoint
    DataSource = dsAreas
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Flat = True
    Hints.Strings = (
      'Primeiro registro'
      'Registro anterior'
      'Proximo registro'
      'Ultimo registro')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object btnSair: TBitBtn
    Left = 252
    Top = 187
    Width = 75
    Height = 25
    Hint = 'Finaliza o modulo.'
    Caption = 'Sair'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Kind = bkClose
  end
  object gbDescricao: TGroupBox
    Left = 3
    Top = 144
    Width = 323
    Height = 43
    Caption = '[ Descri'#231#227'o da '#193'rea ]'
    TabOrder = 5
    object edtDescricao: TEdit
      Left = 4
      Top = 16
      Width = 315
      Height = 19
      Hint = 'Descri'#231#227'o de '#225'rea'
      CharCase = ecUpperCase
      Ctl3D = False
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
      TabOrder = 0
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      OnExit = edtDescricaoExit
    end
  end
  object btnNova: TBitBtn
    Left = 4
    Top = 187
    Width = 75
    Height = 25
    Hint = 'Registra um nova '#225'rea.'
    Caption = 'Nova'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btnNovaClick
  end
  object btnAlterar: TBitBtn
    Left = 80
    Top = 187
    Width = 75
    Height = 25
    Hint = 'Altera dados da '#225'rea.'
    Caption = 'Alterar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnAlterarClick
  end
  object btnExcluir: TBitBtn
    Left = 156
    Top = 187
    Width = 75
    Height = 25
    Hint = 'Exclus'#227'o de uma '#225'rea.'
    Caption = 'Excluir'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnExcluirClick
  end
  object pnlCodArea: TPanel
    Left = 156
    Top = 114
    Width = 172
    Height = 30
    Caption = 'pnlCodArea'
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dsAreas: TDataSource
    DataSet = _dm.qrGArea
    OnDataChange = dsAreasDataChange
    Left = 268
    Top = 62
  end
end
