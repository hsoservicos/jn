unit Un_Registro_Servico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons;

type
  T_Registro_Servico = class(TForm)
    dsServ: TDataSource;
    gbOS: TGroupBox;
    dbgOS: TDBGrid;
    DBNavigator1: TDBNavigator;
    gbCliente: TGroupBox;
    lblCliente: TLabel;
    cbClientes: TComboBox;
    rgConsultar: TRadioGroup;
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
    cbSitauacao: TComboBox;
    LabeledEdit2: TLabeledEdit;
    gbConsultaOS: TGroupBox;
    edtConsultaOS: TEdit;
    gbConsultaCliente: TGroupBox;
    cbConsultaCliente: TComboBox;
    gbConsultaSerie: TGroupBox;
    edtConsultaSerie: TEdit;
    lblTecnicos: TLabel;
    cbTecnico: TComboBox;
    lblExecutante: TLabel;
    cbExecutante: TComboBox;
    Label1: TLabel;
    edtObs: TMemo;
    SpeedButton1: TSpeedButton;
    procedure lblClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsServDataChange(Sender: TObject; Field: TField);
    procedure rgConsultarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgOSKeyPress(Sender: TObject; var Key: Char);
    procedure lblEquipamentoClick(Sender: TObject);
    procedure lblAreaClick(Sender: TObject);
    procedure edtConsultaOSExit(Sender: TObject);
    procedure cbConsultaClienteExit(Sender: TObject);
    procedure edtConsultaSerieExit(Sender: TObject);
    procedure lblSituacaoClick(Sender: TObject);
    procedure lblTecnicosClick(Sender: TObject);
    procedure lblExecutanteClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private    { Private declarations }
      cFlg, cBusca : String;
      Procedure Controle( x : Boolean );
  public     { Public declarations }
  end;

var
  _Registro_Servico: T_Registro_Servico;

implementation

uses Un_dm, Un_UDF, Un_Clientes, Un_Funcionarios, Un_Main, Un_Areas, Un_Equipamentos, Un_Situacoes;

{$R *.dfm}

procedure T_Registro_Servico.Controle( x: Boolean );
begin //
   gbCliente.Enabled     := Not x;
   gbEquipamento.Enabled := Not x;
   gbServico.Enabled     := Not x;
end;

procedure T_Registro_Servico.FormCreate(Sender: TObject);
begin
   cFlg   := '';
   cBusca := '';
   gbConsultaOS.Visible      := False;
   gbConsultaCliente.Visible := False;
   gbConsultaSerie.Visible   := False;
   edtDefeito.Hint           := 'Dados do defeito informado pelo cliente'#13'e/ou dados opicionais do equipamento.';
end;

procedure T_Registro_Servico.FormShow(Sender: TObject);
begin
   _Main.stlClientes.Clear;
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from CLIENTES order by NomeCliente';
   _dm.qr11.Open;
   cbClientes.Text := '';
   cbClientes.Clear;
   While Not _dm.qr11.Eof Do
   Begin
      cbClientes.Items.Add( _dm.qr11.FieldByName( 'NomeCliente' ).AsString );
      cbConsultaCliente.Items.Add( _dm.qr11.FieldByName( 'NomeCliente' ).AsString );
      _Main.stlClientes.Add( _dm.qr11.FieldByName( 'CodCliente' ).AsString );
      _dm.qr11.Next;
   End;
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
   _Main.stlSit.Clear;
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from Situacao order by Descricao';
   _dm.qr11.Open;
   cbSitauacao.Text := '';
   cbSitauacao.Clear;
   While Not _dm.qr11.Eof Do
   Begin
      cbSitauacao.Items.Add( _dm.qr11.FieldByName( 'Descricao' ).AsString );
      _Main.stlSit.Add( _dm.qr11.FieldByName( 'CodSituacao' ).AsString );
      _dm.qr11.Next;
   End;
   _Main.stlFunc.Clear;
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from Funcionarios order by NomeCompleto';
   _dm.qr11.Open;
   cbTecnico.Text := '';
   cbTecnico.Clear;
   cbExecutante.Text := '';
   cbExecutante.Clear;
   While Not _dm.qr11.Eof Do
   Begin
      cbTecnico.Items.Add( _dm.qr11.FieldByName( 'Apelido' ).AsString );
      cbExecutante.Items.Add( _dm.qr11.FieldByName( 'Apelido' ).AsString );
      _Main.stlSit.Add( _dm.qr11.FieldByName( 'CodTecnicos' ).AsString );
      _dm.qr11.Next;
   End;

   Controle( True );
   _dm.qr06.Close;
   _dm.qr06.SQL.Text := 'select * from Servicos order by OS';
   _dm.qr06.Open;
   dbgOS.SetFocus;
end;

procedure T_Registro_Servico.lblClienteClick(Sender: TObject);
begin
   _Clientes := T_Clientes.Create( Self );
   Try
      _Clientes.ShowModal;
   Finally
      _Clientes.Release;
      _Clientes := Nil;
   End;
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
end;

procedure T_Registro_Servico.lblEquipamentoClick(Sender: TObject);
begin
   _Equipamentos := T_Equipamentos.Create( Self );
   Try
      _Equipamentos.ShowModal;
   Finally
      _Equipamentos.Release;
      _Equipamentos := Nil;
   End;
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
end;

procedure T_Registro_Servico.lblAreaClick(Sender: TObject);
begin
   _Areas := T_Areas.Create( Self );
   Try
      _Areas.ShowModal;
   Finally
      _Areas.Release;
      _Areas := Nil;
   End;
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
end;

procedure T_Registro_Servico.dbgOSKeyPress(Sender: TObject; var Key: Char);
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
   _dm.qr06.Locate( 'OS', cBusca, [loPartialKey, loCaseInsensitive] );
end;

procedure T_Registro_Servico.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   Case Key Of
      VK_ESCAPE : Close;
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

procedure T_Registro_Servico.dsServDataChange(Sender: TObject; Field: TField);
begin // Mostra de Serviços.
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
         edtEndereco.Text  := _dm.qr11.FieldByName( 'Endereco' ).AsString;
         edtBairro.Text    := _dm.qr11.FieldByName( 'Bairro' ).AsString;
         edtCidade.Text    := _dm.qr11.FieldByName( 'Cidade' ).AsString;
         edtCEP.Text       := _dm.qr11.FieldByName( 'CEP' ).AsString;
         edtFone1.Text     := _dm.qr11.FieldByName( 'Fone1' ).AsString;
         edtFone2.Text     := _dm.qr11.FieldByName( 'Fone2' ).AsString;
         edtFax.Text       := _dm.qr11.FieldByName( 'Fax' ).AsString;
         edtCelular.Text   := _dm.qr11.FieldByName( 'Celular' ).AsString;
         edtEmail.Text     := _dm.qr11.FieldByName( 'e-mail' ).AsString;
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

   If _dm.qr06.FieldByName( 'Situacao' ).AsString <> '' Then
   Begin
      cbSitauacao.Color     := clWindow;
      cbSitauacao.ItemIndex := _Main.stlSit.IndexOf( _dm.qr06.FieldByName( 'Situacao' ).AsString );
   End
   Else
   Begin
      cbSitauacao.Color     := clRed;
      cbSitauacao.ItemIndex := -1;
   End;

   

end;

procedure T_Registro_Servico.rgConsultarClick(Sender: TObject);
begin
   dbgOS.Enabled := False;
   gbEquipamento.Caption := '[ Dados do Equipamento ]';
   Case rgConsultar.ItemIndex of
   0: // Todas da O.S.
   Begin
      _dm.qr06.Close;
      _dm.qr06.SQL.Text := 'select * from Servicos order by OS';
      _dm.qr06.Open;
      dbgOS.Enabled := True;
      dbgOS.SetFocus;
   End;
   1: // O.S. Nº
   Begin
      gbConsultaOS.Left := 266;
      gbConsultaOS.Top  := 212;
      gbConsultaOS.Visible := True;
      edtConsultaOS.Text := '';
      edtConsultaOS.SetFocus;
   End;
   2: // Cliente
   Begin
      gbConsultaCliente.Left := 135;
      gbConsultaCliente.Top  := 211;
      gbConsultaCliente.Visible := True;
      cbConsultaCliente.Text := '';
      cbConsultaCliente.SetFocus;
   End;
   3: // Nº de Série
   Begin
      gbConsultaSerie.Left := 265;
      gbConsultaSerie.Top  := 212;
      gbConsultaSerie.Visible := True;
      edtConsultaSerie.Text := '';
      edtConsultaSerie.SetFocus;
   End;
   End;
end;

procedure T_Registro_Servico.edtConsultaOSExit(Sender: TObject);
begin
   If edtConsultaOS.Text <> '' Then
   Begin
      If Not _dm.qr06.Locate( 'OS', edtConsultaOS.Text, [] ) Then
      Begin
         ShowMessage( 'A V I S O:'#13'Número de Ordem de Serviço'#13'não localizado no banco de dados,'#13'verifique o número digitado.' );
         edtConsultaOS.SetFocus;
         Exit;
      End;
      gbConsultaOS.Visible := False;
      dbgOS.Enabled := True;
      dbgOS.SetFocus;
      Exit;
   End;
end;

procedure T_Registro_Servico.cbConsultaClienteExit(Sender: TObject);
begin
   If cbConsultaCliente.Text <> '' Then
   Begin
      If Not _dm.qr06.Locate( 'CodCliente', _Main.stlClientes.Strings[ cbConsultaCliente.ItemIndex ], [] ) Then
      Begin
         ShowMessage( 'A V I S O:'#13'Nenhum número de Ordem de Serviço'#13'foi localizado no banco de dados,'#13'para este cliente.'#13''#13'Tente novamente, por favor.' );
         cbConsultaCliente.SetFocus;
         Exit;
      End
      Else
      Begin
         gbConsultaCliente.Visible := False;
         _dm.qr06.Close;
         _dm.qr06.SQL.Text := 'select * from Servicos where CodCliente = ' + _Main.stlClientes.Strings[ cbConsultaCliente.ItemIndex ] + ' order by OS';
         _dm.qr06.Open;
         gbEquipamento.Caption := '[ Dados do Equipamento ] Foram encontrado(s) ' + IntToStr( _dm.qr06.RecordCount ) + ' equipamento(s)';
         dbgOS.Enabled := True;
         dbgOS.SetFocus;
         Exit;
      End;
   End;
end;

procedure T_Registro_Servico.edtConsultaSerieExit(Sender: TObject);
begin
   If edtConsultaSErie.Text <> '' Then
   Begin
      If Not _dm.qr06.Locate( 'NSerie', edtConsultaSErie.Text, [] ) Then
      Begin
         ShowMessage( 'A V I S O:'#13'Número de Série'#13'não localizado no banco de dados,'#13'verifique o número digitado.' );
         edtConsultaOS.SetFocus;
         Exit;
      End;
      gbConsultaSerie.Visible := False;
      dbgOS.Enabled := True;
      dbgOS.SetFocus;
      Exit;
   End;
end;

procedure T_Registro_Servico.lblSituacaoClick(Sender: TObject);
begin
//
end;

procedure T_Registro_Servico.lblTecnicosClick(Sender: TObject);
begin
//
end;

procedure T_Registro_Servico.lblExecutanteClick(Sender: TObject);
begin
//
end;

procedure T_Registro_Servico.SpeedButton1Click(Sender: TObject);
begin
   Controle( False );
   cbClientes.SetFocus;
end;

end.
