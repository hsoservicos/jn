object _baixa_de_os: T_baixa_de_os
  Left = 560
  Top = 765
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Baixa de Ordem de Servi'#231'o'
  ClientHeight = 226
  ClientWidth = 597
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
  object lblServicos: TLabel
    Left = 137
    Top = 56
    Width = 16
    Height = 15
    Caption = 'Foi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblOS: TLabel
    Left = 137
    Top = 102
    Width = 26
    Height = 14
    Caption = 'lblOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object g: TGauge
    Left = 3
    Top = 189
    Width = 590
    Height = 15
    BorderStyle = bsNone
    Progress = 0
  end
  object Label1: TLabel
    Left = 561
    Top = 56
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Caption = 'Label1'
    Transparent = True
  end
  object Label2: TLabel
    Left = 137
    Top = 122
    Width = 450
    Height = 14
    Caption = 
      '1234567890123456789012345678901234567890123456789012345678901234' +
      '56789012345'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object gbCliente: TGroupBox
    Left = 3
    Top = 3
    Width = 436
    Height = 51
    Caption = '[ Dados do Cliente ]'
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object lblCliente: TLabel
      Left = 5
      Top = 13
      Width = 94
      Height = 13
      Cursor = crHandPoint
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
    end
    object cbClientes: TComboBox
      Left = 5
      Top = 26
      Width = 427
      Height = 21
      Hint = 'Informar o Nome do Cliente registrado ou de um Novo Cliente.'
      BevelKind = bkFlat
      CharCase = ecUpperCase
      Ctl3D = False
      ItemHeight = 13
      MaxLength = 50
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      OnExit = cbClientesExit
    end
  end
  object lbServicos: TListBox
    Left = 3
    Top = 56
    Width = 132
    Height = 132
    Ctl3D = False
    ItemHeight = 13
    Items.Strings = (
      '000000 - R$ 99,999.99'
      '111111 - R$ 99,999.99'
      '222222 - R$ 99,999.99'
      '333333 - R$ 99,999.99'
      '444444 - R$ 99,999.99'
      '555555 - R$ 99,999.99'
      '666666 - R$ 99,999.99'
      '777777 - R$ 99,999.99'
      '888888 - R$ 99,999.99'
      '999999 - R$ 99,999.99')
    MultiSelect = True
    ParentCtl3D = False
    TabOrder = 1
  end
  object gbServico: TGroupBox
    Left = 438
    Top = 3
    Width = 157
    Height = 51
    Caption = '[ Baixa de Servi'#231'o ]'
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    object edtDataSaida: TLabeledEdit
      Left = 5
      Top = 29
      Width = 70
      Height = 19
      Hint = 'Data da Sa'#237'da do Aparelho'
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
      Text = '99/99/9999'
    end
    object edtPago: TLabeledEdit
      Left = 81
      Top = 29
      Width = 70
      Height = 19
      Hint = 'Valor pago pelo servi'#231'o.'
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
      TabOrder = 1
      Text = '999.999,99'
    end
  end
  object stb: TStatusBar
    Left = 0
    Top = 206
    Width = 597
    Height = 20
    Panels = <
      item
        Width = 50
      end>
  end
  object btnTotalizar: TBitBtn
    Left = 137
    Top = 71
    Width = 90
    Height = 30
    Caption = 'Totalizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnTotalizarClick
    Glyph.Data = {
      0E060000424D0E06000000000000360000002800000016000000160000000100
      180000000000D8050000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFE0BF9CDBB287E0B68AE0B68AE0B68AE0B68AE0
      B68AE0B68AE0B68AE0B68ADBB287E0BF9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFD7AD80F4DBC9FFF8F4D8D5E6DBD6E6DEDAE8
      DBD5E6DCD5E5DDD8E6DDD4E5DBD4E4FFF4F1F4D8C6D7AD80FFFFFFFFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFD9AD82FFFBF25F8DBB24B2E829B1
      E61D94D923B4E81DB4E91489D415B3E907A9E84B85BAFFF6EDD9AC80FFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFDAB187FFEBD83A95CC64
      F9FF59E8FE3CB4E850EFFF4BEEFF2FA8E23EEBFF34ECFF288ECAFFE4CDDAB086
      FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFDAB188FFEDDA
      3E8BC949BDEB44B5E53297D941B9E83EB7E92A8FD636B5E92FB6EB3588C6FFE6
      CDDAB187FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFDAB1
      88FFEEDF4595CD77ECFE69DCF646AEE366E3FB60E2FB38A2DE55E0FB4DE0FE36
      8FCAFFE8D1DAB087FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
      FFFFDAB189FFF1E24D9CCF95FFFF84F2FD54BAE782FAFF7BF9FF43ACE26FF6FF
      65F6FF3C96CCFFE9D6DAB186FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
      FFFFFFFFFFFFDAB188FFF6E74089CA54B1E34EAADF3691D54EADE14BADE12F8B
      D346ACE140ABE33783C7FFEEDADAB187FFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
      FFFFFFFFFFFFFFFFFFFFDAB288FFF6EB58A1D2B4FFFF9EF7FD62BDE79EFFFF98
      FFFF4EAEE18BFDFF84FDFF469AD0FFEEDFDAB188FFFFFFFFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFDAB288FFFAF14088C7B4FFFFACFFFF64BFE9
      ABFFFFA5FFFF4DB0E399FFFF87FDFF3283C6FFF3E2DAB188FFFFFFFFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFD9B189FFFAF4ECE3E17499CE789B
      CD82A4D27999CB7A99CB81A1CD7B98C87997C8E4D7D3FFF3E8D9B188FFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFD9B389FFFEFDF5D3BBF5
      B990F6BC92F6BB92F6BB91F6BA90F6B990F6B98EF5B587F8D2B7FFF6F0D9B188
      FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFD9B38AFFFFFF
      D7742CF7B16DF4B273F4B479F4B57AF4B376F4AF6EF5A964F7A557D8762DFFFC
      FBD9B289FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFDAB4
      8AFFFFFFDF8946FFCF9CFED0A2FED3A9FED4AAFED2A5FECD9BFEC68EFFC281DF
      8137FFFCFEDAB289FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
      FFFFDAB38BFFFFFFDF8B4CFFD6AAFDD7B1FDDBBAFDDCBCFDD9B5FDD3AAFDCC9A
      FFC78CDF833DFFFFFFDAB38AFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
      FFFFFFFFFFFFDAB48BFFFFFFDF8E52FFDFBBFDE1C5FDE7D1FDE9D3FDE4CAFDDC
      BAFDD4A9FFCD99DF8542FFFFFFDAB38AFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
      FFFFFFFFFFFFFFFFFFFFDAB58CFFFFFFD98041FBD6B1F8DBC0F8E3D0F8E5D4F8
      DDC6F8D4B2F9CA9DFBC28BD97F3CFFFFFFD9B38AFFFFFFFFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFD8B288FFFFFFEFD5C3E3AF8DE4B291E4B292
      E4B292E4B291E4B291E4B291E2AD8AF0D6C6FFFFFFD8B187FFFFFFFFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFD7AD7FF2E6D9FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E5D8D7AD80FFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0BF9BDAB389DA
      B48BDAB48BDAB48BDAB48BDAB48BDAB48BDAB48BDAB48BDAB389E0BF9BFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
  end
  object edtPortador: TLabeledEdit
    Left = 229
    Top = 82
    Width = 326
    Height = 19
    Hint = 'Portador na Sa'#237'da de Servi'#231'o'
    CharCase = ecUpperCase
    Ctl3D = False
    EditLabel.Width = 87
    EditLabel.Height = 13
    EditLabel.Caption = 'Portador na Sa'#237'da'
    EditLabel.Transparent = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    LabelSpacing = 0
    MaxLength = 50
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnExit = edtPortadorExit
  end
  object btnFechar: TBitBtn
    Left = 493
    Top = 152
    Width = 102
    Height = 36
    Caption = 'Fechar O.S.'#39's'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnFecharClick
    Glyph.Data = {
      0E060000424D0E06000000000000360000002800000016000000160000000100
      180000000000D8050000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5EBE3AFCEAE82BE876FB87870
      B97883BE88ADCDACE5EBE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEFE97FB7813BAF4D36C85746E170
      51F18154F4864CE7783BCD5D3DB1517FB781EAEEE8FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFC7D9C53DA3472FC94F4DEB7657F3
      835AF58858F98B5AFC8F60FB915EF98D53F28035CF583EA64AC6D9C4FFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFC8DAC7279C3337D6584AE56F4D
      E67350EB7A53F08089F8AB9AFBB860F58E53F08153EC7D50EB793DDC622A9F37
      C8DAC6FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFEBF0EA399F412FCE4D41DB62
      45DE6848E36E48E772AFF7C3FFFFFFFFFFFFCCFBD959EE814AE8734BE37048E2
      6B36D5563BA144EBF0EAFFFFFFFFFFFF0000FFFFFFFFFFFF7EB57F1CB6323AD5
      573ED65C3FDB6040DF65ADF3BEFFFFFFFFFFFFFFFFFFFFFFFFCCF8D850E57541
      DF6643DC6440DB6022BB3A7EB67FFFFFFFFFFFFF0000FFFFFFE8EEE72B9F362C
      CB4535CE4F36D2533FD85EAEF0BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      CCF6D64EDE6E38D7593AD35732D14E2EA23AEAEEE8FFFFFF0000FFFFFFADCDAD
      15A7252EC9452ECA4846D35FB5EFC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFD2F5D951D96C31CF4D33CF4E19AB2BAECEAEFFFFFF0000FFFF
      FF7CB87F16B12727C33D3CCB52A3E7AEFFFFFFFFFFFFFFFFFFCDF4D5F7FDF8FF
      FFFFE5FAEAF5FDF7FFFFFFFFFFFFD1F4D748D15E2BC8431AB42D7CB87EFFFFFF
      0000FFFFFF63AD6610B2212FC2415DD26DB4EBBCFFFFFFFFFFFFB0ECBB88E49A
      FBFEFBFFFFFFC0F1CA97E7A6F8FDF9FFFFFFFBFEFB70D88032C64615B62864AE
      67FFFFFF0000FFFFFF62AD650AAD1949C75675D7817FDA8BBBECC2AAE8B371DA
      8194E4A1FCFEFCFFFFFFCAF2D16FDB819FE7ABD2F3D7AEE8B677D8854CCA5B0F
      B22163AD66FFFFFF0000FFFFFF7BB77C07A51460CD6A7ED7897BD78676D88479
      D9877CDB8A9BE4A5FCFEFCFFFFFFCDF2D27DDC8B7CDC8A7DDA8979D88680DA8B
      62CF6E0BA8197BB77DFFFFFF0000FFFFFFADCDAD03970B68CF7188D88F86D98E
      87DA9088DC9385DB90A1E4A9FCFEFCFFFFFFD0F2D586DC9189DC9388DC9287DA
      918ADA936BD17406990FADCDADFFFFFF0000FFFFFFE9EFE91B911F55C65C93DA
      998DD9948FDB9690DC988DDC95A7E4AFFDFEFDFFFFFFD4F2D78EDC9691DD9990
      DC988FDB9695DC9B58C8611C9321E9EFE9FFFFFF0000FFFFFFFFFFFF76B17721
      A3269BDE9E98DB9C97DC9D98DD9E96DC9CA9E2AEFDFFFDFFFFFFD1F0D495DC9B
      99DD9F98DD9E98DC9E9CDFA124A62A76B177FFFFFFFFFFFF0000FFFFFFFFFFFF
      ECF2EC28912A60C364ADE3B0A1DDA4A1DEA5A2DEA6A1DFA6C2EAC5D1EFD3ACE3
      B0A1DFA5A2DFA6A2DEA6ADE4B162C56629912BECF2ECFFFFFFFFFFFF0000FFFF
      FFFFFFFFFFFFFFC6DBC6198A1B72C875B8E7B9B0E2B3ACE1AFACE2AFA8E0ABA6
      DFAAABE1AEADE2AFB1E3B3B8E8BA73CA761A8A1CC6DBC6FFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFC5DAC52C912D4DB04EA4DEA6C0EAC2C0E8C2
      C1E8C2C1E8C3C1E9C2C0EAC2A5DFA64EB14F2C922EC5DAC5FFFFFFFFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBF1EB75AF7431943240A6
      4166BD6779C97A79C97A64BC6540A64131953274B074EBF1EAFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5
      EEE5A6CAA66FB16F55A45655A4566FB070A6CAA6E5EEE5FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
  end
end