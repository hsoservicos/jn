{
Contato com o João:

queria poder fazer estas alterações,que te enviei
também inserir valores
enfim ao invés de apenas visualizar poder inserir dados na os
se tiver como fazer isto sem te dar tanto trabalho,
seria bom mas se for muito trabalhoso,
deixa para outra hora

por exemplo na area defeito ou opcinionais

tem como eu alterar o defeito que maria coloca na hora que da entrada no material,
e para que eu inserir os dados referente ao serviço executado

e se precisar colocar alguma coisa no campo OBSERVAÇÃO
}

unit Un_Alterar_Servicos;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, ExtCtrls;

type
  T_Alterar_Servicos = class(TForm)
    gbOS: TGroupBox;
    gbCliente: TGroupBox;
    lblCliente: TLabel;
    gbEquipamento: TGroupBox;
    Labelx: TLabel;
    Labelz: TLabel;
    gbServico: TGroupBox;
    lblSituacao: TLabel;
    lblTecnicos: TLabel;
    lblExecutante: TLabel;
    Label1: TLabel;
    cbSitauacao: TComboBox;
    cbTecnico: TComboBox;
    cbExecutante: TComboBox;
    edtObs: TMemo;
    edtOrdamento: TLabeledEdit;
    sbSair: TSpeedButton;
    edtOs: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblNome: TLabel;
    lblEndereo: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblCEP: TLabel;
    lblFone1: TLabel;
    lblFone2: TLabel;
    lblFax: TLabel;
    lblCelular: TLabel;
    lblEmail: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    lblEquipamento: TLabel;
    lblComplemento: TLabel;
    lblDefeito: TLabel;
    Label24: TLabel;
    lblSerie: TLabel;
    lblArea: TLabel;
    btnAlterar: TBitBtn;
    Label11: TLabel;
    lblEntrada: TLabel;
    edtServico: TLabeledEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbSairClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtObsExit(Sender: TObject);
  private    { Private declarations }
   Procedure LimpaDados;
  public     { Public declarations }
  end;

var
   _Alterar_Servicos: T_Alterar_Servicos;

implementation

uses Un_dm, Un_UDF, Un_Main;

{$R *.dfm}

procedure T_Alterar_Servicos.FormShow(Sender: TObject);
begin
   LimpaDados;
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
   edtOs.SetFocus;
end;

procedure T_Alterar_Servicos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   Case Key Of
      VK_ESCAPE : Close;
      VK_RETURN :
      Begin
         Perform( WM_NEXTDLGCTL, 0, 0 );
         Key := 0;
      End;
   End;
end;

procedure T_Alterar_Servicos.sbSairClick(Sender: TObject);
begin
   Close;
end;

procedure T_Alterar_Servicos.LimpaDados;
begin
   edtOs.Text := '';
   cbSitauacao.Text := '';
   cbSitauacao.ItemIndex := -1;
   edtOrdamento.Text := '';
   cbTecnico.ItemIndex := -1;
   cbTecnico.Text := '';
   cbExecutante.ItemIndex := -1;
   cbExecutante.Text := '';
   edtServico.Text := '';
   edtObs.Clear;
   lblNome.Caption        := '';
   lblEndereo.Caption     := '';
   lblBairro.Caption      := '';
   lblCidade.Caption      := '';
   lblCEP.Caption         := '';
   lblFone1.Caption       := '';
   lblFone2.Caption       := '';
   lblFax.Caption         := '';
   lblCelular.Caption     := '';
   lblEmail.Caption       := '';
   lblEquipamento.Caption := '';
   lblComplemento.Caption := '';
   lblDefeito.Caption     := '';
   lblSerie.Caption       := '';
   lblArea.Caption        := '';
   lblEntrada.Caption     := '';
end;

procedure T_Alterar_Servicos.btnAlterarClick(Sender: TObject);
begin
   If edtOs.Text <> '' Then
   Begin
      _dm.qr07.Close;
      _dm.qr07.SQL.Text := 'select * from SERVICOS';
      _dm.qr07.Open;
      If Not _dm.qr07.Locate( 'OS', edtOs.Text, [] ) Then
      Begin
         MessageDlg( 'Nº de O.S. informado não localizado na tabela de serviços.'#13'Favor informar um Nº registrado ou veirifcar a digitação.', mtWarning, [ mbOK ], 0 );
         edtOs.Text := '';
         edtOs.SetFocus;
         Exit;
      End
      Else
      Begin
         _dm.qr02.Close;
         _dm.qr02.SQL.Text := 'select * from CLIENTES'; //  order by NomeCliente
         _dm.qr02.Open;
         _dm.qr02.Locate( 'CodCliente', _dm.qr07CodCliente.AsString, [] );
         lblNome.Caption        := _dm.qr02.FieldByName( 'NomeCliente' ).AsString;
         lblEndereo.Caption     := _dm.qr02.FieldByName( 'Endereco' ).AsString;
         lblBairro.Caption      := _dm.qr02.FieldByName( 'Bairro' ).AsString;
         lblCidade.Caption      := _dm.qr02.FieldByName( 'Cidade' ).AsString;
         lblCEP.Caption         := _dm.qr02.FieldByName( 'CEP' ).AsString;
         lblFone1.Caption       := _dm.qr02.FieldByName( 'Fone1' ).AsString;
         lblFone2.Caption       := _dm.qr02.FieldByName( 'Fone2' ).AsString;
         lblFax.Caption         := _dm.qr02.FieldByName( 'Fax' ).AsString;
         lblCelular.Caption     := _dm.qr02.FieldByName( 'Celular' ).AsString;
         lblEmail.Caption       := _dm.qr02.FieldByName( 'e-mail' ).AsString;
         _dm.qr03.Close;
         _dm.qr03.SQL.Text := 'select * from [Tipo de equipamento]';
         _dm.qr03.Open;
         _dm.qr03.Locate( 'CodEquipamento', _dm.qr07Equipamento.AsString, [] );
         lblEquipamento.Caption := _dm.qr03.FieldByName( 'Descricao' ).AsString;
         lblComplemento.Caption := _dm.qr07Complemento.AsString;
         lblDefeito.Caption     := _dm.qr07Defeito.AsString;
         lblSerie.Caption       := _dm.qr07NSerie.AsString;
         _dm.qr01.Close;
         _dm.qr01.SQL.Text := 'select * from AREA';
         _dm.qr01.Open;
         _dm.qr01.Locate( 'CodArea', _dm.qr07Area.AsString, [] );
         lblArea.Caption        := _dm.qr03.FieldByName( 'Descricao' ).AsString;

         lblEntrada.Caption     := _dm.qr07DataEntrada.AsString;
         _dm.qr04.Close;
         _dm.qr04.SQL.Text := 'select * from Situacao order by Descricao';
         _dm.qr04.Open;
         _dm.qr04.Locate( 'CodSituacao', _dm.qr07Situacao.AsString, [] );

         cbSitauacao.ItemIndex  := _Main.stlSit.IndexOf( _dm.qr07Situacao.AsString ); //
         cbTecnico.ItemIndex    := _Main.stlFunc.IndexOf( _dm.qr07Tecnico.AsString );
         cbExecutante.ItemIndex := _Main.stlFunc.IndexOf( _dm.qr07Executante.AsString );
         edtServico.Text        := _dm.qr07ServicoExecutado.AsString;
         edtObs.Text            := _dm.qr07Obs.AsString;
         edtOrdamento.Text      := _dm.qr07ValorOrcamento.AsString;
         cbSitauacao.SetFocus;
      End;
   End
   Else
   Begin
      edtOs.SetFocus;
      Exit;
   End;
end;

procedure T_Alterar_Servicos.edtObsExit(Sender: TObject);
begin
   If MessageDlg( 'Confirma registra da Alteração ?', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
   Begin
//      cSQL := 'update SERVICOS set Situacao = ' + _Main.stlSit.Strings[ cbSitauacao.ItemIndex ] +
//              ', ValorOrcamento = ' + edtOrdamento.Text +
//              ', Tecnico = ' + _Main.stlFunc.Strings[ cbTecnico.ItemIndex ] +
//              ', Executante = ' + _Main.stlFunc.Strings[ cbExecutante.ItemIndex ] +
//              ', Obs = "' + UpperCase( edtObs.Text ) + '" where CodArea = "' + edtOs.Text + '"';
      _dm.qr07.Close;
      _dm.qr07.SQL.Text := 'select * from SERVICOS';
      _dm.qr07.Open;
      _dm.qr07.Locate( 'OS', edtOs.Text, [] );
      _dm.qr07.Edit;
      _dm.qr07.FieldByName( 'Situacao' ).AsString         := _Main.stlSit.Strings[ cbSitauacao.ItemIndex ];
      _dm.qr07.FieldByName( 'ValorOrcamento' ).AsString   := edtOrdamento.Text;
      _dm.qr07.FieldByName( 'Tecnico' ).AsString          := _Main.stlFunc.Strings[ cbTecnico.ItemIndex ];
      _dm.qr07.FieldByName( 'Executante' ).AsString       := _Main.stlFunc.Strings[ cbExecutante.ItemIndex ];
      _dm.qr07.FieldByName( 'ServicoExecutado' ).AsString := edtServico.Text;
      _dm.qr07.FieldByName( 'Obs' ).AsString              := UpperCase( edtObs.Text );
      _dm.qr07.Post;
      _dm.qr07.Close;

   End;
   LimpaDados;
   edtOs.SetFocus;
end;

end.
