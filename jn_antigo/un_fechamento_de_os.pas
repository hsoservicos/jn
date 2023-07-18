unit un_fechamento_de_os;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, Buttons;

type
   T_fechamento_de_os = class(TForm)
    gbServico: TGroupBox;
    edtOs: TEdit;
    gbDadosServico: TGroupBox;
    lblSituacao: TLabel;
    lblTecnicos: TLabel;
    cbSituacao: TComboBox;
    cbTecnico: TComboBox;
    edtDataEntrada: TLabeledEdit;
    edtNumero: TLabeledEdit;
    gbDadosFechamento: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    cbSituacaoAtual: TComboBox;
    edtObservacoes: TMemo;
    edtSaida: TLabeledEdit;
    chkPago: TCheckBox;
    edtPrevisto: TLabeledEdit;
    edtPago: TLabeledEdit;
    edtServicoExecutado: TLabeledEdit;
    stb: TStatusBar;
    edtOrcamento: TLabeledEdit;
    btnFechar: TBitBtn;
    lblExecutante: TLabel;
    cbExecutante: TComboBox;
    lblFechada: TLabel;
    lblEquipamento: TLabel;
    edtPortador: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtOsExit(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtSaidaExit(Sender: TObject);
    procedure edtPrevistoExit(Sender: TObject);
    procedure chkPagoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private    { Private declarations }
   Procedure Dados;
  public     { Public declarations }
  end;

var
   _fechamento_de_os: T_fechamento_de_os;

implementation

uses Un_dm, Un_Main, un_recibo_os, DB, Un_UDF;

{$R *.dfm}

procedure T_fechamento_de_os.Dados;
begin
   edtObservacoes.Clear;
   cbSituacaoAtual.Text := '';
   cbSituacaoAtual.ItemIndex := -1;
   gbDadosServico.Enabled := False;
   edtOs.Text := '';
   lblEquipamento.Caption := '';
end;

procedure T_fechamento_de_os.FormCreate(Sender: TObject);
begin
// Situações:
   cbSituacaoAtual.Clear;
   cbSituacaoAtual.ItemIndex := -1;
   _main.stlSit.Clear;
   _dm.qrAux.Close;
   _dm.qrAux.SQL.Text := 'select * from Situacao';
   _dm.qrAux.Open;
   while not _dm.qrAux.Eof do
   begin
      _main.stlSit.Add( _dm.qrAux.FieldByName( 'CodSituacao' ).AsString );
      cbSituacao.Items.Add( _dm.qrAux.FieldByName( 'Descricao' ).AsString );
      cbSituacaoAtual.Items.Add( _dm.qrAux.FieldByName( 'Descricao' ).AsString );
      _dm.qrAux.Next;
   end;
 // Técnicos e Executantes:
   cbTecnico.Clear;
   cbTecnico.ItemIndex := -1;
   cbExecutante.Clear;
   cbExecutante.ItemIndex := -1;
   _main.stlFunc.Clear;
   _dm.qrAux.Close;
   _dm.qrAux.SQL.Text := 'select * from Funcionarios where Funcão = 1';
   _dm.qrAux.Open;
   while not _dm.qrAux.Eof do
   begin
      _main.stlFunc.Add( _dm.qrAux.FieldByName( 'CodTecnicos' ).AsString );
      cbTecnico.Items.Add( _dm.qrAux.FieldByName( 'Apelido' ).AsString );
      cbExecutante.Items.Add( _dm.qrAux.FieldByName( 'Apelido' ).AsString );
      _dm.qrAux.Next;
   end;
   _dm.qrAux.Close;
end;

procedure T_fechamento_de_os.FormShow(Sender: TObject);
begin //
   lblFechada.Caption  := 'O.S. Fechada.';
   lblFechada.Visible  := False;
   edtPago.Visible     := False;
   edtPrevisto.Visible := False;
   Dados;
(*   _Main.stlFunc.Clear;
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from Funcionarios Where Funcão = 1 order by Apelido';
   _dm.qr11.Open;
   cbTecnico.Text := '';
   cbTecnico.Clear;
   cbExecutante.Text := '';
   cbExecutante.Clear;
   While Not _dm.qr11.Eof Do
   Begin
      cbExecutante.Items.Add( _dm.qr11.FieldByName( 'Apelido' ).AsString );
      _Main.stlFunc.Add( _dm.qr11.FieldByName( 'CodTecnicos' ).AsString );
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
*)
   edtOs.SetFocus;
end;

procedure T_fechamento_de_os.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin //
   Case Key Of
      VK_ESCAPE :
      Begin
         Close;
      End;
      VK_RETURN :
      Begin
         Perform( WM_NEXTDLGCTL, 0, 0 );
         Key := 0;
      End;
   End;
end;

procedure T_fechamento_de_os.FormClose(Sender: TObject; var Action: TCloseAction);
begin //
end;

procedure T_fechamento_de_os.edtOsExit(Sender: TObject);
begin
   If edtOs.Text <> '' Then
   Begin
      _dm.qrAux.Close;
      _dm.qrAux.SQL.Text := 'select * from Servicos';
      _dm.qrAux.Open;
      If Not _dm.qrAux.Locate( 'OS', edtOs.Text, [] ) Then
      Begin
         MessageDlg( 'Nº de Ordem de Serviço'#13'não localizado na tabela.', mtInformation, [ mbOk ], 0 );
         edtOs.Text := '';
         edtOs.SetFocus;
         Exit;
      End
      Else
      Begin
         If Not _dm.qrAux.FieldByName( 'Pago' ).AsBoolean Then
         Begin
            edtNumero.Text         := _dm.qrAux.FieldByName( 'OS' ).AsString;
            edtDataEntrada.Text    := _dm.qrAux.FieldByName( 'DataEntrada' ).AsString;
            edtOrcamento.Text      := _dm.qrAux.FieldByName( 'ValorOrcamento' ).AsString;
            cbTecnico.ItemIndex    := _Main.stlFunc.IndexOf( _dm.qrAux.FieldByName( 'Tecnico' ).AsString );
            cbExecutante.ItemIndex := -1;
            cbSituacao.ItemIndex   := _main.stlSit.IndexOf( _dm.qrAux.FieldByName( 'Situacao' ).AsString );
            edtObservacoes.Text    := _dm.qrAux.FieldByName( 'Obs' ).AsString;
            edtSaida.Text          := DateToStr( Now );
            lblEquipamento.Caption := '';
         End
         Else
         Begin
            If MessageDlg( 'O.S. com Sinalização de Fechada,'#13'Não poderá ser mais novamente Fechada.'#13''#13'Deseja re-Imprimir o Recibo de Fechamento :', mtWarning, [ mbYes, mbNo ], 0 ) = mrYes Then
            Begin
               lblFechada.Visible := True;
               Application.ProcessMessages;
               Try
                  _Recibo_OS := T_Recibo_OS.Create( Self );
                  _Recibo_OS.lblNRecibo.Caption  := edtOs.Text;
                  _Recibo_OS.PreviewInitialState := wsMaximized;
                  _Recibo_OS.Preview; // Print; //
               Finally
                  _Recibo_OS.Free;
                  _Recibo_OS := Nil;
               End;
               lblFechada.Visible := False;
               Application.ProcessMessages;
            End
            Else
            Begin
               Dados;
               edtOs.SetFocus;
            End;
         End;
      End;
   End;
end;

procedure T_fechamento_de_os.edtSaidaExit(Sender: TObject);
begin
   If edtSaida.Text <> '' Then edtSaida.Text := FormataDATA( edtSaida.Text );
end;

procedure T_fechamento_de_os.edtPrevistoExit(Sender: TObject);
begin
   If edtPrevisto.Text <> '' Then edtPrevisto.Text := FormataDATA( edtPrevisto.Text );
end;

procedure T_fechamento_de_os.btnFecharClick(Sender: TObject);
begin // Registrar e Imprimir Recibo de Saida com Garantia do Serviço executado.
   if (edtOs.Text = '') then
   begin
      edtOs.SetFocus;
      Exit;
   end;
   If chkPago.Checked Then
   Begin
      If edtPago.Text = '' Then
      Begin
         MessageDlg( 'Favor Informar:'#13'O Valor Pago pelo Cliente.', mtWarning, [ mbOk ], 0 );
         edtPago.SetFocus;
         Exit;
      End;
   End
   Else
   Begin
      If edtPrevisto.Text = '' Then
      Begin
         MessageDlg( 'Favor Informar:'#13'A Data para Pagamento pelo Cliente.', mtWarning, [ mbOk ], 0 );
         edtPrevisto.SetFocus;
         Exit;
      End;
   End;

   If (cbExecutante.Text = '') or (cbExecutante.ItemIndex = -1) Then
   Begin
      MessageDlg( 'Favor informar o'#13'Nome do Executante'#13'do Serviço.', mtWarning, [ mbOk ], 0 );
      cbExecutante.SetFocus;
      Exit;
   End;
   Try
      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'select * from Servicos';
      _dm.qr12.Open;
      _dm.qr12.Locate( 'OS', edtOs.Text, [] );
      _dm.qr12.Edit;
      _dm.qr12.FieldByName( 'Situacao' ).AsString          := IntToStr( cbSituacao.ItemIndex );
      If cbExecutante.Text <> '' Then
         _dm.qr12.FieldByName( 'Executante' ).AsString     := _Main.stlFunc.Strings[ cbExecutante.ItemIndex ];
      _dm.qr12.FieldByName( 'Pago' ).AsBoolean             := chkPago.Checked;
      _dm.qr12.FieldByName( 'DataSaida' ).AsString         := edtSaida.Text;
      _dm.qr12.FieldByName( 'Valor' ).AsString             := edtPago.Text;
      _dm.qr12.FieldByName( 'PrevisaoPagamento' ).AsString := edtPrevisto.Text;
      _dm.qr12.FieldByName( 'ServicoExecutado' ).AsString  := ControlaCampoTexto( edtServicoExecutado.Text );
      _dm.qr12.FieldByName( 'Obs' ).AsString               := edtObservacoes.Text;
      _dm.qr12.FieldByName( 'Controle' ).AsString          := 'x';
      _dm.qr12.FieldByName( 'Portador' ).AsString          := edtPortador.Text;
      _dm.qr12.FieldByName( 'Recibo' ).AsString            := edtOs.Text;
      _dm.qr12.Post;
      _dm.qr12.Close;
      lblFechada.Visible := True;
      Application.ProcessMessages;
      Try
         _Recibo_OS := T_Recibo_OS.Create( Self );
         _Recibo_OS.lblNRecibo.Caption  := edtOs.Text;
         _Recibo_OS.PreviewInitialState := wsMaximized;
         _Recibo_OS.Preview; // Print; //
      Finally
         _Recibo_OS.Free;
         _Recibo_OS := Nil;
      End;
   Except
      _dm.qr12.CancelUpdates;
      Raise Exception.Create( 'Erro no Fechamento.'#13'(Módulo Fechamento de Serviço)' );
   End;
   Dados;
   lblFechada.Visible := True;
   Application.ProcessMessages;
   edtOs.SetFocus;
end;

procedure T_fechamento_de_os.chkPagoExit(Sender: TObject);
begin
   If chkPago.Checked Then
   Begin
      edtPago.Visible     := True;
      edtPago.SetFocus;
      edtPrevisto.Visible := False;
   End
   Else
   Begin
      edtPago.Visible     := False;
      edtPrevisto.Visible := True;
      edtPrevisto.SetFocus;
   End;
   Exit;
end;

end.
