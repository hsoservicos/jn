object _ConsultarServico: T_ConsultarServico
  Left = 305
  Top = 258
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Consultar Geral de Servi'#231'o'
  ClientHeight = 445
  ClientWidth = 707
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
  object gbFiltro: TGroupBox
    Left = 0
    Top = 0
    Width = 707
    Height = 200
    Align = alTop
    Caption = '[ Filtro para Consulta ]'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 222
      Top = 45
      Width = 8
      Height = 16
      Caption = #224
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 222
      Top = 69
      Width = 8
      Height = 16
      Caption = #224
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblCliente: TLabel
      Left = 4
      Top = 116
      Width = 113
      Height = 16
      Hint = 'Abrir o M'#243'dulo de Manuten'#231#227'o de Clientes registrados.'
      Alignment = taRightJustify
      Caption = 'Nome do Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblTecnicos: TLabel
      Left = 59
      Top = 142
      Width = 58
      Height = 16
      Hint = 'Abrir o M'#243'dulo de Manuten'#231#227'o de T'#233'cnicos registradas.'
      Alignment = taRightJustify
      Caption = 'T'#233'cnico:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblExecutante: TLabel
      Left = 35
      Top = 169
      Width = 81
      Height = 16
      Hint = 'Abrir o M'#243'dulo de Manuten'#231#227'o de T'#233'cnicos registradas.'
      Alignment = taRightJustify
      Caption = 'Executante:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblSituacao: TLabel
      Left = 348
      Top = 46
      Width = 64
      Height = 16
      Hint = 'Abrir o M'#243'dulo de Manuten'#231#227'o de Situa'#231#245'es registradas.'
      Alignment = taRightJustify
      Caption = 'Situa'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblArea: TLabel
      Left = 376
      Top = 70
      Width = 36
      Height = 16
      Hint = 'Abrir o M'#243'dulo de Manuten'#231#227'o de '#193'reas registradas.'
      Caption = #193'rea:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object lblEquipamento: TLabel
      Left = 322
      Top = 94
      Width = 90
      Height = 16
      Hint = 'Abrir o M'#243'dulo de Manuten'#231#227'o de Equipamentos registrados.'
      Alignment = taRightJustify
      Caption = 'Equipamento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = True
    end
    object sbConsulta: TSpeedButton
      Left = 405
      Top = 164
      Width = 103
      Height = 29
      Cursor = crHandPoint
      Caption = 'Consultar'
      Glyph.Data = {
        0E060000424D0E06000000000000360000002800000016000000160000000100
        180000000000D8050000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
        FFF5F6F4C8BFBAD2D0D2F2F6FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFC4BBB49891932270B24795D4E1E4EBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FFFFFD91959B4292CB00A0FA0089EC4590CDE0E2EBFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFF93B6D41999DB3BD0FF10AFFF0086EB3F8BCBE1
        E0E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFE3EAF466A5CF3BB2E73CC9FF0FAEFF
        0087EA478ECCECE8EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFE3E5EE5B9CCA35B1
        E73CC7FF0EAEFF008AEC5094CFDCE2EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFDC
        E0EA619ECB45B7EA3DC7FF0EAFFF0085E85194CFECEDF3FCF6F7EFE4E4EEE1DE
        EDE0DDF0E5E4F6F1F2FEFDFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFE3E3ED6EA3CF45B6E833C7FE0D98E9558ABEC0B6BAE4C4B4D8B2
        99D9B697D8B89CD8BCA7DAC0B7E5D2D1F8F4F6FFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFDBE0EC6BAAD336A5D9669FCBADA8A7C1A47EE8
        C38AF9DDA4FDEDB9FEF7C6F7EFC7E9D8B8D4B7A3D9C0BDF8F4F6FFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAE4F193B3D2AFA6A7CAB089
        EBCE8AFFE5A3FFECB8FFF1C5FFF9D1FFFFDBFFFFE3F7F3D2D3B69DDBC3C3FDFE
        FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E7E7D1A7
        8CE8BF7CFFDC96FFDCA0FFE5B3FFEDC0FFF5CCFFFBD5FFFCD9FFFFE1F5F0C3CD
        AB9AEDE5E8FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFE8
        D5CFDDA775FFD98DFFD390FFD99DFFE5B3FFEDC1FFF3CBFFF6D4FFF8D3FFF7CF
        FFFFD1DFC39CDBC6C3FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F9FAFEDDC3BBE1AB6AFFDC91FFD194FFDDABFFE7BBFFEDC6FFF1CEFFF3D3FFF6
        D3FFF2CAFFF6C3F0D4A1D4B6ACFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF8F7FCDABFB5E5B069FFE29FFFDFB1FFE2B9FFE7C0FFEBC6FFEFCEFF
        F0D1FFF1D5FFF0D2FFF0BEF4D192D3B0A3FEFFFF0000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFBF8FEDEC0B6E1AB6AFFEBB9FFE9CBFFE6C3FFE6C4FFE9C7
        FFECCDFFEDD0FFEED2FFF0D9FFF0C4EDC180D3B3ACFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6D4CBD7A372FFECBFFFEFDAFFEACEFFEB
        CEFFEACFFFEBD1FFECD2FFECD0FFF0DEFFF2C6DEAA73DDC6C8FFFFFF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE7E7D3A98DEFD3A6FFFFEDFF
        F0DEFFEED8FFEED8FFEED9FFEED9FFEDDBFFFFF5F7DDABCB997EF0EAF0FFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFFDFCBC7D3A889
        F5E9CBFFFFFCFFFCF6FFF9EFFFF9F0FFFEF4FFFFFEFCF0CFCF9E79DBC2C3FFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F8
        FADBC0BCCFA084EACDACFCF3DEFFFFF5FFFFF4FCF4DEEBCFADCC9C7DD6BBB6FC
        FCFDFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFBFAFCE5D6D8D2AD9FCFA084D0A17ED0A07ECE9E83D0AA9EE4D6D7
        FEFDFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFEF6F3F7F6F4F9FAFCFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
      OnClick = sbConsultaClick
    end
    object sbLimpar: TSpeedButton
      Left = 511
      Top = 164
      Width = 132
      Height = 29
      Cursor = crHandPoint
      Caption = 'Limpa consulta'
      Glyph.Data = {
        0E060000424D0E06000000000000360000002800000016000000160000000100
        180000000000D8050000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FCFCFCEDEDEDBEBEBED1D1D1E8E8E8F2F2F2FCFCFCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FDFD
        FDFFFFFFF9F9F9C0BEBED5D1D1CDCCCEB9BBB8B3B4B5B1B2B2B3B4B4BABBBBC5
        C6C6D2D3D3E0E1E1ECEFEFFBFEFEFFFFFFFFFFFFFFFFFFFDFDFDFCFCFCFEFEFE
        0000FFFFFFFCFCFCFFFFFFC9C6C7DAD4D4E0DDDDE6E2ECE6E4E4E1DEDEE0DDDE
        E0DDDDD9D7D7CECCCCC2BFBFBABABAAEADADBBBABAC5C5C5DCDCDCFEFEFEFDFD
        FDFFFFFF0000FDFDFDFEFEFEFFFFFFBFBABDDFDAD6E3DFDBAB9FB6DAD2D0E3DB
        DBE0D8D9DED6D8DFD7D9E0D9DAE3DCDEE7E1E2E4DEDFE3DDDEC8C4C5D4D4D4FF
        FFFFFCFCFCFEFEFE0000FDFEFEFEFFFFF8F8F7C7C0C4F0E8E4D2D1CBB1A9C198
        95B1C7C6CDD3CDD5E3DFD8E5DDD8EAE2DEEBE5DAD5D0D0CEC8C9D4CDCEBFBBBC
        FFFFFFFCFCFCFEFEFEFFFFFF0000FBFEFEFFFFFFF2F1F0D3CBCEEEE8E5F2F1EE
        A7A3B6CEC9DACAC9D47D74A2B1ADCF7777959191B06F718A504B4CD8D2D3E9E3
        E4E6E3E3FFFFFFFAFAFAFDFDFDFFFFFF0000FDFFFFFFFFFFEBE9E9D6D3D4F4F0
        EFDFDADBE0DBE1E6DEDDE0E1D3C8C7D3DEE0DFEDE7E8ECE5EAFCF9F2AAA6A50D
        0A0A373334C8C6C6FFFFFFFFFFFFFDFDFDFFFFFF0000FBFDFDFFFFFFE6E5E5E1
        E1DFEEECECF3EEF0F2ECE9EBE8F6F0EFE8F5EBF0F5EDEAEEE8ECEFE8EDF0ECE7
        F7F4F5FFFEFE6C6A6A0000002D2D2DB5B5B5FFFFFFFFFFFF0000FFFFFFFFFFFF
        E1E1E1E5E4E4F4F2F2F1EFEFEFEEEEF3EEEEF1ECEEF1EDEDF1ECEDF0EBECF0EB
        ECF0EBEDF0EAEBF1EBECEDE7E8EEEBEB8182823B3B3B414141E3E3E30000FFFF
        FFFFFFFFE0E0E0E8E7E7F6F4F4F3F1F1F6F4F4F6F0F1F5F0F1F4EFF0F3EEEFF3
        EEEFF3EEEFF4EFF0F1EEEEF2EFEFD8D6D6FFFFFFFFFFFFE6E6E68D8D8DA9A9A9
        0000FFFFFFFFFFFFDFDFDFEEEDEDEDEAEAE4E1E1F0EEEEF2ECEEFAF5F6F8F2F3
        F9F4F5F6F1F2F8F2F3F8F2F4F1F2F2EFEFEFD4D4D4FFFFFFFBFBFBFFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFDBDBDBEEEDEDF4F3F3F7F6F6EFEEEEE9E6E7E4E2
        E2E2E0E1E4E2E2F2F0F0E1DFE0DFDDDDECECECF0F0F0D8D8D8FFFFFFFFFFFFFE
        FEFEFEFEFEFDFDFD0000FFFFFFFFFFFFD8D8D8F2F2F2EFEFEFE4E4E4D5D5D5D3
        D4D4EAEBEBE1E1E1EAEAEAE4E5E4F1F2F2EEEEEEF1F1F1F2F2F2DDDDDDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFD8D8D8F4F4F4EFEFEFE5E5E5
        ECECECE5E5E5E6E6E6E4E4E4E9E9E9E2E2E2E9E9E9E5E5E5F0F0F0EEEEEEDFDF
        DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFD8D8D8F1F1F1F4F4
        F4DFDFDFDEDEDEDEDEDEE5E5E5DCDCDCE1E1E1F2F2F2E7E7E8E6E6E7EFEEEEED
        EDEDE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FDFDFDFFFFFFDBDBDBEF
        F1F0F7F8F4EFEEE9ECEFEFF2F5F2E9ECE9F6F9F5F2F5F6F0F3F5E3E2E1E9E7E1
        EDEAE9F0EFEEE1E3E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FEFEFEFFFFFF
        DBDBDBF4F2EFF1F2F3DDE4EDE2E6EAE8E7EAE5E5E8E9E8EBF0F0F3F2F5F7F8F8
        F8F7F7F6EEF5FEE9EDF2E5E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FDFD
        FDFFFFFFDCDCDCEFF3F7EDEAE8E9DDCDEBE2D7EEEBE5EFEAE2EDE7DDEBE5DBED
        E8E2F1F0EDF4F4F5FCF6EDF2EDE6E3E2E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FEFEFEFFFFFFDADADAF5F5FEE4CBACE0C292EAC8AAEBBB7DE6D3B0E9DEC9
        E5DAC6F6E9D7F8ECDDECE2D6DFD5C9EBE5DDEAE9E9FEFEFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FDFDFDFFFFFFD8D8D8F9FEFFCB9C5BB86F16B56802AD875AF8F1
        E3F1F5F8F4F7F9F3F5F6F3F4F5F4F5F7F8F9FBEDEEEEE5E5E5FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FEFEFEFFFFFFDADADAE7ECF0FFFFFDFEFFFFFAFFFFFF
        FFFEFDFCFCFBFCFAF9F8F6FAFBFBFAFAFAF8F8F8F8F8F8F0F0F0DDDDDDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0000FDFDFDFFFFFFDBDBDBCFD1CED6D4D8D7CFD7
        CFD2D0D1D2D6D3D1CFD1D2D0D1D3D3D2D2D2D5D5D5D5D5D5D5D5D5D2D2D2E0E0
        E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
      OnClick = sbLimparClick
    end
    object SpeedButton1: TSpeedButton
      Left = 646
      Top = 164
      Width = 57
      Height = 29
      Cursor = crHandPoint
      Caption = 'Sair'
      Glyph.Data = {
        0E060000424D0E06000000000000360000002800000016000000160000000100
        180000000000D805000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F4F0F5F1EBFFFA
        F6FFFEF9FFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFF0000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFB6CFDF09528600
        35680F4A6D2C5B77436C845E81937B96A29AA9B0A8B2B6E2DBDAFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6F0F45489B01756922A699D156094
        0060AA1272CC0C71C30067B7005EAD0053A2004D91004988003B7C446D7EFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2E5EF00518500214A0520
        450138620F75B8288BD9298DD9278CD9258AD82589D72287D82789DC026DD42E
        647FFFFFFEFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1E4EE00538709
        2F591832570B426E147ABF2B90DB2990D72B91D7278DD3278DD4268DD4268FD6
        0F7CD4285F7EFFFFF7FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDE2EC
        004B810D2F571531560A43701780C52D92DD2B92D92D95DA278ED52991D7288F
        D72A92D61783D91C5A7EFFFBF0FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFCDDFED004181112E551331570945731C86CC3096E02E94D8349CDF2A91D82D
        94D82C93D92B92D81F8BE0155881FFF3E9FFFFFF0000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFCFE1EA00396A0D234C13345C0A4A78218BCF2D88CD2170AB318BC4
        2F95D9329ADD3298DB2E96DA2893E6115681FCEBE4FFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC0C9D300481C0D302F0B1F4F0E4E82177FC2166FB90454
        9A1A5F932C8BCB37A0E4379CDE3297DA2E99EA0E5581F4E5DDFFFFFF0000FEFE
        FEFFFFFFFFFFFFD1DCD18EBA935B9C6C2CA13A4AA3500B31250543751477C13A
        8DCF3E93D41D65A12584C53EA5E63BA2E2349BDC35A0EE095588EADFD5FFFFFF
        0000FEFEFEFFFFFFBDD3BA339C390F981D2FBA3F6EDD8280E69357B15D116473
        1D7DD276ACDA83B0D53A8CC32D94D742A6E641A7E5369DDD3BA7F005568CE2D7
        CFFFFFFF0000FFFFFFD4E3D4229A260AB81E2ECC474CCE5A6DD67F87E69B75D5
        7D1C7C7E2A8EE34DA4E04C9DD549ADE8379FE23FA5E644ABE9349DE03FACF400
        5991D8D0C9FFFFFF0000FFFFFF64B46300A0001FA72A5BB461429C673AAD4D67
        CC711B603D0B568733A1EB33A4E933A9E745B8F2319EE341B0E745B5EC34A1DE
        3CB0F8005996CAC9C4FFFFFF0000FFFFFF169415329F34BFDEBDD3DEDB558EAF
        006723215E4300234E0758995FB4E2ACCCDEA8C4DCC0DCE0C1D7DDAAC1DFB2CB
        E0C6D6DDAFD9E600599FBEC1C1FFFFFF0000F0F8EF2D882FD5DDD4FFFFFFF2F8
        FF4B8AB600364A112B540A2F5E10679A77B5E2AEA0E7B4A2EE9E8FECB4A5ED82
        72EBBEB1EFC5B2F4F1EDE70059A1B6BBBCFFFFFF0000FAFCFAD3E3D3FFFFFFFF
        FFFFE9F4F9367DA600285916345C08315A18709E78B5E7766DEB9B96F88483F4
        9594F5746FF3C9CDF99791FFF8EEEB0062ABACB3B8FFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFE7F2F83075A1002C5715355A07315B1E77A57DB5EC695EE98A85
        F66E6AF2837EF4625EF08684FF9480D1B0BDC6006DB3A0ADB3FFFFFF0000FFFF
        FFFFFFFFFFFFFFFFFFFFE7F1F7306E9D012B5217355A09345B1B76AB98CDF1B1
        A7F19B98FDC0C0FAD9D8FAC2BEF5D9CCF2EEDCCB73CCF60672B694A5AEFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFE6EFF5245F8E001A4305274C002A521B78B2
        B6DDE8FFFFD2FFFFDBFFFDDAFFF7DCEBF0E1D5E9EA91D4F357CBFF006EBD8097
        A0FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFEBF1F5507FA91759922B6A9C1759
        8D0F6DB23DADF735A2E71C92DF0281D50075CB006ABB0064AD005EA2015A960F
        5186BACCD5FFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEFEFDFBFFFFFFFFFFFFFF
        FFFFB3C9D900528E005A961F69984278A1668BAB719AB483AAC0A6C1D0C5D5DF
        E5EDF0FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFDFFFFFEFEFEFFFFFE
        FFFFFEFFFFFFFFFFFFF5F8F8F9F9F8FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF0000}
      OnClick = SpeedButton1Click
    end
    object edtOS: TLabeledEdit
      Left = 122
      Top = 19
      Width = 79
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = True
      EditLabel.Width = 71
      EditLabel.Height = 14
      EditLabel.BiDiMode = bdRightToLeft
      EditLabel.Caption = 'N'#186' da O.S.:'
      EditLabel.ParentBiDiMode = False
      EditLabel.Transparent = True
      LabelPosition = lpLeft
      LabelSpacing = 8
      ParentCtl3D = False
      TabOrder = 0
    end
    object dtEIni: TDateTimePicker
      Left = 122
      Top = 43
      Width = 98
      Height = 21
      Hint = 'Data Inicial de Entrada'
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkFlat
      CalAlignment = dtaRight
      Date = 29221.519183657410000000
      Time = 29221.519183657410000000
      MaxDate = 109939.000000000000000000
      MinDate = 27395.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object dtEFim: TDateTimePicker
      Left = 235
      Top = 43
      Width = 98
      Height = 21
      Hint = 'Data Final de Entrada'
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkFlat
      CalAlignment = dtaRight
      Date = 39840.519183657410000000
      Time = 39840.519183657410000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object dtSIni: TDateTimePicker
      Left = 122
      Top = 67
      Width = 98
      Height = 21
      Hint = 'Data Inicial de Sa'#237'da'
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkFlat
      CalAlignment = dtaRight
      Date = 39840.519183657410000000
      Time = 39840.519183657410000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
    object dtSFim: TDateTimePicker
      Left = 235
      Top = 67
      Width = 98
      Height = 21
      Hint = 'Data Final de Sa'#237'da'
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkFlat
      CalAlignment = dtaRight
      Date = 39840.519183657410000000
      Time = 39840.519183657410000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
    end
    object edtSerie: TLabeledEdit
      Left = 122
      Top = 90
      Width = 79
      Height = 22
      Hint = 'Informe o N'#250'mero de S'#233'rie do equipamento a ser concultado.'
      CharCase = ecUpperCase
      Ctl3D = True
      EditLabel.Width = 77
      EditLabel.Height = 14
      EditLabel.BiDiMode = bdRightToLeft
      EditLabel.Caption = 'N'#186' de S'#233'rie:'
      EditLabel.ParentBiDiMode = False
      EditLabel.Transparent = True
      LabelPosition = lpLeft
      LabelSpacing = 8
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
    end
    object cbClientes: TComboBox
      Left = 122
      Top = 114
      Width = 427
      Height = 22
      Hint = 'Favor informar o Nome do Cliente.'
      CharCase = ecUpperCase
      Ctl3D = True
      ItemHeight = 14
      MaxLength = 50
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    end
    object cbTecnico: TComboBox
      Left = 122
      Top = 140
      Width = 264
      Height = 22
      Hint = 'Favor informar o T'#233'cnico.'
      CharCase = ecUpperCase
      Ctl3D = True
      ItemHeight = 14
      MaxLength = 50
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    end
    object cbExecutante: TComboBox
      Left = 122
      Top = 167
      Width = 264
      Height = 22
      Hint = 'Favor informar o T'#233'cnico executante.'
      CharCase = ecUpperCase
      Ctl3D = True
      ItemHeight = 14
      MaxLength = 50
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    end
    object cbSituacao: TComboBox
      Left = 418
      Top = 43
      Width = 218
      Height = 22
      Hint = 'Favor informar a Situa'#231#227'o do equipamento.'
      CharCase = ecUpperCase
      Ctl3D = True
      ItemHeight = 14
      MaxLength = 50
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      Text = 'XXXXXXXXXXXXXXXXXXXX'
    end
    object cbArea: TComboBox
      Left = 418
      Top = 67
      Width = 192
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = True
      ItemHeight = 14
      MaxLength = 50
      ParentCtl3D = False
      TabOrder = 13
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    end
    object cbEquipamento: TComboBox
      Left = 418
      Top = 90
      Width = 192
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = True
      ItemHeight = 14
      MaxLength = 50
      ParentCtl3D = False
      TabOrder = 14
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    end
    object cbxOS: TCheckBox
      Left = 307
      Top = 21
      Width = 119
      Height = 17
      Caption = 'O.S. em Branco'
      TabOrder = 2
    end
    object cbEntrada: TCheckBox
      Left = 7
      Top = 45
      Width = 110
      Height = 17
      Caption = 'Data Entrada:'
      TabOrder = 5
      OnClick = cbEntradaClick
    end
    object cbSaida: TCheckBox
      Left = 21
      Top = 69
      Width = 97
      Height = 17
      Caption = 'Data Sa'#237'da:'
      TabOrder = 8
      OnClick = cbSaidaClick
    end
    object edtOS1: TLabeledEdit
      Left = 222
      Top = 19
      Width = 79
      Height = 22
      CharCase = ecUpperCase
      Ctl3D = True
      EditLabel.Width = 8
      EditLabel.Height = 14
      EditLabel.BiDiMode = bdRightToLeft
      EditLabel.Caption = #224
      EditLabel.ParentBiDiMode = False
      EditLabel.Transparent = True
      LabelPosition = lpLeft
      LabelSpacing = 8
      ParentCtl3D = False
      TabOrder = 1
    end
    object cbxEntrada: TCheckBox
      Left = 429
      Top = 21
      Width = 144
      Height = 17
      Caption = 'Entrada em Branco'
      TabOrder = 3
    end
    object cbxSaida: TCheckBox
      Left = 577
      Top = 21
      Width = 128
      Height = 17
      Caption = 'Sa'#237'da em Branco'
      TabOrder = 4
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 232
    Width = 707
    Height = 213
    Align = alBottom
    BevelInner = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 1
    object dbgServicos: TDBGrid
      Left = 4
      Top = 4
      Width = 695
      Height = 201
      Align = alClient
      Ctl3D = False
      DataSource = dsServ
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = dbgServicosCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'OS'
          Width = 66
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DataEntrada'
          Title.Caption = 'Entrada'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Complemento'
          Width = 120
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DataSaida'
          Title.Caption = 'Sa'#237'da'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor Pago'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Situacao'
          Title.Alignment = taCenter
          Title.Caption = 'S'
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Area'
          Title.Alignment = taCenter
          Title.Caption = 'A'
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Equipamento'
          Title.Alignment = taCenter
          Title.Caption = 'Eqp'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ServicoExecutado'
          Title.Caption = 'Servi'#231'o Executado'
          Width = 220
          Visible = True
        end>
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 481
    Top = 202
    Width = 224
    Height = 30
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
    TabOrder = 2
  end
  object pnlInforme: TPanel
    Left = 2
    Top = 202
    Width = 362
    Height = 30
    Caption = '>>> N'#195'O FOI ENCONTRADO NENHUM DADO <<<'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object dsServ: TDataSource
    DataSet = _dm.qr07
    Left = 616
    Top = 335
  end
end
