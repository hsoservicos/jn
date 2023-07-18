unit Un_Registro_Servico;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, DB, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, StdConvs;

type
  T_Registro_Servico = class(TForm)
    dsServ: TDataSource;
    gbOS: TGroupBox;
    dbgOS: TDBGrid;
    DBNavigator1: TDBNavigator;
    gbCliente: TGroupBox;
    lblCliente: TLabel;
    cbClientes: TComboBox;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtCEP: TLabeledEdit;
    edtFone1: TLabeledEdit;
    edtFone2: TLabeledEdit;
    edtFax: TLabeledEdit;
    edtCelular: TLabeledEdit;
    edtEmail: TLabeledEdit;
    gbEquipamento: TGroupBox;
    lblEquipamento: TLabel;
    cbEquipamento: TComboBox;
    edtDefeito: TLabeledEdit;
    edtSerie: TLabeledEdit;
    edtComplemento: TLabeledEdit;
    lblArea: TLabel;
    cbArea: TComboBox;
    gbServico: TGroupBox;
    lblSituacao: TLabel;
    cbSituacao: TComboBox;
    lblTecnicos: TLabel;
    cbTecnico: TComboBox;
    lblExecutante: TLabel;
    cbExecutante: TComboBox;
    Label1: TLabel;
    edtObs: TMemo;
    edtDataEntrada: TLabeledEdit;
    edtDataSaida: TLabeledEdit;
    chkPago: TCheckBox;
    edtOrcamento: TLabeledEdit;
    edtDataPrevisto: TLabeledEdit;
    edtPago: TLabeledEdit;
    sbNovaOS: TSpeedButton;
    sbSair: TSpeedButton;
    sbClientes: TSpeedButton;
    pnlOS: TPanel;
    sbExcluirOs: TSpeedButton;
    sbAlterarOS: TSpeedButton;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    lblNOs: TLabel;
    edtServico: TLabeledEdit;
    edtOs: TLabeledEdit;
    lblRetorno: TLabel;
    lblRetornoTexto: TLabel;
    TempoRetorno: TTimer;
    sbImprimir: TSpeedButton;
    procedure lblClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsServDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgOSKeyPress(Sender: TObject; var Key: Char);
    procedure lblEquipamentoClick(Sender: TObject);
    procedure lblAreaClick(Sender: TObject);
    procedure lblSituacaoClick(Sender: TObject);
    procedure lblTecnicosClick(Sender: TObject);
    procedure sbNovaOSClick(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    procedure sbExcluirOsClick(Sender: TObject);
    procedure sbAlterarOSClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure cbClientesExit(Sender: TObject);
    procedure edtEmailExit(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure edtFone1Exit(Sender: TObject);
    procedure edtCelularExit(Sender: TObject);
    procedure lblClienteMouseLeave(Sender: TObject);
    procedure lblClienteMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure cbExecutanteExit(Sender: TObject);
    procedure edtDataEntradaExit(Sender: TObject);
    procedure edtOrcamentoExit(Sender: TObject);
    procedure edtDataSaidaExit(Sender: TObject);
    procedure edtDataPrevistoExit(Sender: TObject);
    procedure chkPagoExit(Sender: TObject);
    procedure TempoRetornoTimer(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure dbgOSDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private    { Private declarations }
      cFlg, cBusca, cNova : String;
      cNovoCliente : String;
      cRetorno : String;
      nOs : Integer;
      Procedure Controle( x : Boolean );
      Procedure LimpaDados;
      Procedure DadosCliente;
      Procedure Apoio( x : Boolean );
      Procedure RetornoOS( cNumero : String );
  public     { Public declarations }
  end;

var
  _Registro_Servico: T_Registro_Servico;

implementation

uses
   Un_dm, Un_UDF, Un_Clientes, Un_Funcionarios, Un_Main, Un_Areas, Un_Equipamentos, Un_Situacoes, Un_Imprimir_OS;

{$R *.dfm}

procedure T_Registro_Servico.lblClienteMouseLeave(Sender: TObject);
begin
   (Sender as TLabel).Font.Color := clWindowText;
   (Sender as TLabel).Font.Size := 8;
end;

procedure T_Registro_Servico.lblClienteMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
   I : Integer;
begin
   (Sender as TLabel).Font.Color := clHotLight;
   (Sender as TLabel).Font.Size  := 10;
   for I := 0 to _Registro_Servico.ControlCount -1 do
   begin
      if (_Registro_Servico.Controls[I] is TLabel) then
      begin
         if (_Registro_Servico.Controls[I].Name <> (Sender as TLabel).Name) then
         begin
            (_Registro_Servico.Controls[I] as TLabel).Font.Color := clWindowText;
            (_Registro_Servico.Controls[I] as TLabel).Font.Size := 8;
         end;
      end;
   end;
end;

procedure T_Registro_Servico.Controle( x: Boolean );
begin //
   sbNovaOS.Enabled      := x;
   sbAlterarOS.Enabled   := x;
   sbExcluirOs.Enabled   := x;
   sbSair.Enabled        := x;
   gbCliente.Enabled     := Not x;
   gbEquipamento.Enabled := Not x;
   gbServico.Enabled     := Not x;
   btnSalvar.Visible     := Not x;
   btnCancelar.Visible   := Not x;
end;

procedure T_Registro_Servico.FormCreate(Sender: TObject);
begin
   cFlg   := '';
   cBusca := '';
   nOs    := 0;
   edtDefeito.Hint := 'Dados do defeito informado pelo cliente'#13'e/ou dados opicionais do equipamento.';
end;

procedure T_Registro_Servico.FormShow(Sender: TObject);
begin
   Application.ProcessMessages;
   lblRetorno.Visible := False;
   lblRetorno.Caption := '';
   lblRetornoTexto.Visible := False;
   _Main.stlClientes.Clear; // Clientes
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from CLIENTES order by NomeCliente';
   _dm.qr11.Open;
   cbClientes.Text := '';
   cbClientes.Clear;
   While Not _dm.qr11.Eof Do
   Begin
      cbClientes.Items.Add( _dm.qr11.FieldByName( 'NomeCliente' ).AsString );
      _Main.stlClientes.Add( _dm.qr11.FieldByName( 'CodCliente' ).AsString );
      _dm.qr11.Next;
   End;
   _Main.stlEquip.Clear; // Equipamentos
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from [Tipo de equipamento] order by Descricao';
   _dm.qr11.Open;
   cbEquipamento.Text := '';
   cbEquipamento.Clear;
   While Not _dm.qr11.Eof Do
   Begin
      cbEquipamento.Items.Add( _dm.qr11.FieldByName( 'Descricao' ).AsString );
      _Main.stlEquip.Add( _dm.qr11.FieldByName( 'CodEquipamento' ).AsString );
      _dm.qr11.Next;
   End;
   _Main.stlArea.Clear; // Áreas
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from Area order by Descricao';
   _dm.qr11.Open;
   cbArea.Text := '';
   cbArea.Clear;
   While Not _dm.qr11.Eof Do
   Begin
      cbArea.Items.Add( _dm.qr11.FieldByName( 'Descricao' ).AsString );
      _Main.stlArea.Add( _dm.qr11.FieldByName( 'CodArea' ).AsString );
      _dm.qr11.Next;
   End;
   _Main.stlSit.Clear; // Situações
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from Situacao order by Descricao';
   _dm.qr11.Open;
   cbSituacao.Text := '';
   cbSituacao.Clear;
   While Not _dm.qr11.Eof Do
   Begin
      cbSituacao.Items.Add( _dm.qr11.FieldByName( 'Descricao' ).AsString );
      _Main.stlSit.Add( _dm.qr11.FieldByName( 'CodSituacao' ).AsString );
      _dm.qr11.Next;
   End;
   _Main.stlFunc.Clear; // Técnicos e Executantes
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from Funcionarios Where Funcão = 1 order by Apelido';
   _dm.qr11.Open;
   cbTecnico.Text := '';
   cbTecnico.Clear;
   cbExecutante.Text := '';
   cbExecutante.Clear;
   While Not _dm.qr11.Eof Do
   Begin
      cbTecnico.Items.Add( _dm.qr11.FieldByName( 'Apelido' ).AsString );
      cbExecutante.Items.Add( _dm.qr11.FieldByName( 'Apelido' ).AsString );
      _Main.stlFunc.Add( _dm.qr11.FieldByName( 'CodTecnicos' ).AsString );
      _dm.qr11.Next;
   End;

   Controle( True );

   _dm.qr06.Close;
   _dm.qr06.SQL.Text := 'select * from Servicos order by OS';
   _dm.qr06.Open;
   _dm.qr06.Last;
   // nOs := _dm.qr06.FieldByName( 'OS' ).AsInteger;
   // pnlOS.Caption := FormatFloat( '###,##0', nOs );
   _dm.qr06.First;
   Application.ProcessMessages;
   dbgOS.SetFocus;
end;

procedure T_Registro_Servico.lblClienteClick(Sender: TObject);
Var
   cPorta : String;
begin // Clientes
   _Clientes := T_Clientes.Create( Self );
   Try
      _Clientes.cPorta := 'A';
      _Clientes.ShowModal;
   Finally
      cPorta := _Clientes.cPorta;
      _Clientes.Release;
      _Clientes := Nil;
   End;
   If cPorta = '' Then
   Begin
      _Main.stlClientes.Clear;
      _dm.qr11.Close;
      _dm.qr11.SQL.Text := 'select * from CLIENTES order by NomeCliente';
      _dm.qr11.Open;
      cbClientes.Text := '';
      cbClientes.Clear;
      While Not _dm.qr11.Eof Do
      Begin
         cbClientes.Items.Add( _dm.qr11.FieldByName( 'NomeCliente' ).AsString );
         _Main.stlClientes.Add( _dm.qr11.FieldByName( 'CodCliente' ).AsString );
         _dm.qr11.Next;
      End;
   End;
end;

procedure T_Registro_Servico.lblEquipamentoClick(Sender: TObject);
Var
   cPorta : String;
begin // Equipamentos
   _Equipamentos := T_Equipamentos.Create( Self );
   Try
      _Equipamentos.cPorta := 'A';
      _Equipamentos.ShowModal;
   Finally
      cPorta := _Equipamentos.cPorta;
      _Equipamentos.Release;
      _Equipamentos := Nil;
   End;
   If cPorta = '' Then
   Begin
      _Main.stlEquip.Clear;
      _dm.qr11.Close;
      _dm.qr11.SQL.Text := 'select * from [Tipo de equipamento] order by Descricao';
      _dm.qr11.Open;
      cbEquipamento.Text := '';
      cbEquipamento.Clear;
      While Not _dm.qr11.Eof Do
      Begin
         cbEquipamento.Items.Add( _dm.qr11.FieldByName( 'Descricao' ).AsString );
         _Main.stlEquip.Add( _dm.qr11.FieldByName( 'CodEquipamento' ).AsString );
         _dm.qr11.Next;
      End;
   End;
end;

procedure T_Registro_Servico.lblAreaClick(Sender: TObject);
Var
   cPorta : String;
begin // Áreas
   _Areas := T_Areas.Create( Self );
   Try
      _Areas.cPorta := 'A';
      _Areas.ShowModal;
   Finally
      cPorta := _Areas.cPorta;
      _Areas.Release;
      _Areas := Nil;
   End;
   If cPorta = '' Then
   Begin
      _Main.stlArea.Clear;
      _dm.qr11.Close;
      _dm.qr11.SQL.Text := 'select * from Area order by Descricao';
      _dm.qr11.Open;
      cbArea.Text := '';
      cbArea.Clear;
      While Not _dm.qr11.Eof Do
      Begin
         cbArea.Items.Add( _dm.qr11.FieldByName( 'Descricao' ).AsString );
         _Main.stlArea.Add( _dm.qr11.FieldByName( 'CodArea' ).AsString );
         _dm.qr11.Next;
      End;
   End;
end;

procedure T_Registro_Servico.lblSituacaoClick(Sender: TObject);
Var
   cPorta : String;
begin // Situações
   _Situacoes := T_Situacoes.Create( Self );
   Try
      _Situacoes.cPorta := 'A';
      _Situacoes.ShowModal;
   Finally
      cPorta := _Situacoes.cPorta;
      _Situacoes.Release;
      _Situacoes := Nil;
   End;
   If cPorta = '' Then
   Begin
      _Main.stlSit.Clear;
      _dm.qr11.Close;
      _dm.qr11.SQL.Text := 'select * from Situacao order by Descricao';
      _dm.qr11.Open;
      cbSituacao.Text := '';
      cbSituacao.Clear;
      While Not _dm.qr11.Eof Do
      Begin
         cbSituacao.Items.Add( _dm.qr11.FieldByName( 'Descricao' ).AsString );
         _Main.stlSit.Add( _dm.qr11.FieldByName( 'CodSituacao' ).AsString );
         _dm.qr11.Next;
      End;
   End;
end;

procedure T_Registro_Servico.lblTecnicosClick(Sender: TObject);
Var
   cPorta : String;
begin // Técnicos e Executantes
   _Funcionarios := T_Funcionarios.Create( Self );
   Try
      _Funcionarios.cPorta := 'A';
      _Funcionarios.ShowModal;
   Finally
      _Funcionarios.Release;
      _Funcionarios := Nil;
   End;
   If cPorta = '' Then
   Begin
      _Main.stlFunc.Clear;
      _dm.qr11.Close;
      _dm.qr11.SQL.Text := 'select * from Funcionarios Where Funcão = 1 order by Apelido';
      _dm.qr11.Open;
      If (Sender as TLabel).Caption = 'Técnico' Then
      Begin
         cbTecnico.Text := '';
         cbTecnico.Clear;
      End;
      If (Sender as TLabel).Caption = 'Executante' Then
      Begin
         cbExecutante.Text := '';
         cbExecutante.Clear;
      End;
      While Not _dm.qr11.Eof Do
      Begin
         If (Sender as TLabel).Caption = 'Técnico'    Then cbTecnico.Items.Add( _dm.qr11.FieldByName( 'Apelido' ).AsString );
         If (Sender as TLabel).Caption = 'Executante' Then cbExecutante.Items.Add( _dm.qr11.FieldByName( 'Apelido' ).AsString );
         _Main.stlSit.Add( _dm.qr11.FieldByName( 'CodTecnicos' ).AsString );
         _dm.qr11.Next;
      End;
   End;
end;

procedure T_Registro_Servico.dbgOSDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin // nOs :=
//   nOs := _dm.qr06.FieldByName( 'OS' ).AsInteger;
//   pnlOS.Caption := FormatFloat( '###,##0', nOs );
end;

procedure T_Registro_Servico.dbgOSKeyPress(Sender: TObject; var Key: Char);
begin
   If ( Key <> #13 ) and ( Key <> #27 ) Then
   Begin
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
      _dm.qr06.Locate( 'OS', cBusca, [loPartialKey, loCaseInsensitive] );
      // nOs := _dm.qr06.FieldByName( 'OS' ).AsInteger;
   End;
end;

procedure T_Registro_Servico.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   Case Key Of
      VK_ESCAPE :
      Begin
         If ( cFlg = 'N' ) or ( cFlg = 'A' ) Then
         Begin
            lblRetorno.Visible := False;
            lblRetornoTexto.Visible := False;
            TempoRetorno.Enabled := False;
            Controle( True );
            Apoio( True );
            cFlg := '';
            _dm.qr06.Close;
            _dm.qr06.Open;
            dbgOS.SetFocus;
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

procedure T_Registro_Servico.sbSairClick(Sender: TObject);
begin
   Close;
end;

procedure T_Registro_Servico.sbExcluirOsClick(Sender: TObject);
begin
   If MessageDlg( 'Confirma Exclusão da O.S. ?', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
   Begin
      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'delete from Servicos where OS = ' + _dm.qr06.FieldByName( 'OS' ).AsString + '';
      _dm.qr12.ExecSQL;

      _dm.qr06.Close;
      _dm.qr06.Open;
      _dm.qr06.Last;
      //nOs := _dm.qr06.FieldByName( 'OS' ).AsInteger;
      //pnlOS.Caption := FormatFloat( '###,##0', nOs );
      cBusca := '';
      Application.ProcessMessages;
      _dm.qr06.Close;
      _dm.qr06.Open;
   End;
end;

procedure T_Registro_Servico.dsServDataChange(Sender: TObject; Field: TField);
begin // Mostra de Serviços.
   lblNOs.Caption := 'O.S. atual:'#13'' + _dm.qr06.FieldByName( 'OS' ).AsString;
   nOs := _dm.qr06.FieldByName( 'OS' ).AsInteger;
   pnlOS.Caption := FormatFloat( '###,##0', nOs );
   DadosCliente;
   edtOs.Text := _dm.qr06.FieldByName( 'OS' ).AsString;
   If _dm.qr06.FieldByName( 'Equipamento' ).AsString <> '' Then
   Begin
      cbEquipamento.Color     := clWindow;
      cbEquipamento.ItemIndex := _Main.stlEquip.IndexOf( _dm.qr06.FieldByName( 'Equipamento' ).AsString );
   End
   Else
   Begin
      cbEquipamento.Color     := clRed;
      cbEquipamento.ItemIndex := -1;
   End;
   edtComplemento.Text := _dm.qr06.FieldByName( 'Complemento' ).AsString;
   edtDefeito.Text     := _dm.qr06.FieldByName( 'Defeito' ).AsString;
   edtSerie.Text       := _dm.qr06.FieldByName( 'NSerie' ).AsString;
   If _dm.qr06.FieldByName( 'Area' ).AsString <> '' Then
   Begin
      cbArea.Color     := clWindow;
      cbArea.ItemIndex := _Main.stlArea.IndexOf( _dm.qr06.FieldByName( 'Area' ).AsString );
   End
   Else
   Begin
      cbArea.Color     := clRed;
      cbArea.ItemIndex := -1;
   End;

   edtDataEntrada.Text     := _dm.qr06.FieldByName( 'DataEntrada' ).AsString;
   edtOrcamento.Text       := _dm.qr06.FieldByName( 'ValorOrcamento' ).AsString;
   edtDataSaida.Text       := _dm.qr06.FieldByName( 'DataSaida' ).AsString;
   chkPago.Checked         := _dm.qr06.FieldByName( 'Pago' ).AsBoolean;
   edtDataPrevisto.Text    := _dm.qr06.FieldByName( 'PrevisaoPagamento' ).AsString;
   edtPago.Text            := FormatFloat( '##,##0.00', _dm.qr06.FieldByName( 'Valor' ).AsFloat );
// **
   If _dm.qr06.FieldByName( 'Situacao' ).AsString <> '' Then
   Begin
      cbSituacao.Color     := clWindow;
      cbSituacao.ItemIndex := _Main.stlSit.IndexOf( _dm.qr06.FieldByName( 'Situacao' ).AsString );
   End
   Else
   Begin
      cbSituacao.Color     := clRed;
      cbSituacao.ItemIndex := -1;
   End;

   If ( _dm.qr06.FieldByName( 'Tecnico' ).AsString <> '' ) and ( _dm.qr06.FieldByName( 'Tecnico' ).AsString <> '0' ) Then
   Begin
      cbTecnico.Color     := clWindow;
      cbTecnico.ItemIndex := _Main.stlFunc.IndexOf( _dm.qr06.FieldByName( 'Tecnico' ).AsString );
   End
   Else
   Begin
      cbTecnico.Color     := clRed;
      cbTecnico.ItemIndex := -1;
   End;

   If ( _dm.qr06.FieldByName( 'Executante' ).AsString <> '' ) and ( _dm.qr06.FieldByName( 'Executante' ).AsString <> '0' )Then
   Begin
      cbExecutante.Color     := clWindow;
      cbExecutante.ItemIndex := _Main.stlFunc.IndexOf( _dm.qr06.FieldByName( 'Executante' ).AsString );
   End
   Else
   Begin
      cbExecutante.Color     := clRed;
      cbExecutante.ItemIndex := -1;
   End;

   edtServico.Text          := ControlaCampoTexto( _dm.qr06.FieldByName( 'ServicoExecutado' ).AsString );
   edtObs.Text              := _dm.qr06.FieldByName( 'Obs' ).AsString;
end;

procedure T_Registro_Servico.DadosCliente;
begin
   cbClientes.Color := clWindow;
   cbClientes.ItemIndex := _Main.stlClientes.IndexOf( _dm.qr06.FieldByName( 'CodCliente' ).AsString );
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from Clientes';
   _dm.qr11.Open;
   If _dm.qr06.FieldByName( 'CodCliente' ).AsString <> '' Then
   Begin
      If _dm.qr11.Locate( 'CodCliente', _dm.qr06.FieldByName( 'CodCliente' ).AsString, [] ) Then
      Begin
         edtEndereco.Color := clWindow;
         edtEndereco.Text  := ControlaCampoTexto( _dm.qr11.FieldByName( 'Endereco' ).AsString );
         edtBairro.Text    := ControlaCampoTexto( _dm.qr11.FieldByName( 'Bairro' ).AsString );
         edtCidade.Text    := ControlaCampoTexto( _dm.qr11.FieldByName( 'Cidade' ).AsString );
         edtCEP.Text       := ControlaCampoTexto( _dm.qr11.FieldByName( 'CEP' ).AsString );
         edtFone1.Text     := ControlaCampoTexto( _dm.qr11.FieldByName( 'Fone1' ).AsString );
         edtFone2.Text     := ControlaCampoTexto( _dm.qr11.FieldByName( 'Fone2' ).AsString );
         edtFax.Text       := ControlaCampoTexto( _dm.qr11.FieldByName( 'Fax' ).AsString );
         edtCelular.Text   := ControlaCampoTexto( _dm.qr11.FieldByName( 'Celular' ).AsString );
         edtEmail.Text     := ControlaCampoTexto( _dm.qr11.FieldByName( 'e-mail' ).AsString );
      End
      Else
      Begin
         edtEndereco.Color := clAqua;
         edtEndereco.Text  := 'Dados incorretos no Cadastro';
         edtBairro.Text    := '';
         edtCidade.Text    := '';
         edtCEP.Text       := '';
         edtFone1.Text     := '';
         edtFone2.Text     := '';
         edtFax.Text       := '';
         edtCelular.Text   := '';
         edtEmail.Text     := '';
      End;
   End
   Else
   Begin
      cbClientes.Color  := clLime;
      cbClientes.Text   := 'Cliente não informado. Dados incorretos no Cadastro';
      edtEndereco.Color := clLime;
      edtEndereco.Text  := 'Cliente não informado. Dados incorretos no Cadastro';
      edtBairro.Text    := '';
      edtCidade.Text    := '';
      edtCEP.Text       := '';
      edtFone1.Text     := '';
      edtFone2.Text     := '';
      edtFax.Text       := '';
      edtCelular.Text   := '';
      edtEmail.Text     := '';
   End;
end;

procedure T_Registro_Servico.sbNovaOSClick(Sender: TObject);
Var
   lCtrl : Boolean;
begin
   cFlg := 'N';
   cRetorno := '';
   lCtrl := True;
   Controle( False );
   LimpaDados;
   lblNOs.Caption := ''; // 'O.S. nova:'#13'' + cNova;
   If MessageDlg( 'O.S. em Retorno ?'#13'(Garantia interna)', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
   Begin
      While lCtrl Do
      Begin
         cRetorno := InputBox( 'O.S. Anterior', 'Número:', '0' );
         If cRetorno <> '0' Then
         Begin   //
            lblRetorno.Caption := cRetorno;
            lblRetornoTexto.Visible := True;
            TempoRetorno.Enabled := True;
            RetornoOS( cRetorno );
            lCtrl := False;
         End
         Else
         Begin
            lblRetorno.Caption := '';
            lblRetornoTexto.Visible := False;
            lCtrl := False;
         End;
      End;
   End;
   cbClientes.SetFocus;
end;

procedure T_Registro_Servico.sbAlterarOSClick(Sender: TObject);
begin
   cFlg  := 'A';
   cNova := _dm.qr06.FieldByName( 'OS' ).AsString;
   Controle( False );
   cbClientes.SetFocus;
end;

procedure T_Registro_Servico.LimpaDados;
begin
   cNova                   := '';
   cbClientes.Text         := '';
   cbClientes.ItemIndex    := -1;
   edtEndereco.Text        := '';
   edtBairro.Text          := '';
   edtCidade.Text          := '';
   edtCEP.Text             := '';
   edtFone1.Text           := '';
   edtFone2.Text           := '';
   edtFax.Text             := '';
   edtCelular.Text         := '';
   edtEmail.Text           := '';
   cbEquipamento.Text      := '';
   cbEquipamento.ItemIndex := -1;
   edtComplemento.Text     := '';
   edtDefeito.Text         := '';
   edtSerie.Text           := '';
   cbArea.Text             := '';
   cbArea.ItemIndex        := -1;
   edtObs.Text             := '';
   edtDataEntrada.Text     := DateToStr( Now );
   edtOrcamento.Text       := '';
   edtDataSaida.Text       := '';
   chkPago.Checked         := False;
   edtDataPrevisto.Text    := '';
   edtPago.Text            := '';
   cbSituacao.Text         := '';
   cbSituacao.ItemIndex    := -1;
   cbTecnico.Text          := '';
   cbTecnico.ItemIndex     := -1;
   cbExecutante.Text       := '';
   cbExecutante.ItemIndex  := -1;
   edtObs.Text             := '';
   edtServico.Text         := '';
   cbClientes.Color        := clWindow;
   cbEquipamento.Color     := clWindow;
   cbArea.Color            := clWindow;
   cbSituacao.Color        := clWindow;
   cbTecnico.Color         := clWindow;
   cbExecutante.Color      := clWindow;
end;

procedure T_Registro_Servico.cbClientesExit(Sender: TObject);
begin
   If cbClientes.Text <> '' Then
   Begin
      If cbClientes.ItemIndex < 0 Then
      Begin
         ShowMessage( 'Nome de Cliente não localizado no Cadastro.'#13'Será registrado.' );
         cNovoCliente := 'N';
         Exit;
      End
      Else
      Begin
         _dm.qr11.Close;
         _dm.qr11.SQL.Text := 'select * from Clientes';
         _dm.qr11.Open;
         If _dm.qr11.Locate( 'CodCliente', _Main.stlClientes.Strings[ cbClientes.ItemIndex ], [] ) Then
         Begin
            edtEndereco.Text  := ControlaCampoTexto( _dm.qr11.FieldByName( 'Endereco' ).AsString );
            edtBairro.Text    := ControlaCampoTexto( _dm.qr11.FieldByName( 'Bairro' ).AsString );
            edtCidade.Text    := ControlaCampoTexto( _dm.qr11.FieldByName( 'Cidade' ).AsString );
            edtCEP.Text       := ControlaCampoTexto( _dm.qr11.FieldByName( 'CEP' ).AsString );
            edtFone1.Text     := ControlaCampoTexto( _dm.qr11.FieldByName( 'Fone1' ).AsString) ;
            edtFone2.Text     := ControlaCampoTexto( _dm.qr11.FieldByName( 'Fone2' ).AsString );
            edtFax.Text       := ControlaCampoTexto( _dm.qr11.FieldByName( 'Fax' ).AsString );
            edtCelular.Text   := ControlaCampoTexto( _dm.qr11.FieldByName( 'Celular' ).AsString );
            edtEmail.Text     := ControlaCampoTexto( _dm.qr11.FieldByName( 'e-mail' ).AsString );
            cbEquipamento.SetFocus;
         End;
      End;
   End;
end;

procedure T_Registro_Servico.edtCEPExit(Sender: TObject);
begin
   If edtCEP.Text <> '' Then edtCEP.Text := FormataCEP( edtCEP.Text );
end;

procedure T_Registro_Servico.edtFone1Exit(Sender: TObject);
begin
   If edtFone1.Text <> '' Then edtFone1.Text := FormataFone( edtFone1.Text );
end;

procedure T_Registro_Servico.edtCelularExit(Sender: TObject);
begin
   If edtCelular.Text <> '' Then edtCelular.Text := FormataFone( edtCelular.Text );
end;

procedure T_Registro_Servico.edtEmailExit(Sender: TObject);
begin
   If cNovoCliente = 'N' Then
   Begin
      If MessageDlg( 'Confirma registro deste Novo Cliente ?', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
      Begin
         edtEndereco.Text  := ControlaCampoTexto( edtEndereco.Text );
         edtBairro.Text    := ControlaCampoTexto( edtBairro.Text );
         edtCidade.Text    := ControlaCampoTexto( edtCidade.Text );
         If edtCEP.Text = '' Then edtCEP.Text := '50.000-000';
         edtFone1.Text     := ControlaCampoTexto( edtFone1.Text );
         edtFone2.Text     := ControlaCampoTexto( edtFone2.Text );
         edtFax.Text       := ControlaCampoTexto( edtFax.Text );
         edtCelular.Text   := ControlaCampoTexto( edtCelular.Text );
         edtEmail.Text     := ControlaCampoTexto( edtEmail.Text );
         _dm.qr12.Close;
         _dm.qr12.SQL.Text := 'select * from CLIENTES';
         _dm.qr12.Open;
         _dm.qr12.Insert;
         _dm.qr12.FieldByName( 'NomeCliente' ).AsString := cbClientes.Text;
         _dm.qr12.FieldByName( 'ENDERECO' ).AsString    := edtEndereco.Text;
         _dm.qr12.FieldByName( 'BAIRRO' ).AsString      := edtBairro.Text;
         _dm.qr12.FieldByName( 'CIDADE' ).AsString      := edtCidade.Text;
         _dm.qr12.FieldByName( 'CEP' ).AsString         := edtCEP.Text;
         _dm.qr12.FieldByName( 'FONE1' ).AsString       := edtFone1.Text;
         _dm.qr12.FieldByName( 'FONE2' ).AsString       := edtFone2.Text;
         _dm.qr12.FieldByName( 'FAX' ).AsString         := edtFax.Text;
         _dm.qr12.FieldByName( 'CELULAR' ).AsString     := edtCelular.Text;
         _dm.qr12.FieldByName( 'OBS' ).AsString         := 'Registrado em ' + DateTimeToStr( Now ) + '.';
         _dm.qr12.FieldByName( 'e-mail' ).AsString      := edtEmail.Text;
         _dm.qr12.Post;
         _dm.qr12.Close;
      End;
   End;
end;

procedure T_Registro_Servico.Apoio( x: Boolean );
begin
   edtOrcamento.Visible    := x;
   edtDataSaida.Visible    := x;
   chkPago.Visible         := x;
   edtDataPrevisto.Visible := x;
   edtPago.Visible         := x;
   lblExecutante.Visible   := x;
   edtServico.Visible      := x;
   cbExecutante.Visible    := x;
end;

procedure T_Registro_Servico.btnCancelarClick(Sender: TObject);
begin
   lblRetorno.Caption := '';
   lblRetornoTexto.Visible := False;
   Controle( True );
   Apoio( True );
   cFlg := '';
   _dm.qr06.Close;
   _dm.qr06.Open;
   dbgOS.SetFocus;
end;

procedure T_Registro_Servico.btnSalvarClick(Sender: TObject); // Registro de dados do Serviço:
begin
   If cNovoCliente = 'N' Then
   Begin
      _Main.stlClientes.Clear;
      _dm.qr11.Close;
      _dm.qr11.SQL.Text := 'select * from CLIENTES order by NomeCliente';
      _dm.qr11.Open;
      cbClientes.Clear;
      While Not _dm.qr11.Eof Do
      Begin
         cbClientes.Items.Add( _dm.qr11.FieldByName( 'NomeCliente' ).AsString );
         _Main.stlClientes.Add( _dm.qr11.FieldByName( 'CodCliente' ).AsString );
         _dm.qr11.Next;
      End;
   End;

   If cbEquipamento.Text = '' Then
   Begin
      MessageDlg( 'Favor informar a Situação', mtWarning, [ mbOk ], 0 );
      cbEquipamento.SetFocus;
      Exit;
   End;

   If cbArea.Text = '' Then
   Begin
      MessageDlg( 'Favor informar a Área', mtWarning, [ mbOk ], 0 );
      cbArea.SetFocus;
      Exit;
   End;

   If cbSituacao.Text = '' Then
   Begin
      MessageDlg( 'Favor informar a Situação', mtWarning, [ mbOk ], 0 );
      cbSituacao.SetFocus;
      Exit;
   End;

   If cbTecnico.Text = '' Then
   Begin
      MessageDlg( 'Favor informar o Técnico', mtWarning, [ mbOk ], 0 );
      cbTecnico.SetFocus;
      Exit;
   End;

   If ( cbExecutante.Text = '' ) and ( edtOrcamento.Text <> '' ) and ( edtOrcamento.Text <> '0' ) Then
   Begin
      MessageDlg( 'Favor informar o Técnico Executante', mtWarning, [ mbOk ], 0 );
      cbExecutante.SetFocus;
      Exit;
   End;

   If cFlg = 'N' Then
   Begin
      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'select * from Servicos order by OS';
      _dm.qr12.Open;
      _dm.qr12.Last;
      cNova := IntToStr( _dm.qr12.FieldByName( 'OS' ).AsInteger + 1 );
      lblNOs.Caption := 'O.S. nova:'#13'' + cNova;
      edtOs.Text     := cNova;
      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'select * from Servicos';
      _dm.qr12.Open;
      _dm.qr12.Insert;
      _dm.qr12.FieldByName( 'OS' ).AsString                := cNova;
      _dm.qr12.FieldByName( 'CodCliente' ).AsString        := _Main.stlClientes.Strings[ cbClientes.ItemIndex ];
      _dm.qr12.FieldByName( 'Situacao' ).AsString          := _Main.stlSit.Strings[ cbSituacao.ItemIndex ];
      _dm.qr12.FieldByName( 'Equipamento' ).AsString       := _Main.stlEquip.Strings[ cbEquipamento.ItemIndex ];
      _dm.qr12.FieldByName( 'Complemento' ).AsString       := edtComplemento.Text;
      _dm.qr12.FieldByName( 'NSerie' ).AsString            := edtSerie.Text;
      _dm.qr12.FieldByName( 'Defeito' ).AsString           := edtDefeito.Text;
      _dm.qr12.FieldByName( 'DataEntrada' ).AsString       := edtDataEntrada.Text;
//      _dm.qr12.FieldByName( 'Executante' ).AsString        := _Main.stlFunc.Strings[ cbExecutante.ItemIndex ];
      _dm.qr12.FieldByName( 'Tecnico' ).AsString           := _Main.stlFunc.Strings[ cbTecnico.ItemIndex ];
//      _dm.qr12.FieldByName( 'Pago' ).AsBoolean             := chkPago.Checked;
//      _dm.qr12.FieldByName( 'DataSaida' ).AsString         := edtDataSaida.Text;
//      _dm.qr12.FieldByName( 'ValorOrcamento' ).AsString    := edtOrcamento.Text;
//      _dm.qr12.FieldByName( 'Valor' ).AsString             := edtPago.Text;
//      _dm.qr12.FieldByName( 'PrevisaoPagamento' ).AsString := edtDataPrevisto.Text;
      _dm.qr12.FieldByName( 'ServicoExecutado' ).AsString  := ControlaCampoTexto( edtServico.Text );
      _dm.qr12.FieldByName( 'Area' ).AsString              := _Main.stlArea.Strings[ cbArea.ItemIndex ];
      _dm.qr12.FieldByName( 'Obs' ).AsString               := edtObs.Text;
      _dm.qr12.FieldByName( 'Anterior' ).AsString          := cRetorno;
      _dm.qr12.Post;
      _dm.qr12.Close;
      Apoio( True );
      GravarIni( _Main.cLocal + 'GS.INI', 'Numeracao', 'OS', cNova );
      pnlOS.Caption := cNova;
   End;
   If cFlg = 'A' Then
   Begin
      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'select * from Servicos';
      _dm.qr12.Open;
      _dm.qr12.Locate( 'OS', cNova, [] );
      _dm.qr12.Edit;
      _dm.qr12.FieldByName( 'OS' ).AsString                := edtOs.Text;
      _dm.qr12.FieldByName( 'CodCliente' ).AsString        := _Main.stlClientes.Strings[ cbClientes.ItemIndex ];
      _dm.qr12.FieldByName( 'Situacao' ).AsString          := _Main.stlSit.Strings[ cbSituacao.ItemIndex ];
      _dm.qr12.FieldByName( 'Equipamento' ).AsString       := _Main.stlEquip.Strings[ cbEquipamento.ItemIndex ];
      _dm.qr12.FieldByName( 'Complemento' ).AsString       := edtComplemento.Text;
      _dm.qr12.FieldByName( 'NSerie' ).AsString            := edtSerie.Text;
      _dm.qr12.FieldByName( 'Defeito' ).AsString           := edtDefeito.Text;
      _dm.qr12.FieldByName( 'DataEntrada' ).AsString       := edtDataEntrada.Text;
      If cbExecutante.Text <> '' Then
         _dm.qr12.FieldByName( 'Executante' ).AsString     := _Main.stlFunc.Strings[ cbExecutante.ItemIndex ];
      _dm.qr12.FieldByName( 'Tecnico' ).AsString           := _Main.stlFunc.Strings[ cbTecnico.ItemIndex ];
      _dm.qr12.FieldByName( 'Pago' ).AsBoolean             := chkPago.Checked;
      _dm.qr12.FieldByName( 'DataSaida' ).AsString         := edtDataSaida.Text;
      _dm.qr12.FieldByName( 'ValorOrcamento' ).AsString    := edtOrcamento.Text;
      _dm.qr12.FieldByName( 'Valor' ).AsString             := edtPago.Text;
      _dm.qr12.FieldByName( 'PrevisaoPagamento' ).AsString := edtDataPrevisto.Text;
      _dm.qr12.FieldByName( 'ServicoExecutado' ).AsString  := ControlaCampoTexto( edtServico.Text );
      _dm.qr12.FieldByName( 'Area' ).AsString              := _Main.stlArea.Strings[ cbArea.ItemIndex ];
      _dm.qr12.FieldByName( 'Obs' ).AsString               := edtObs.Text;
      _dm.qr12.FieldByName( 'Anterior' ).AsString          := cRetorno;
      _dm.qr12.Post;
      _dm.qr12.Close;
   End;

   If MessageDlg( Iif( cFlg, 'N', '', 'Re-' ) + 'Imprimir O.S. Nº ' + cNova + ' ?', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
   Begin
      _Imprimir_OS := T_Imprimir_OS.Create( Self );
      Try
         _Imprimir_OS.lblNOs.Caption := cNova;
         _Imprimir_OS.Print;
      Finally
         _Imprimir_OS.Free;
         _Imprimir_OS := Nil;
      End;
   End;
   lblRetorno.Caption := '';
   lblRetornoTexto.Visible := False;
   cNovoCliente := '';
   Controle( True );
   cFlg := '';
   _dm.qr06.Close;
   _dm.qr06.Open;
   _dm.qr06.Last;
   nOs := _dm.qr06.FieldByName( 'OS' ).AsInteger;
   pnlOS.Caption := FormatFloat( '###,##0', nOs );
   _dm.qr06.First;
   dbgOS.SetFocus;
end;

procedure T_Registro_Servico.cbExecutanteExit(Sender: TObject);
begin
   If cbExecutante.Text <> '' Then cbExecutante.Color := clWindow;
end;

procedure T_Registro_Servico.edtDataEntradaExit(Sender: TObject);
begin
   If edtDataEntrada.Text <> '' Then edtDataEntrada.Text := FormataDATA( edtDataEntrada.Text );
end;

procedure T_Registro_Servico.edtOrcamentoExit(Sender: TObject);
begin
//   If edtOrcamento.Text <> '' Then edtOrcamento.Text := FormataDATA( edtOrcamento.Text );
end;

procedure T_Registro_Servico.edtDataSaidaExit(Sender: TObject);
begin
   If edtDataSaida.Text <> '' Then edtDataSaida.Text := FormataDATA( edtDataSaida.Text );
end;

procedure T_Registro_Servico.edtDataPrevistoExit(Sender: TObject);
begin
   If edtDataPrevisto.Text <> '' Then edtDataPrevisto.Text := FormataDATA( edtDataPrevisto.Text );
end;

procedure T_Registro_Servico.chkPagoExit(Sender: TObject);
begin
   If chkPago.Checked Then edtPago.SetFocus;
end;

procedure T_Registro_Servico.RetornoOS( cNumero : String );
begin
   _dm.qrAux.Close;
   _dm.qrAux.SQL.Text := 'select * from Servicos';
   _dm.qrAux.Open;
   If _dm.qrAux.Locate( 'OS', cNumero, [] ) Then
   Begin
      cbClientes.ItemIndex    := _main.stlClientes.IndexOf( _dm.qrAux.FieldByName( 'CodCliente' ).AsString );
      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'select * from CLIENTES';
      _dm.qr12.Open;
      _dm.qr12.Locate( 'CodCliente', _dm.qrAux.FieldByName( 'CodCliente' ).AsString, [] );
      edtEndereco.Text        := _dm.qr12.FieldByName( 'ENDERECO' ).AsString;
      edtBairro.Text          := _dm.qr12.FieldByName( 'BAIRRO' ).AsString;
      edtCidade.Text          := _dm.qr12.FieldByName( 'CIDADE' ).AsString;
      edtCEP.Text             := _dm.qr12.FieldByName( 'CEP' ).AsString;
      edtFone1.Text           := _dm.qr12.FieldByName( 'FONE1' ).AsString;
      edtFone2.Text           := _dm.qr12.FieldByName( 'FONE2' ).AsString;
      edtFax.Text             := _dm.qr12.FieldByName( 'FAX' ).AsString;
      edtCelular.Text         := _dm.qr12.FieldByName( 'CELULAR' ).AsString;
      edtEmail.Text           := _dm.qr12.FieldByName( 'e-mail' ).AsString;
      cbEquipamento.ItemIndex := _main.stlEquip.IndexOf( _dm.qrAux.FieldByName( 'Equipamento' ).AsString );
      edtComplemento.Text     := _dm.qrAux.FieldByName( 'Complemento' ).AsString;
      edtDefeito.Text         := _dm.qrAux.FieldByName( 'Defeito' ).AsString;
      edtSerie.Text           := _dm.qrAux.FieldByName( 'NSerie' ).AsString;
      cbArea.ItemIndex        := _main.stlArea.IndexOf( _dm.qrAux.FieldByName( 'Area' ).AsString );
      edtObs.Text             := _dm.qrAux.FieldByName( 'Obs' ).AsString;
      edtDataEntrada.Text     := _dm.qrAux.FieldByName( 'DataEntrada' ).AsString;
//      edtOrcamento.Text       := _dm.qrAux.FieldByName( 'x' ).AsString;
//      edtDataSaida.Text       := _dm.qrAux.FieldByName( 'x' ).AsString;
      chkPago.Checked         := False;
//      edtDataPrevisto.Text    := _dm.qrAux.FieldByName( 'x' ).AsString;
//      edtPago.Text            := _dm.qrAux.FieldByName( 'x' ).AsString;
      cbSituacao.ItemIndex    := _main.stlSit.IndexOf( _dm.qrAux.FieldByName( 'Situacao' ).AsString );
      cbTecnico.ItemIndex     := _main.stlFunc.IndexOf( _dm.qrAux.FieldByName( 'Tecnico' ).AsString );
//      cbExecutante.ItemIndex  := _dm.qrAux.FieldByName( 'x' ).AsInteger;
      edtObs.Text             := _dm.qrAux.FieldByName( 'Obs' ).AsString;
      edtServico.Text         := _dm.qrAux.FieldByName( 'ServicoExecutado' ).AsString;
   End
   Else
   Begin
      ShowMessage( 'Número de O.S. informado não'#13'localizado na Tabela de Serviços.' );
      cRetorno := '';
   End;
end;

procedure T_Registro_Servico.TempoRetornoTimer(Sender: TObject);
begin
   If lblRetorno.visible = False Then
   Begin
      lblRetorno.visible := True;
   End
   Else
      lblRetorno.visible := False;
end;

procedure T_Registro_Servico.sbImprimirClick(Sender: TObject);
begin//
   _Imprimir_OS := T_Imprimir_OS.Create( Self );
   Try
//      _Imprimir_OS.nOs := IntToStr( nOs );
      _Imprimir_OS.lblNOs.Caption := IntToStr( nOs );
      _Imprimir_OS.Preview;
   Finally
      _Imprimir_OS.Free;
      _Imprimir_OS := Nil;
   End;
end;

end.

