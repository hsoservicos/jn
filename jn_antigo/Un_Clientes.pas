unit Un_Clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids, DB, Buttons;

type
  T_Clientes = class(TForm)
    pnlClientes: TPanel;
    dsClientes: TDataSource;
    dbgClientes: TDBGrid;
    dbnClientes: TDBNavigator;
    gbCliente: TGroupBox;
    edtNome: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtCEP: TLabeledEdit;
    edtFone1: TLabeledEdit;
    edtFone2: TLabeledEdit;
    edtFax: TLabeledEdit;
    edtCelular: TLabeledEdit;
    edtEmail: TLabeledEdit;
    pnlCodCli: TPanel;
    Label1: TLabel;
    edtObs: TMemo;
    btnSair: TBitBtn;
    btnNova: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    sbSim: TSpeedButton;
    sbNao: TSpeedButton;
    procedure dsClientesDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgClientesKeyPress(Sender: TObject; var Key: Char);
    procedure btnNovaClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure sbNaoClick(Sender: TObject);
    procedure sbSimClick(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure edtFone1Exit(Sender: TObject);
    procedure edtCelularExit(Sender: TObject);
    procedure edtFone2Exit(Sender: TObject);
    procedure edtFaxExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
   private    { Private declarations }
      cFlg, cBusca : String;
      Procedure Controle( x : Boolean );
      Procedure Dados( x : String );
   public     { Public declarations }
      cPorta : String;
   end;

var
   _Clientes: T_Clientes;

implementation

uses Un_dm, Un_UDF;

{$R *.dfm}

procedure T_Clientes.FormCreate(Sender: TObject);
begin
   cFlg   := '';
   cBusca := '';
   cPorta := '';
   pnlCodCli.Hint := 'Informação do Código e o'#13'Nº de serviços registrados para este.';
end;

procedure T_Clientes.FormShow(Sender: TObject);
begin
   _dm.qr02.Close;
   _dm.qr02.SQL.Text := 'select * from CLIENTES order by NomeCliente';
   _dm.qr02.Open;
   Controle( True );
   dbgClientes.SetFocus;
end;

procedure T_Clientes.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure T_Clientes.dsClientesDataChange(Sender: TObject; Field: TField);
begin
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from SERVICOS where CodCliente = ' + _dm.qr02.FieldByName( 'CodCliente' ).AsString + '';
   _dm.qr11.Open;
   pnlCodCli.Caption := 'Cod: ' + _dm.qr02.FieldByName( 'CodCliente' ).AsString + '  Serv: ' + IntToStr( _dm.qr11.RecordCount );
   Dados( '' );
end;

procedure T_Clientes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   Case Key Of
      VK_ESCAPE :
      Begin
         If cFlg <> '' Then
         Begin
            _dm.qr02.Close;
            _dm.qr02.Open;
            cFlg := '';
            Controle( True );
            dbgClientes.SetFocus;
         End
         Else
            Close;
      End;
      VK_RETURN :
      Begin
         Perform( WM_NEXTDLGCTL, 0, 0 );
         Key := 0;
      End;
   End;
   If ( Key = VK_END ) or ( Key = VK_HOME ) or
      ( Key = VK_LEFT ) or ( Key = VK_UP ) or ( Key = VK_RIGHT ) or ( Key = VK_DOWN ) Then
   Begin
      cBusca := '';
   End;
end;

procedure T_Clientes.dbgClientesKeyPress(Sender: TObject; var Key: Char);
begin
   If ( Key = #37 ) or ( Key = #38 ) or ( Key = #39 ) or ( Key = #40 ) Then
   Begin
      cBusca := '';
   End;
   If Key <> #8 Then
   Begin
      cBusca := cBusca + Key;
   End
   Else
   Begin
      cBusca := Copy( cBusca, 1, Length( cBusca ) - 1 );
   End;
   _dm.qr02.Locate( 'NomeCliente', cBusca, [loPartialKey, loCaseInsensitive] );
end;

procedure T_Clientes.Controle(x: Boolean);
begin
   dbgClientes.Enabled := x;
   btnNova.Enabled     := x;
   btnAlterar.Enabled  := x;
   btnExcluir.Enabled  := x;
   btnSair.Enabled     := x;
   sbSim.Visible       := Not x;
   sbNao.Visible       := Not x;
   gbCliente.Enabled   := Not x;
end;

procedure T_Clientes.Dados(x: String);
begin
   If x = 'N' Then
   Begin
      edtNome.Text      := '';
      edtEndereco.Text  := '';
      edtBairro.Text    := '';
      edtCidade.Text    := '';
      edtCEP.Text       := '';
      edtFone1.Text     := '';
      edtFone2.Text     := '';
      edtFax.Text       := '';
      edtCelular.Text   := '';
      edtEmail.Text     := '';
      edtObs.Lines.Clear;
      edtObs.Text       := '';
   End
   Else
   Begin
      edtNome.Text      := ControlaCampoTexto( _dm.qr02.FieldByName( 'NomeCliente' ).AsString );
      edtEndereco.Text  := ControlaCampoTexto( _dm.qr02.FieldByName( 'Endereco' ).AsString );
      edtBairro.Text    := ControlaCampoTexto( _dm.qr02.FieldByName( 'Bairro' ).AsString );
      edtCidade.Text    := ControlaCampoTexto( _dm.qr02.FieldByName( 'Cidade' ).AsString );
      edtCEP.Text       := ControlaCampoTexto( _dm.qr02.FieldByName( 'CEP' ).AsString );
      edtFone1.Text     := ControlaCampoTexto( _dm.qr02.FieldByName( 'Fone1' ).AsString );
      edtFone2.Text     := ControlaCampoTexto( _dm.qr02.FieldByName( 'Fone2' ).AsString );
      edtFax.Text       := ControlaCampoTexto( _dm.qr02.FieldByName( 'Fax' ).AsString );
      edtCelular.Text   := ControlaCampoTexto( _dm.qr02.FieldByName( 'Celular' ).AsString );
      edtEmail.Text     := ControlaCampoTexto( _dm.qr02.FieldByName( 'E-mail' ).AsString );
      edtObs.Text       := ControlaCampoTexto( _dm.qr02.FieldByName( 'Obs' ).AsString );
   end;
end;

procedure T_Clientes.btnNovaClick(Sender: TObject);
begin
   cFlg   := 'N';
   cBusca := '';
   Controle( False );
   Dados( 'N' );
   edtNome.SetFocus;
end;

procedure T_Clientes.btnAlterarClick(Sender: TObject);
begin
   cFlg   := 'A';
   cBusca := '';
   Controle( False );
   Dados( '' );
   edtNome.SetFocus;
end;

procedure T_Clientes.btnExcluirClick(Sender: TObject);
Var
   lExc : Boolean;
begin
   _dm.qr12.Close;
   _dm.qr12.SQL.Text := 'select * from SERVICOS where CodCliente = ' + _dm.qr02.FieldByName( 'CodCliente' ).AsString + '';
   _dm.qr12.Open;
   If _dm.qr12.RecordCount > 0 Then
   Begin
      MessageDlg( 'Exclusão do Cliente não poderá ser processada, sem a'#13'exclusão dos serviços registrados.'#13''#13'Será aberto o modulo de exclusão de Serviços deste Cliente.', mtWarning, [ mbOk ], 0 );
      If MessageDlg( 'ATENÇÃO:'#13''#13'Excluir TODOS os Serviços de [ ' + _dm.qr02.FieldByName( 'NomeCliente' ).AsString + ' ] ?', mtWarning, [ mbYes, mbNo ], 0 ) = mrYes Then
      Begin
         _dm.qr12.Close;
         _dm.qr12.SQL.Text := 'delete from SERVICOS where CodCliente = ' + _dm.qr02.FieldByName( 'CodCliente' ).AsString + '';
         _dm.qr12.ExecSQL;
         lExc := True;
      End
      Else
      Begin
         lExc := False;
      End;
   End
   Else
      lExc := True;
   If ( lExc ) And ( MessageDlg( 'Exclusão do Cliente ?'#13'' + _dm.qr02.FieldByName( 'NomeCliente' ).AsString, mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes ) Then
   Begin
      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'delete from CLIENTES where CodCliente = ' + _dm.qr02.FieldByName( 'CodCliente' ).AsString + '';
      _dm.qr12.ExecSQL;
   End;
   _dm.qr02.Close;
   _dm.qr02.Open;
   cBusca := '';
   dbgClientes.SetFocus;
end;

procedure T_Clientes.edtCEPExit(Sender: TObject);
begin
   If edtCEP.Text <> '' Then edtCEP.Text := FormataCEP( edtCEP.Text );
end;

procedure T_Clientes.edtFone1Exit(Sender: TObject);
begin
   If edtFone1.Text <> '' Then edtFone1.Text := FormataFone( edtFone1.Text );
end;

procedure T_Clientes.edtFone2Exit(Sender: TObject);
begin
//   If edtFone2.Text <> '' Then edtFone2.Text := FormataFone( edtFone2.Text );
end;

procedure T_Clientes.edtFaxExit(Sender: TObject);
begin
//   If edtFax.Text <> '' Then edtFax.Text := FormataFone( edtFax.Text );
end;

procedure T_Clientes.edtCelularExit(Sender: TObject);
begin
   If edtCelular.Text <> '' Then edtCelular.Text := FormataFone( edtCelular.Text );
end;

procedure T_Clientes.sbNaoClick(Sender: TObject);
begin
   _dm.qr02.Close;
   _dm.qr02.Open;
   cFlg   := '';
   cBusca := '';
   Controle( True );
   dbgClientes.SetFocus;
end;

procedure T_Clientes.sbSimClick(Sender: TObject);
begin
   If edtNome.Text = '' Then
   Begin
      edtNome.SetFocus;
      Exit;
   End;
   edtEndereco.Text  := ControlaCampoTexto( edtEndereco.Text );
   edtBairro.Text    := ControlaCampoTexto( edtBairro.Text );
   edtCidade.Text    := ControlaCampoTexto( edtCidade.Text );
   If edtCEP.Text = '' Then edtCEP.Text := '50.000-000';
   edtFone1.Text     := ControlaCampoTexto( edtFone1.Text );
   edtFone2.Text     := ControlaCampoTexto( edtFone2.Text );
   edtFax.Text       := ControlaCampoTexto( edtFax.Text );
   edtCelular.Text   := ControlaCampoTexto( edtCelular.Text );
   edtEmail.Text     := ControlaCampoTexto( edtEmail.Text );
   edtObs.Text       := ControlaCampoTexto( edtObs.Text );
   If cFlg = 'N' Then
   Begin
      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'select * from CLIENTES';
      _dm.qr12.Open;
      _dm.qr12.Insert;
      _dm.qr12.FieldByName( 'NomeCliente' ).AsString := edtNome.Text;
      _dm.qr12.FieldByName( 'ENDERECO' ).AsString    := edtEndereco.Text;
      _dm.qr12.FieldByName( 'BAIRRO' ).AsString      := edtBairro.Text;
      _dm.qr12.FieldByName( 'CIDADE' ).AsString      := edtCidade.Text;
      _dm.qr12.FieldByName( 'CEP' ).AsString         := edtCEP.Text;
      _dm.qr12.FieldByName( 'FONE1' ).AsString       := edtFone1.Text;
      _dm.qr12.FieldByName( 'FONE2' ).AsString       := edtFone2.Text;
      _dm.qr12.FieldByName( 'FAX' ).AsString         := edtFax.Text;
      _dm.qr12.FieldByName( 'CELULAR' ).AsString     := edtCelular.Text;
      _dm.qr12.FieldByName( 'OBS' ).AsString         := edtObs.Text;
      _dm.qr12.FieldByName( 'e-mail' ).AsString      := edtEmail.Text;
      _dm.qr12.Post;
      _dm.qr12.Close;
   End;
   If cFlg = 'A' Then
   Begin
      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'select * from CLIENTES';
      _dm.qr12.Open;
      _dm.qr12.Locate( 'CodCliente', _dm.qr02CodCliente.AsString, [] );
      _dm.qr12.Edit;
      _dm.qr12.FieldByName( 'NomeCliente' ).AsString := edtNome.Text;
      _dm.qr12.FieldByName( 'ENDERECO' ).AsString    := edtEndereco.Text;
      _dm.qr12.FieldByName( 'BAIRRO' ).AsString      := edtBairro.Text;
      _dm.qr12.FieldByName( 'CIDADE' ).AsString      := edtCidade.Text;
      _dm.qr12.FieldByName( 'CEP' ).AsString         := edtCEP.Text;
      _dm.qr12.FieldByName( 'FONE1' ).AsString       := edtFone1.Text;
      _dm.qr12.FieldByName( 'FONE2' ).AsString       := edtFone2.Text;
      _dm.qr12.FieldByName( 'FAX' ).AsString         := edtFax.Text;
      _dm.qr12.FieldByName( 'CELULAR' ).AsString     := edtCelular.Text;
      _dm.qr12.FieldByName( 'OBS' ).AsString         := edtObs.Text;
      _dm.qr12.FieldByName( 'e-mail' ).AsString      := edtEmail.Text;
      _dm.qr12.Post;
      _dm.qr12.Close;
   End;
   _dm.qr02.Close;
   _dm.qr02.Open;
   cFlg   := '';
   cBusca := '';
   cPorta := '';
   Controle( True );
   dbgClientes.SetFocus;
end;

end.

