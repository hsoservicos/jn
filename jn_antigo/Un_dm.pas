unit Un_dm;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs;

type
  T_dm = class(TDataModule)
    jn: TADOConnection;
    qr01: TADOQuery;

    qr02: TADOQuery;
    qr02CodCliente: TAutoIncField;
    qr02NomeCliente: TWideStringField;
    qr02Endereco: TWideStringField;
    qr02Bairro: TWideStringField;
    qr02Cidade: TWideStringField;
    qr02CEP: TWideStringField;
    qr02Fone1: TWideStringField;
    qr02Fone2: TWideStringField;
    qr02Fax: TWideStringField;
    qr02Celular: TWideStringField;
    qr02Obs: TMemoField;
    qr02email: TWideStringField;

    qr03: TADOQuery;
    qr04: TADOQuery;
    qr05: TADOQuery;
    qr06: TADOQuery;

    qr07: TADOQuery;
    qr07OS: TIntegerField;
    qr07CodCliente: TIntegerField;
    qr07Situacao: TIntegerField;
    qr07Equipamento: TIntegerField;
    qr07Complemento: TWideStringField;
    qr07NSerie: TWideStringField;
    qr07Defeito: TWideStringField;
    qr07DataEntrada: TDateTimeField;
    qr07Executante: TIntegerField;
    qr07Tecnico: TIntegerField;
    qr07Pago: TBooleanField;
    qr07DataSaida: TDateTimeField;
    qr07ValorOrcamento: TBCDField;
    qr07Valor: TBCDField;
    qr07PrevisaoPagamento: TDateTimeField;
    qr07ServicoExecutado: TWideStringField;
    qr07Area: TIntegerField;
    qr07Obs: TMemoField;

    qr08: TADOQuery;
    qr09: TADOQuery;
    qr10: TADOQuery;
    qr11: TADOQuery;
    qr12: TADOQuery;
    qrAux: TADOQuery;
    qr07Anterior: TIntegerField;
    qrFecha: TADOQuery;

    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
   private    { Private declarations }
   public     { Public declarations }
  end;

var
  _dm: T_dm;

implementation

uses Un_UDF, Un_Main;

{$R *.dfm}

procedure T_dm.DataModuleCreate(Sender: TObject);
Var
   aDB : Array [0..2] of String;
begin // Conexão
   jn.Connected := False;
   try
      aDB[0] := LerIni( _Main.cLocal + 'JN.INI', 'Banco de Dados', 'Caminho na Rede' );
      aDB[1] := LerIni( _Main.cLocal + 'JN.INI', 'Banco de Dados', 'Pasta' );
      aDB[2] := LerIni( _Main.cLocal + 'JN.INI', 'Banco de Dados', 'BD' );
      If aDB[0] = '' Then
      Begin
         _Main.pnlRede.Visible := True;
         _Main.pnlRede.Caption := 'Servidor: ' + _Main.nIP;
         jn.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + _Main.cUnid + ':'+ aDB[1] + '' + aDB[2] +
                                ';Persist Security Info=False';
      End
      Else
      Begin
         _Main.pnlRede.Visible := True;
         _Main.pnlRede.Caption := 'Terminal: ' + _Main.nIP;
         jn.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + '' + aDB[0] + '' + aDB[2] +
                                ';Persist Security Info=False'; // aDB[1] + '' + 
      End;
//    jn.Mode := cmUnknown;
//    jn.Mode := cmShareDenyWrite;
//    jn.Mode := cmShareDenyRead;
      jn.Mode := cmShareDenyNone;
      jn.Connected := True;
   except
      ShowMessage( 'Erro na conexão com o Banco de Dados'#13'( ' + jn.Name + ' )' );
   Raise;
   End;
end;

procedure T_dm.DataModuleDestroy(Sender: TObject);
begin //
   jn.Connected := False;
end;
{
function T_dm.NovaOS: Integer; // Metódo para verificação do Novo Número de O.S.
Var
   nOs : Integer;
   lOs : Boolean;
begin
   _dm.qrAux.Close;
   _dm.qrAux.SQL.Text := 'select * from Servicos order by OS desc';
   _dm.qrAux.Open;
   nOs := _dm.qrAux.FieldByName( 'OS' ).AsInteger + 1;
   lOs := False;
   while not lOs do
   begin
      if _dm.qrAux.FieldByName( 'OS' ).AsInteger = nOs then
      begin
         _dm.qrAux.First;
         nOs := nOs + 1;
      end;
      if _dm.qrAux.Eof then lOs := True;
      _dm.qrAux.Next;
   end;
   Result := nOs;
end;
}

end.
