unit un_baixa_de_os;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, Gauges;

type
   T_baixa_de_os = class(TForm)
    gbCliente: TGroupBox;
    lblCliente: TLabel;
    lblOS: TLabel;
    lblServicos: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    cbClientes: TComboBox;
    lbServicos: TListBox;
    gbServico: TGroupBox;
    edtDataSaida: TLabeledEdit;
    edtPago: TLabeledEdit;
    edtPortador: TLabeledEdit;
    stb: TStatusBar;
    btnTotalizar: TBitBtn;
    g: TGauge;
    btnFechar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbClientesExit(Sender: TObject);
    procedure btnTotalizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtPortadorExit(Sender: TObject);
   private    { Private declarations }
   public     { Public declarations }
      nRecibo : String;
      nTS : Real;
      stlValor : TStringList;
   end;

var
   _baixa_de_os: T_baixa_de_os;

implementation

uses Un_dm, un_funcoes, Un_Main; // , un_fechamento_de_os_varios;

{$R *.dfm}

procedure T_baixa_de_os.FormCreate(Sender: TObject);
begin //
   stlValor := TStringList.Create;
   _main.stlOs.Clear;
end;

procedure T_baixa_de_os.FormShow(Sender: TObject);
begin
   btnFechar.Caption   := 'Fechar'#13'O.S.';
   btnFechar.Visible   := False;
   Label1.Visible      := False;
   g.Visible           := False;
   lblServicos.Caption := '';
   lblOS.Caption       := '';
   edtDataSaida.Text   := DateToStr( Now );
   edtPago.Text        := '0,00';
   lbServicos.Items.Clear;
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

end;

procedure T_baixa_de_os.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
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

procedure T_baixa_de_os.cbClientesExit(Sender: TObject);
begin
   lblOS.Caption := '';
   lbServicos.Items.Clear;
   _dm.qr01.Close;
   _dm.qr01.SQL.Text := 'select * from Servicos where CodCliente = ' + _Main.stlClientes.Strings[ cbClientes.ItemIndex ] + ' and Controle is null order by OS';
   _dm.qr01.Open;
   If _dm.qr01.RecordCount = 0 Then
   Begin
      MessageDlg( 'Não foi Localizada nenhum Serviço ATIVO registrado para este Cliente.', mtInformation, [ mbOk ], 0 );
      cbClientes.SetFocus;
      Exit;
   End;
   lblServicos.Caption := Iif( IntToStr( _dm.qr01.RecordCount ), '1', 'Foi encontrada ', 'Foram encontradas ' ) + FormatFloat( '##,##0', _dm.qr01.RecordCount ) + ' O.S.';
   While Not _dm.qr01.Eof Do
   Begin
      lbServicos.Items.Add( _dm.qr01.FieldByName( 'OS' ).AsString + ' - ' + FormatFloat( 'R$ ##,##0.00', _dm.qr01.FieldByName( 'Valor' ).AsFloat ) );
      _dm.qr01.Next;
   End;
   lbServicos.SetFocus;
end;

procedure T_baixa_de_os.btnTotalizarClick(Sender: TObject);
var
   i : Integer;
   xA, xOS, lOS : String;
begin
   Label1.Visible := True;
   g.Visible := True;
   g.MinValue := 0;
   g.MaxValue := lbServicos.Items.Count - 1;
   nTS := 0;
   xA  := '';
   lOS := '';
   for i := 0 to lbServicos.Items.Count - 1 do
   Begin
      if (lbServicos.Selected[i]) then
      Begin
         Label1.Caption := lbServicos.Items.Strings[i];
         Application.ProcessMessages;
         xOS := Copy( lbServicos.Items.Strings[i], 1, Pos( ' - ', lbServicos.Items.Strings[i] ) - 1 );
         _main.stlOs.Add( xOS );
         lOS := lOS + xOS;
         xA := xA + xOS + ', ';
         If Length( xA ) > 75 Then
         Begin
            lOS := lOS + ','#13'';
            xA := '';
         End
         Else
            lOS := lOS + ', ';
         _dm.qrAux.Close;
         _dm.qrAux.SQL.Text := 'select * from Servicos';
         _dm.qrAux.Open;
         _dm.qrAux.Locate( 'OS', xOS, [] );
         nTS := nTS + _dm.qrAux.FieldByName( 'Valor' ).AsFloat;
         stlValor.Add( _dm.qrAux.FieldByName( 'Valor' ).AsString );
      End;
      g.Progress := i;
   End;
   lOS := Copy( lOS, 1, Length( lOS ) - 2 );
   lOS := lOS + '.';
   lblOS.Caption := lOS;
   edtPago.Text := FormatFloat( '##,##0.00', nTS );
   g.Visible := False;
   Label1.Visible := False;
   g.Visible := False;
   Application.ProcessMessages;
   edtPortador.SetFocus;
end;

procedure T_baixa_de_os.btnFecharClick(Sender: TObject);
Var
   i : integer;
begin // Fechamento das O.S.'s Selecionadas.
   If edtDataSaida.Text = '' Then
   Begin
      MessageDlg( 'Favor informar a Data de Saída dos equipamentos.', mtWarning, [ mbOk ], 0 );
      edtDataSaida.SetFocus;
      Exit;
   End;
   If edtPortador.Text = '' Then
   Begin
      MessageDlg( 'Favor informar o Nome do Portador'#13'que está retirando os equipamentos.', mtWarning, [ mbOk ], 0 );
      edtPortador.SetFocus;
      Exit;
   End;
   g.Visible  := True;
   g.MinValue := 0;
   g.MaxValue := _main.stlOs.Count - 1;
   nRecibo    := _main.stlOs.Strings[0];
   for i := 0 to _main.stlOs.Count - 1 do
   Begin
      Label1.Caption := 'O.S.: ' + _main.stlOs.Strings[i];
      Application.ProcessMessages;
      _dm.qrAux.Close;
      _dm.qrAux.SQL.Text := 'update Servicos set Controle = "x", Portador = "' + edtPortador.Text + '", ' +
                            'Situacao = 1, ' +
                            'Recibo = ' + _main.stlOs.Strings[i] + ', ' +
                            'Pago = True, ' +
                            'Valor = ' + stlValor.Strings[i] + ', ' +
                            'DataSaida = #' + f_InverteDate( edtDataSaida.Text ) + '#, ' +
                            'Selecionado = "x" ' +
                            'where OS = ' + nRecibo + '';
      _dm.qrAux.ExecSQL;
      g.Progress := i;
   End;
   Label1.Visible := False;
   g.Visible := False;
   Application.ProcessMessages;
   If MessageDlg( 'Imprimir Recibo dos Serviços ?', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
   Begin
      Try
         _fechamento_de_os_varios := T_fechamento_de_os_varios.Create( Self );
         _fechamento_de_os_varios.Preview;
      Finally
         _fechamento_de_os_varios.Destroy;
         _fechamento_de_os_varios := Nil;
      End;
   End;
   Try
      _dm.qrAux.Close;
      _dm.qrAux.SQL.Text := 'update Servicos set Selecionado = null where Selecionado is not null';
      _dm.qrAux.ExecSQL;
   Except
      _dm.qrAux.CancelUpdates;
      Raise Exception.Create( 'Falha de Processamento.'#13'(Módulo Baixa de O.S.)' );
   End;
   btnFechar.Visible    := False;
   cbClientes.Text      := '';
   cbClientes.ItemIndex := -1;
   cbClientes.SetFocus;
end;

procedure T_baixa_de_os.edtPortadorExit(Sender: TObject);
begin
   btnFechar.Visible := True;
   btnFechar.SetFocus;
end;

(*
Como obter e exibir todos os itens selecionados em uma TListBox de seleção múltipla
Este trecho de código mostra como podemos obter e exibir todos os itens selecionados em uma TListBox de seleção múltipla.
Para executá-lo, coloque uma ListBox, um Memo e um Button em um formulário.
Altere a propriedade MultiSelect da ListBox para True, adicione alguns itens e execute.
Selecione um ou mais itens e clique no botão para visualizar o resultado.
Note que usei um TStringList (classe concreta derivada de TStrings) para armazenar os itens selecionados.
Veja o código:

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
  selecionados: TStringList;
begin
  // para que este exemplo funcione corretamente, a ListBox
  // deverá permitir seleção múltipla ListBox1.MultiSelect := True;
  selecionados := TStringList.Create;
  // vamos obter os itens selecionados na ListBox
  if ListBox1.SelCount > 0 then
    begin
      for i := 0 to ListBox1.Count - 1 do
        begin
          if ListBox1.Selected[i] then
            selecionados.Add(ListBox1.Items[i]);
        end;
        // vamos exibir os itens selecionados em um TMemo
        Memo1.Lines.Clear;
        Memo1.Lines.Add('Os itens selecionados são:');
        for i := 0 to selecionados.Count - 1 do
          Memo1.Lines.Add(selecionados[i]);
    end
  else
    ShowMessage('Nenhum item selecionado.');
  // vamos liberar o TStringList
  selecionados.Free;
end;
Para fins de compatibilidade, esta dica foi escrita usando Delphi 2009. *)

end.
