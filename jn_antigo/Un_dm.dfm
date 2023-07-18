object _dm: T_dm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 1289
  Top = 141
  Height = 440
  Width = 233
  object jn: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=D:\de' +
      'velop\delphi7\jn\BD_JN.mdb;Mode=Share Deny None;Persist Security' +
      ' Info=False;Jet OLEDB:System database="";Jet OLEDB:Registry Path' +
      '="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet O' +
      'LEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2' +
      ';Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Pas' +
      'sword="";Jet OLEDB:Create System Database=False;Jet OLEDB:Encryp' +
      't Database=False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Je' +
      't OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 22
    Top = 12
  end
  object qr01: TADOQuery
    Connection = jn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from AREA order by Descricao')
    Left = 22
    Top = 70
  end
  object qr02: TADOQuery
    Connection = jn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from CLIENTES order by NomeCliente')
    Left = 22
    Top = 114
    object qr02CodCliente: TAutoIncField
      FieldName = 'CodCliente'
      ReadOnly = True
    end
    object qr02NomeCliente: TWideStringField
      FieldName = 'NomeCliente'
      Size = 120
    end
    object qr02Endereco: TWideStringField
      FieldName = 'Endereco'
      Size = 120
    end
    object qr02Bairro: TWideStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object qr02Cidade: TWideStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qr02CEP: TWideStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qr02Fone1: TWideStringField
      FieldName = 'Fone1'
      Size = 9
    end
    object qr02Fone2: TWideStringField
      FieldName = 'Fone2'
      Size = 8
    end
    object qr02Fax: TWideStringField
      FieldName = 'Fax'
      Size = 8
    end
    object qr02Celular: TWideStringField
      FieldName = 'Celular'
      Size = 9
    end
    object qr02Obs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object qr02email: TWideStringField
      FieldName = 'e-mail'
      Size = 50
    end
  end
  object qr03: TADOQuery
    Connection = jn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from [Tipo de equipamento] order by Descricao')
    Left = 22
    Top = 158
  end
  object qr04: TADOQuery
    Connection = jn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Situacao order by Descricao')
    Left = 22
    Top = 202
  end
  object qr05: TADOQuery
    Connection = jn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Funcionarios order by NomeCompleto')
    Left = 22
    Top = 246
  end
  object qr06: TADOQuery
    Connection = jn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Servicos order by OS')
    Left = 22
    Top = 291
  end
  object qr07: TADOQuery
    Connection = jn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Servicos order by OS')
    Left = 78
    Top = 70
    object qr07OS: TIntegerField
      FieldName = 'OS'
    end
    object qr07CodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object qr07Situacao: TIntegerField
      FieldName = 'Situacao'
    end
    object qr07Equipamento: TIntegerField
      FieldName = 'Equipamento'
    end
    object qr07Complemento: TWideStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object qr07NSerie: TWideStringField
      FieldName = 'NSerie'
      Size = 50
    end
    object qr07Defeito: TWideStringField
      FieldName = 'Defeito'
      Size = 100
    end
    object qr07DataEntrada: TDateTimeField
      FieldName = 'DataEntrada'
    end
    object qr07Executante: TIntegerField
      FieldName = 'Executante'
    end
    object qr07Tecnico: TIntegerField
      FieldName = 'Tecnico'
    end
    object qr07Pago: TBooleanField
      FieldName = 'Pago'
    end
    object qr07DataSaida: TDateTimeField
      FieldName = 'DataSaida'
    end
    object qr07ValorOrcamento: TBCDField
      FieldName = 'ValorOrcamento'
      Precision = 19
    end
    object qr07Valor: TBCDField
      FieldName = 'Valor'
      DisplayFormat = '##,##0.00'
      Precision = 19
    end
    object qr07PrevisaoPagamento: TDateTimeField
      FieldName = 'PrevisaoPagamento'
    end
    object qr07ServicoExecutado: TWideStringField
      FieldName = 'ServicoExecutado'
      Size = 120
    end
    object qr07Area: TIntegerField
      FieldName = 'Area'
    end
    object qr07Obs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object qr07Anterior: TIntegerField
      FieldName = 'Anterior'
    end
  end
  object qr08: TADOQuery
    Connection = jn
    Parameters = <>
    Left = 78
    Top = 114
  end
  object qr09: TADOQuery
    Connection = jn
    Parameters = <>
    Left = 78
    Top = 158
  end
  object qr10: TADOQuery
    Connection = jn
    Parameters = <>
    Left = 78
    Top = 202
  end
  object qr11: TADOQuery
    Connection = jn
    Parameters = <>
    Left = 78
    Top = 246
  end
  object qr12: TADOQuery
    Connection = jn
    Parameters = <>
    Left = 78
    Top = 291
  end
  object qrAux: TADOQuery
    Connection = jn
    CursorType = ctStatic
    Parameters = <>
    Left = 20
    Top = 340
  end
  object qrFecha: TADOQuery
    Connection = jn
    CursorType = ctStatic
    Parameters = <>
    Left = 75
    Top = 340
  end
end
