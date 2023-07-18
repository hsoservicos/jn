unit Un_ConsultarServico;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, ComCtrls, Buttons, DBCtrls;

type
  T_ConsultarServico = class(TForm)
    gbFiltro: TGroupBox;
    edtOS: TLabeledEdit;
    edtOS1: TLabeledEdit;
    dtEIni: TDateTimePicker;
    dtEFim: TDateTimePicker;
    Label1: TLabel;
    dtSIni: TDateTimePicker;
    dtSFim: TDateTimePicker;
    Label3: TLabel;
    edtSerie: TLabeledEdit;
    Panel1: TPanel;
    dsServ: TDataSource;
    dbgServicos: TDBGrid;
    lblCliente: TLabel;
    cbClientes: TComboBox;
    lblTecnicos: TLabel;
    cbTecnico: TComboBox;
    lblExecutante: TLabel;
    cbExecutante: TComboBox;
    cbSituacao: TComboBox;
    lblSituacao: TLabel;
    lblArea: TLabel;
    cbArea: TComboBox;
    lblEquipamento: TLabel;
    cbEquipamento: TComboBox;
    DBNavigator1: TDBNavigator;
    sbConsulta: TSpeedButton;
    sbLimpar: TSpeedButton;
    cbxOS: TCheckBox;
    cbxEntrada: TCheckBox;
    cbxSaida: TCheckBox;
    cbEntrada: TCheckBox;
    cbSaida: TCheckBox;
    pnlInforme: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbConsultaClick(Sender: TObject);
    procedure sbLimparClick(Sender: TObject);
    procedure cbEntradaClick(Sender: TObject);
    procedure cbSaidaClick(Sender: TObject);
    procedure dbgServicosCellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
   private    { Private declarations }
   cSQL, cAux : String;
   Procedure Exibir;
   public     { Public declarations }
   end;

var
   _ConsultarServico: T_ConsultarServico;

implementation

uses Un_Areas, Un_Clientes, Un_dm, Un_Equipamentos, Un_Funcionarios, Un_Main, Un_Situacoes, Un_UDF, Un_Exibir_OS;

{$R *.dfm}

procedure T_ConsultarServico.FormCreate(Sender: TObject);
begin //
   cSQL := '';
   cAux := '';
end;

procedure T_ConsultarServico.FormShow(Sender: TObject);
begin //
   _ConsultarServico.Caption := 'Consultar Geral de Serviço - Tecle <ESC> para finalizar';
   pnlInforme.Visible      := False;
   cbEntrada.Checked       := False;
   cbSaida.Checked         := False;
   dtEIni.Enabled          := cbEntrada.Checked;
   dtEFim.Enabled          := cbEntrada.Checked;
   dtSIni.Enabled          := cbSaida.Checked;
   dtSFim.Enabled          := cbSaida.Checked;
   dtEIni.Date             := StrToDate( '01/' + Copy( DateToStr( Now ), 4, 7 ) );
   dtEFim.Date             := Now;
   dtSIni.Date             := StrToDate( '01/' + Copy( DateToStr( Now ), 4, 7 ) );
   dtEFim.Date             := Now;
   edtOS.Text              := '';
   edtSerie.Text           := '';

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
   cbClientes.Text         := '';
   cbClientes.ItemIndex    := -1;

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
   cbEquipamento.Text      := '';
   cbEquipamento.ItemIndex := -1;

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
   cbArea.Text             := '';
   cbArea.ItemIndex        := -1;

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
   cbSituacao.Text        := '';
   cbSituacao.ItemIndex   := -1;

   _Main.stlFunc.Clear;
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select CodTecnicos, Apelido, Funcão from Funcionarios where Funcão = 1 order by Apelido';
   _dm.qr11.Open;
   cbTecnico.Text := '';
   cbTecnico.Clear;
   cbExecutante.Text := '';
   cbExecutante.Clear;
   While Not _dm.qr11.Eof Do
   Begin
      cAux := cAux + IntToStr( _dm.qr11.RecNo ) + _dm.qr11.FieldByName( 'Apelido' ).AsString + ''#13'';
      cbTecnico.Items.Add( _dm.qr11.FieldByName( 'Apelido' ).AsString );
      cbExecutante.Items.Add( _dm.qr11.FieldByName( 'Apelido' ).AsString );
      _Main.stlFunc.Add( _dm.qr11.FieldByName( 'CodTecnicos' ).AsString );
      _dm.qr11.Next;
   End;
   cbTecnico.Text          := '';
   cbTecnico.ItemIndex     := -1;
   cbExecutante.Text       := '';
   cbExecutante.ItemIndex  := -1;

   _dm.qr07.Close;
   _dm.qr07.SQL.Text := 'select * from Servicos where (1=1) ' + cSQL + ' order by DataEntrada, OS';
   _dm.qr07.Open;

end;

procedure T_ConsultarServico.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin //
   Case Key Of
      VK_ESCAPE : Close;
      VK_RETURN :
      Begin
         Perform( WM_NEXTDLGCTL, 0, 0 );
         Key := 0;
      End;
   End;
end;

procedure T_ConsultarServico.cbEntradaClick(Sender: TObject);
begin
   dtEIni.Enabled := cbEntrada.Checked;
   dtEFim.Enabled := cbEntrada.Checked;
   If cbEntrada.Checked Then dtEIni.SetFocus;
end;

procedure T_ConsultarServico.cbSaidaClick(Sender: TObject);
begin
   dtSIni.Enabled := cbSaida.Checked;
   dtSFim.Enabled := cbSaida.Checked;
   If cbSaida.Checked Then dtSIni.SetFocus;
end;

procedure T_ConsultarServico.sbLimparClick(Sender: TObject);
begin
   cSQL := '';
   pnlInforme.Visible      := False;
   cbEntrada.Checked       := False;
   cbSaida.Checked         := False;
   dtEIni.Enabled          := cbEntrada.Checked;
   dtEFim.Enabled          := cbEntrada.Checked;
   dtSIni.Enabled          := cbSaida.Checked;
   dtSFim.Enabled          := cbSaida.Checked;
   dtEIni.Date             := StrToDate( '01/' + Copy( DateToStr( Now ), 4, 7 ) );
   dtEFim.Date             := Now;
   dtSIni.Date             := StrToDate( '01/' + Copy( DateToStr( Now ), 4, 7 ) );
   dtEFim.Date             := Now;
   cbSituacao.Text         := '';
   cbArea.Text             := '';
   cbEquipamento.Text      := '';
   cbClientes.Text         := '';
   cbTecnico.Text          := '';
   cbExecutante.Text       := '';
   cbSituacao.ItemIndex    := -1;
   cbArea.ItemIndex        := -1;
   cbEquipamento.ItemIndex := -1;
   cbClientes.ItemIndex    := -1;
   cbTecnico.ItemIndex     := -1;
   cbExecutante.ItemIndex  := -1;
   edtOS.Text              := '';
   edtOS1.Text             := '';
   edtSerie.Text           := '';
   cbxOS.Checked           := False;
   cbxEntrada.Checked      := False;
   cbxSaida.Checked        := False;
   _dm.qr07.Close;
   _dm.qr07.SQL.Text := 'select * from Servicos where (1=1) ' + cSQL + ' order by DataEntrada, OS';
   _dm.qr07.Open;
end;

procedure T_ConsultarServico.sbConsultaClick(Sender: TObject);
Var
   cOrd : String;
begin
   cSQL := '';
   cOrd := 'DataEntrada, OS';;

   If ( edtOS.Text <> '' ) and ( edtOS1.Text = '' ) Then
   Begin
      cSQL := cSQL + ' and OS = ' + edtOS.Text + '';
   End;

   If ( edtOS.Text <> '' ) and ( edtOS1.Text <> '' ) Then
   Begin
      cSQL := cSQL + ' and OS between ' + edtOS.Text + ' and ' + edtOS1.Text + ''; // ' and OS >= "' + edtOS.Text + '" and OS <= "' + edtOS1.Text + '"';
      cOrd := 'OS';
   End;

   If cbxOS.Checked Then
   Begin
      cSQL := cSQL + ' and OS = 0';
   End;

   If cbxEntrada.Checked Then
   Begin
      cSQL := cSQL + ' and DataEntrada = null';
   End;

   If cbxSaida.Checked Then
   Begin
      cSQL := cSQL + ' and DataSaida = null';
   End;

   If cbEntrada.Checked Then
   Begin
      If ( DateToStr( dtEIni.Date ) <> '' ) and
         ( DateToStr( dtEFim.Date ) = '' ) Then
      Begin
         cSQL := cSQL + ' and DataEntrada = #' + InverteData( DateToStr( dtEIni.Date ) ) + '#';
      End;
      If ( DateToStr( dtEIni.Date ) <> '' ) and
         ( DateToStr( dtEFim.Date ) <> '' ) Then
      Begin
         cSQL := cSQL + ' and DataEntrada  between #' + InverteData( DateToStr( dtEIni.Date ) ) + '# and #' + InverteData( DateToStr( dtEFim.Date ) ) + '#';
      End;
   End;

   If cbSaida.Checked Then
   Begin
      If ( DateToStr( dtSIni.Date ) <> '' ) and
         ( DateToStr( dtSFim.Date ) = '' ) Then
      Begin
         cSQL := cSQL + ' and DataSaida = #' + InverteData( DateToStr( dtSIni.Date ) ) + '#';
      End;
      If ( DateToStr( dtEIni.Date ) <> '' ) and
         ( DateToStr( dtEFim.Date ) <> '' ) Then
      Begin
         cSQL := cSQL + ' and DataSaida between #' + InverteData( DateToStr( dtSIni.Date ) ) + '# and #' + InverteData( DateToStr( dtSFim.Date ) ) + '#';
      End;
   End;

   If edtSerie.Text <> '' Then
   Begin
      cSQL := cSQL + ' and NSerie = "' + edtSerie.Text + '"';
   End;

   If cbClientes.Text <> '' Then
   Begin
      cSQL := cSQL + ' and CodCliente = ' + _Main.stlClientes.Strings[ cbClientes.ItemIndex ] + '';
   End;

   If cbTecnico.Text <> '' Then
   Begin
      cSQL := cSQL + ' and Tecnico = ' + _Main.stlFunc.Strings[ cbTecnico.ItemIndex ] + '';
   End;

   If cbExecutante.Text <> '' Then
   Begin
      cSQL := cSQL + ' and Executante = ' + _Main.stlFunc.Strings[ cbExecutante.ItemIndex ] + '';
   End;

   If cbSituacao.Text <> '' Then
   Begin
      cSQL := cSQL + ' and Situacao = ' + _Main.stlSit.Strings[ cbSituacao.ItemIndex ] + '';
   End;

   If cbArea.Text <> '' Then
   Begin
      cSQL := cSQL + ' and Area = ' + _Main.stlArea.Strings[ cbArea.ItemIndex ] + '';
   End;

   If cbEquipamento.Text <> '' Then
   Begin
      cSQL := cSQL + ' and Equipamento = ' + _Main.stlEquip.Strings[ cbEquipamento.ItemIndex ] + '';
   End;

   _dm.qr07.Close;
   _dm.qr07.SQL.Text := 'select * from Servicos where (1=1) ' + cSQL + ' order by ' + cOrd;
   _dm.qr07.Open;

   If _dm.qr07.RecordCount > 0 Then
   Begin
      pnlInforme.Font.Color := clWindowText;
      pnlInforme.Caption := Iif( IntToStr( _dm.qr07.RecordCount ), '1', 'Foi encontrado ', 'Foram encontrados ' ) +
                            IntToStr( _dm.qr07.RecordCount ) +
                            Iif( IntToStr( _dm.qr07.RecordCount ), '1', ' Registro.', ' Registros.' );
   End
   Else
   Begin
      pnlInforme.Font.Color := clRed;
      pnlInforme.Caption := '>>> NÃO FOI ENCONTRADO NENHUM DADO <<<';
   End;
   pnlInforme.Visible := True;
   dbgServicos.SetFocus;
end;

procedure T_ConsultarServico.dbgServicosCellClick(Column: TColumn);
begin
   Exibir;
end;

procedure T_ConsultarServico.Exibir;
begin
   _Exibir_OS := T_Exibir_OS.Create( Self );
   Try
      If _dm.qr07.FieldByName( 'OS' ).AsString = '' Then
      Begin
         _Exibir_OS.edtOS.Color := clRed;
         _Exibir_OS.edtOS.Text  := '0000000000';
      End
      Else
      Begin
         _Exibir_OS.edtOS.Color := clWindow;
         _Exibir_OS.edtOS.Text  := _dm.qr07.FieldByName( 'OS' ).AsString;
      End;

      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'select CodCliente, NomeCliente from Clientes';
      _dm.qr12.Open;

      If _dm.qr07.FieldByName( 'CodCliente' ).AsString = '' Then
      Begin
         _Exibir_OS.edtCliente.Color := clRed;
         _Exibir_OS.edtCliente.Text := '>>> CLIENTE NÃO INFORMADO <<<';
      End
      Else
      Begin
         _dm.qr12.Locate( 'CodCliente', _dm.qr07.FieldByName( 'CodCliente' ).AsString, [] );
         _Exibir_OS.edtCliente.Color := clWindow;
         _Exibir_OS.edtCliente.Text  := _dm.qr12.FieldByName( 'NomeCliente' ).AsString;
      End;

      If _dm.qr07.FieldByName( 'Situacao' ).AsString = '' Then
      Begin
         _Exibir_OS.edtSituacao.Color := clRed;
         _Exibir_OS.edtSituacao.Text  := 'NÃO INFORMADO';
      End
      Else
      Begin
         _dm.qr12.Close;
         _dm.qr12.SQL.Text := 'select CodSituacao, Descricao from Situacao';
         _dm.qr12.Open;
         _dm.qr12.Locate( 'CodSituacao', _dm.qr07.FieldByName( 'Situacao' ).AsString, [] );
         _Exibir_OS.edtSituacao.Color := clWindow;
         _Exibir_OS.edtSituacao.Text  := _dm.qr12.FieldByName( 'Descricao' ).AsString;
      End;

      If _dm.qr07.FieldByName( 'Equipamento' ).AsString = '' Then
      Begin
         _Exibir_OS.edtEquipamento.Color := clRed;
         _Exibir_OS.edtEquipamento.Text  := 'NÃO INFORMADO';
      End
      Else
      Begin
         _dm.qr12.Close;
         _dm.qr12.SQL.Text := 'select CodEquipamento, Descricao from [Tipo de Equipamento]';
         _dm.qr12.Open;
         _dm.qr12.Locate( 'CodEquipamento', _dm.qr07.FieldByName( 'Equipamento' ).AsString, [] );
         _Exibir_OS.edtEquipamento.Color := clWindow;
         _Exibir_OS.edtEquipamento.Text  := _dm.qr12.FieldByName( 'Descricao' ).AsString;
      End;
      _Exibir_OS.edtComplemento.Text := _dm.qr07.FieldByName( 'Complemento' ).AsString;
      If _dm.qr07.FieldByName( 'NSerie' ).AsString = '' Then
      Begin
         _Exibir_OS.edtSerie.Color := clRed;
         _Exibir_OS.edtSerie.Text  := 'NÃO INFORMADO';
      End
      Else
      Begin
         _Exibir_OS.edtSerie.Color := clWindow;
         _Exibir_OS.edtSerie.Text  := _dm.qr07.FieldByName( 'NSerie' ).AsString;
      End;

      If _dm.qr07.FieldByName( 'Defeito' ).AsString = '' Then
      Begin
         _Exibir_OS.edtDefeito.Color := clRed;
         _Exibir_OS.edtDefeito.Text  := 'NÃO INFORMADO';
      End
      Else
      Begin
         _Exibir_OS.edtDefeito.Color := clWindow;
         _Exibir_OS.edtDefeito.Text  := _dm.qr07.FieldByName( 'Defeito' ).AsString;
      End;

      If _dm.qr07.FieldByName( 'DataEntrada' ).AsString = '' Then
      Begin
         _Exibir_OS.edtEntrada.Color := clRed;
         _Exibir_OS.edtEntrada.Text  := '';
      End
      Else
      Begin
         _Exibir_OS.edtEntrada.Color := clWindow;
         _Exibir_OS.edtEntrada.Text  := _dm.qr07.FieldByName( 'DataEntrada' ).AsString;
      End;

      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'select CodTecnicos, Apelido from Funcionarios';
      _dm.qr12.Open;
      If ( _dm.qr07.FieldByName( 'Tecnico' ).AsString <> '' ) and ( _dm.qr07.FieldByName( 'Tecnico' ).AsString <> '0' ) Then
      Begin
         _dm.qr12.Locate( 'CodTecnicos', _dm.qr07.FieldByName( 'Tecnico' ).AsString, [] );
         _Exibir_OS.edtTecnico.Color := clWindow;
         _Exibir_OS.edtTecnico.Text := _dm.qr12.FieldByName( 'Apelido' ).AsString;
      End
      Else
      Begin
         _Exibir_OS.edtTecnico.Color := clRed;
         _Exibir_OS.edtTecnico.Text  := 'Não informado';
      End;
      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'select CodTecnicos, Apelido from Funcionarios';
      _dm.qr12.Open;
      If ( _dm.qr07.FieldByName( 'Executante' ).AsString <> '' ) and ( _dm.qr07.FieldByName( 'Executante' ).AsString <> '0' ) Then
      Begin
         _dm.qr12.Locate( 'CodTecnicos', _dm.qr07.FieldByName( 'Executante' ).AsString, [] );
         _Exibir_OS.edtExecutante.Color := clWindow;
         _Exibir_OS.edtExecutante.Text := _dm.qr12.FieldByName( 'Apelido' ).AsString;
      End
      Else
      Begin
         _Exibir_OS.edtExecutante.Color := clRed;
         _Exibir_OS.edtExecutante.Text  := 'Não informado';
      End;

      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'select CodArea, Descricao from Area';
      _dm.qr12.Open;
      If _dm.qr07.FieldByName( 'Area' ).AsString <> '' Then
      Begin
         _dm.qr12.Locate( 'CodArea', _dm.qr07.FieldByName( 'Area' ).AsString, [] );
         _Exibir_OS.edtArea.Color := clWindow;
         _Exibir_OS.edtArea.Text  := _dm.qr12.FieldByName( 'Descricao' ).AsString;
      End
      Else
      Begin
         _Exibir_OS.edtArea.Color := clRed;
         _Exibir_OS.edtArea.Text := 'Não informado';
      End;

      If _dm.qr07.FieldByName( 'DataSaida' ).AsString <> '' Then
      Begin
         _Exibir_OS.Label18.Visible  := True;
         _Exibir_OS.edtSaida.Visible := True;
         _Exibir_OS.edtSaida.Text    := _dm.qr07.FieldByName( 'DataSaida' ).AsString;
      End
      Else
      Begin
         _Exibir_OS.Label18.Visible  := False;
         _Exibir_OS.edtSaida.Visible := False;
         _Exibir_OS.edtSaida.Text    := _dm.qr07.FieldByName( 'DataSaida' ).AsString;
      End;
      _Exibir_OS.cbPago.Checked   := _dm.qr07.FieldByName( 'Pago' ).AsBoolean; // O Campo PAGO é do tipo Boolean.
      _Exibir_OS.Label12.Visible  := _dm.qr07.FieldByName( 'Pago' ).AsBoolean;
      _Exibir_OS.edtValor.Visible := _dm.qr07.FieldByName( 'Pago' ).AsBoolean;
      If _dm.qr07.FieldByName( 'Pago' ).AsBoolean Then _Exibir_OS.edtValor.Color := clMoneyGreen;
      _Exibir_OS.edtValor.Text    := 'R$ ' + FormatCurr( '###,##0.00', _dm.qr07.FieldByName( 'Valor' ).AsFloat );

      If _dm.qr07.FieldByName( 'PrevisaoPagamento' ).AsString <> '' Then
      Begin
         _Exibir_OS.Label13.Visible     := True;
         _Exibir_OS.Label14.Visible     := True;
         _Exibir_OS.edtPrevisto.Visible := True;
         _Exibir_OS.edtPrevisto.Color   := clYellow;
         _Exibir_OS.edtPrevisto.Text    := _dm.qr07.FieldByName( 'PrevisaoPagamento' ).AsString;
      End
      Else
      Begin
         _Exibir_OS.Label13.Visible     := False;
         _Exibir_OS.Label14.Visible     := False;
         _Exibir_OS.edtPrevisto.Visible := False;
         _Exibir_OS.edtPrevisto.Text    := _dm.qr07.FieldByName( 'PrevisaoPagamento' ).AsString;
      End;
      If _dm.qr07.FieldByName( 'ServicoExecutado' ).AsString <> '' Then
      Begin
         _Exibir_OS.edtServico.Color := clWindow;
         _Exibir_OS.edtServico.Text  := _dm.qr07.FieldByName( 'ServicoExecutado' ).AsString;
      End
      Else
      Begin
         _Exibir_OS.edtServico.Color := clRed;
         _Exibir_OS.edtServico.Text  := 'SERVIÇO EXECUTADO NÃO INFORMADO';
      End;

      If _dm.qr07.FieldByName( 'Obs' ).AsString <> '' Then
      Begin
         _Exibir_OS.edtObservacao.Color := clWindow;
         _Exibir_OS.edtObservacao.Text := _dm.qr07.FieldByName( 'Obs' ).AsString;
      End
      Else
      Begin
         _Exibir_OS.edtObservacao.Color := clRed;
         _Exibir_OS.edtObservacao.Text  := 'NENHUMA OBSERVAÇÃO INFORMADA';
      End;

      If _dm.qr07.FieldByName( 'Anterior' ).AsString <> '' Then
      Begin
         _Exibir_OS.lblRetornoTexto.Visible := True;
         _Exibir_OS.lblRetornoTexto.Caption := 'Retorno O.S.:';
         _Exibir_OS.lblRetorno.Visible := True;
         _Exibir_OS.lblRetorno.Caption := _dm.qr07.FieldByName( 'Anterior' ).AsString;
      End
      Else
      Begin
         _Exibir_OS.lblRetornoTexto.Visible := False;
         _Exibir_OS.lblRetornoTexto.Caption := '';
         _Exibir_OS.lblRetorno.Visible := False;
         _Exibir_OS.lblRetorno.Caption := '';
      End;

      _Exibir_OS.Panel1.Enabled    := False;
      _Exibir_OS.btnFechar.Caption := 'Finalizar visualização da O.S. - ( ' + _dm.qr07.FieldByName( 'OS' ).AsString + ' )';
      _Exibir_OS.ShowModal;
   Finally
      _Exibir_OS.Release;
      _Exibir_OS := Nil;
   End;
end;

procedure T_ConsultarServico.SpeedButton1Click(Sender: TObject);
begin
   Close;
end;

end.
