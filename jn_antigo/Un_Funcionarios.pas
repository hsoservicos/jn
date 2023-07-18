unit Un_Funcionarios;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, DB, DBCtrls, Grids, DBGrids, ExtCtrls;

type
  T_Funcionarios = class(TForm)
    pnlFunc: TPanel;
    dbgFunc: TDBGrid;
    dbnFunc: TDBNavigator;
    dsFunc: TDataSource;
    gbFunc: TGroupBox;
    sbSim: TSpeedButton;
    sbNao: TSpeedButton;
    btnSair: TBitBtn;
    btnNova: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    pnlCodFunc: TPanel;
    edtNome: TLabeledEdit;
    edtFone: TLabeledEdit;
    edtCelular: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtCEP: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    edtObs: TMemo;
    Label1: TLabel;
    edtApelido: TLabeledEdit;
    edtPai: TLabeledEdit;
    edtMae: TLabeledEdit;
    edtComplemento: TLabeledEdit;
    cbFuncao: TComboBox;
    lblFuncao: TLabel;
    cbEstadoCivil: TComboBox;
    lblEstadoCivil: TLabel;
    edtCPF: TLabeledEdit;
    edtCTPS: TLabeledEdit;
    edtSerie: TLabeledEdit;
    edtTitulo: TLabeledEdit;
    edtZona: TLabeledEdit;
    edtSecao: TLabeledEdit;
    edtPIS: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsFuncDataChange(Sender: TObject; Field: TField);
    procedure lblFuncaoClick(Sender: TObject);
    procedure lblEstadoCivilClick(Sender: TObject);
    procedure cbFuncaoExit(Sender: TObject);
    procedure btnNovaClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure sbNaoClick(Sender: TObject);
    procedure sbSimClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCEPExit(Sender: TObject);
    procedure edtFoneExit(Sender: TObject);
    procedure edtCelularExit(Sender: TObject);
    procedure edtCPFExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
   private    { Private declarations }
      cFlg, cBusca : String;
      Procedure Controle( x : Boolean );
      Procedure Dados( x : String );
   public     { Public declarations }
      cPorta : String;
   end;

var
  _Funcionarios: T_Funcionarios;

implementation

uses Un_dm, Un_UDF, Un_Main;

{$R *.dfm}

procedure T_Funcionarios.Controle(x: Boolean);
begin
   dbgFunc.Enabled     := x;
   btnNova.Enabled     := x;
   btnAlterar.Enabled  := x;
   btnExcluir.Enabled  := x;
   btnSair.Enabled     := x;
   sbSim.Visible       := Not x;
   sbNao.Visible       := Not x;
   gbFunc.Enabled      := Not x;
end;

Procedure T_Funcionarios.Dados(x: String);
begin
   If x = 'N' Then
   Begin
      edtNome.Text            := '';
      edtApelido.Text         := '';
      edtEndereco.Text        := '';
      edtComplemento.Text     := '';
      edtBairro.Text          := '';
      edtCidade.Text          := '';
      edtCEP.Text             := '';
      edtFone.Text            := '';
      edtCelular.Text         := '';
      edtPai.Text             := '';
      edtMae.Text             := '';
      cbEstadoCivil.ItemIndex := -1;
      cbFuncao.ItemIndex      := -1;
      edtCPF.Text             := '';
      edtCTPS.Text            := '';
      edtSerie.Text           := '';
      edtTitulo.Text          := '';
      edtZona.Text            := '';
      edtSecao.Text           := '';
      edtObs.Text             := '';
   End
   Else
   Begin
      edtNome.Text        := ControlaCampoTexto( _dm.qr05.FieldByName( 'NOMECOMPLETO' ).AsString );
      edtApelido.Text     := ControlaCampoTexto( _dm.qr05.FieldByName( 'APELIDO' ).AsString );
      edtEndereco.Text    := ControlaCampoTexto( _dm.qr05.FieldByName( 'ENDERECO' ).AsString );
      edtComplemento.Text := ControlaCampoTexto( _dm.qr05.FieldByName( 'COMPLEMENTO' ).AsString );
      edtBairro.Text      := ControlaCampoTexto( _dm.qr05.FieldByName( 'BAIRRO' ).AsString );
      edtCidade.Text      := ControlaCampoTexto( _dm.qr05.FieldByName( 'CIDADE' ).AsString );
      edtCEP.Text         := ControlaCampoTexto( _dm.qr05.FieldByName( 'CEP' ).AsString );
      edtFone.Text        := ControlaCampoTexto( _dm.qr05.FieldByName( 'FONE' ).AsString );
      edtCelular.Text     := ControlaCampoTexto( _dm.qr05.FieldByName( 'CELULAR' ).AsString );
      edtPai.Text         := ControlaCampoTexto( _dm.qr05.FieldByName( 'NomePai' ).AsString );
      edtMae.Text         := ControlaCampoTexto( _dm.qr05.FieldByName( 'NomeMae' ).AsString );
      If _dm.qr05.FieldByName( 'EstadoCivil' ).AsString <> '' Then
         cbEstadoCivil.ItemIndex := _Main.stlFunc.IndexOf( _dm.qr05.FieldByName( 'EstadoCivil' ).AsString )
      Else
         cbEstadoCivil.ItemIndex := -1;
      If _dm.qr05.FieldByName( 'FUNCÃO' ).AsString <> '' Then
         cbFuncao.ItemIndex  := _Main.stlFunc.IndexOf( _dm.qr05.FieldByName( 'FUNCÃO' ).AsString )
      Else
         cbFuncao.ItemIndex  := -1;
      edtCPF.Text         := ControlaCampoTexto( _dm.qr05.FieldByName( 'CPF' ).AsString );
      edtCTPS.Text        := ControlaCampoTexto( _dm.qr05.FieldByName( 'CTPS' ).AsString );
      edtSerie.Text       := ControlaCampoTexto( _dm.qr05.FieldByName( 'Serie' ).AsString );
      edtPIS.Text         := ControlaCampoTexto( _dm.qr05.FieldByName( 'PIS' ).AsString );
      edtTitulo.Text      := ControlaCampoTexto( _dm.qr05.FieldByName( 'TituloEleitor' ).AsString );
      edtZona.Text        := ControlaCampoTexto( _dm.qr05.FieldByName( 'Zona' ).AsString );
      edtSecao.Text       := ControlaCampoTexto( _dm.qr05.FieldByName( 'Secao' ).AsString );
      edtObs.Text         := ControlaCampoTexto( _dm.qr05.FieldByName( 'Obs' ).AsString );
//   n := _dm.qr05.FieldByName( 's' ).AsString;
   End;
end;

procedure T_Funcionarios.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   Case Key Of
      VK_ESCAPE :
      Begin
         If cFlg <> '' Then
         Begin
            cFlg   := '';
            Controle( True );
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
end;

procedure T_Funcionarios.FormCreate(Sender: TObject);
begin
   cFlg   := '';
   cBusca := '';
   cPorta := '';
end;

procedure T_Funcionarios.FormShow(Sender: TObject);
begin
   _Main.stlCivil.Clear;
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from [Estado Civil] order by Descricao';
   _dm.qr11.Open;
   cbEstadoCivil.Text := '';
   cbEstadoCivil.Clear;
   While Not _dm.qr11.Eof Do
   Begin
      cbEstadoCivil.Items.Add( _dm.qr11.FieldByName( 'Descricao' ).AsString );
      _Main.stlCivil.Add( _dm.qr11.FieldByName( 'CodEstadoCivil' ).AsString );
      _dm.qr11.Next;
   End;

   _Main.stlFunc.Clear;
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from Funcao order by DescFuncao';
   _dm.qr11.Open;
   cbFuncao.Text := '';
   cbFuncao.Clear;
   While Not _dm.qr11.Eof Do
   Begin
      cbFuncao.Items.Add( _dm.qr11.FieldByName( 'DescFuncao' ).AsString );
      _Main.stlFunc.Add( _dm.qr11.FieldByName( 'CodFuncao' ).AsString );
      _dm.qr11.Next;
   End;
   _dm.qr05.Close;
   _dm.qr05.SQL.Text := 'select * from Funcionarios order by Apelido';
   _dm.qr05.Open;
   Controle( True );
   dbgFunc.SetFocus;
end;

procedure T_Funcionarios.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure T_Funcionarios.dsFuncDataChange(Sender: TObject; Field: TField);
begin
   pnlCodFunc.Caption  := _dm.qr05.FieldByName( 'CodTecnicos' ).AsString;
   Dados( '' );
end;

procedure T_Funcionarios.lblFuncaoClick(Sender: TObject);
begin
//
end;

procedure T_Funcionarios.lblEstadoCivilClick(Sender: TObject);
begin
//
end;

procedure T_Funcionarios.cbFuncaoExit(Sender: TObject);
begin
   If cbFuncao.Text = '' Then
   Begin
      ShowMessage( 'Favor informar a Função do Funcionário'#13'' + edtNome.Text );
      cbFuncao.SetFocus;
   End;
end;

procedure T_Funcionarios.btnNovaClick(Sender: TObject);
begin // Novo
   cFlg   := 'N';
   Dados( cFlg );
   Controle( False );
   edtNome.SetFocus;
end;

procedure T_Funcionarios.btnAlterarClick(Sender: TObject);
begin // Alterar
   cFlg   := 'A';
   Dados( cFlg );
   Controle( False );
   edtNome.SetFocus;
end;

procedure T_Funcionarios.btnExcluirClick(Sender: TObject);
begin // Excluir
   If MessageDlg( 'Excluir Funcionário ?', mtCustom, [ mbYes, mbNo ], 0 ) = mrYes Then
   Begin
      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'delete from Funcionarios where CodTecnicos = ' + _dm.qr05.FieldByName( 'CodTecnicos' ).AsString + '';
      _dm.qr12.ExecSQL;
      _dm.qr05.Close;
      _dm.qr05.Open;
   End;
end;

procedure T_Funcionarios.sbNaoClick(Sender: TObject);
begin
   _dm.qr05.Close;
   _dm.qr05.Open;
   Controle( True );
end;

procedure T_Funcionarios.sbSimClick(Sender: TObject);
Var
   cSQL : String;
begin // Salvar
   cSQL := '';

   If cbEstadoCivil.Text = '' Then
   Begin
      ShowMessage( 'Favor informar a Estado Civil do Funcionário.' );
      cbEstadoCivil.ItemIndex := -1;
      cbEstadoCivil.SetFocus;
      Exit;
   End;
   If cbFuncao.Text = '' Then
   Begin
      ShowMessage( 'Favor informar a Função do Funcionário.' );
      cbFuncao.ItemIndex := -1;
      cbFuncao.SetFocus;
      Exit;
   End;
   edtEndereco.Text        := ControlaCampoTexto( edtEndereco.Text );
   edtComplemento.Text     := ControlaCampoTexto( edtComplemento.Text );
   edtBairro.Text          := ControlaCampoTexto( edtBairro.Text );
   edtCidade.Text          := ControlaCampoTexto( edtCidade.Text );
   edtCEP.Text             := ControlaCampoTexto( edtCEP.Text );
   edtFone.Text            := ControlaCampoTexto( edtFone.Text );
   edtCelular.Text         := ControlaCampoTexto( edtCelular.Text );
   edtPai.Text             := ControlaCampoTexto( edtPai.Text );
   edtMae.Text             := ControlaCampoTexto( edtMae.Text );
   edtCPF.Text             := ControlaCampoTexto( edtCPF.Text );
   edtCTPS.Text            := ControlaCampoTexto( edtCTPS.Text );
   edtSerie.Text           := ControlaCampoTexto( edtSerie.Text );
   edtPIS.Text             := ControlaCampoTexto( edtPIS.Text );
   edtTitulo.Text          := ControlaCampoTexto( edtTitulo.Text );
   edtZona.Text            := ControlaCampoTexto( edtZona.Text );
   edtSecao.Text           := ControlaCampoTexto( edtSecao.Text );
   edtObs.Text             := ControlaCampoTexto( edtObs.Text );

   _dm.qr12.Close;
   _dm.qr12.SQL.Text := 'select * from Funcionarios';
   _dm.qr12.Open;

   If cFlg = 'N' Then
   Begin
      _dm.qr12.Insert;
   End;
   If cFlg = 'A' Then
   Begin
      _dm.qr12.Locate( 'CodTecnicos', _dm.qr05.FieldByName( 'CodTecnicos' ).AsString, [] );
      _dm.qr12.Edit;
   End;

   _dm.qr12.FieldByName( 'Apelido' ).AsString       := edtApelido.Text;
   _dm.qr12.FieldByName( 'NomeCompleto' ).AsString  := edtNome.Text;
   _dm.qr12.FieldByName( 'Funcão' ).AsString        := _Main.stlFunc.Strings[ cbFuncao.ItemIndex ];
   _dm.qr12.FieldByName( 'ENDERECO' ).AsString      := edtEndereco.Text;
   _dm.qr12.FieldByName( 'BAIRRO' ).AsString        := edtBairro.Text;
   _dm.qr12.FieldByName( 'CIDADE' ).AsString        := edtCidade.Text;
   _dm.qr12.FieldByName( 'CEP' ).AsString           := edtCEP.Text;
   _dm.qr12.FieldByName( 'FONE' ).AsString          := edtFone.Text;
   _dm.qr12.FieldByName( 'CELULAR' ).AsString       := edtCelular.Text;
   _dm.qr12.FieldByName( 'NomePai' ).AsString       := edtPai.Text;
   _dm.qr12.FieldByName( 'NomeMae' ).AsString       := edtMae.Text;
   _dm.qr12.FieldByName( 'EstadoCivil' ).AsString   := _Main.stlCivil.Strings[ cbEstadoCivil.ItemIndex ];
   _dm.qr12.FieldByName( 'CPF' ).AsString           := edtCPF.Text;
   _dm.qr12.FieldByName( 'CTPS' ).AsString          := edtCTPS.Text;
   _dm.qr12.FieldByName( 'Serie' ).AsString         := edtSerie.Text;
   _dm.qr12.FieldByName( 'PIS' ).AsString           := edtPIS.Text;
   _dm.qr12.FieldByName( 'TituloEleitor' ).AsString := edtTitulo.Text;
   _dm.qr12.FieldByName( 'Zona' ).AsString          := edtZona.Text;
   _dm.qr12.FieldByName( 'Secao' ).AsString         := edtSecao.Text;
   _dm.qr12.FieldByName( 'OBS' ).AsString           := edtObs.Text;
   _dm.qr12.Post;
   _dm.qr12.Close;
   cFlg   := '';
   cBusca := '';
   cPorta := '';
   _dm.qr05.Close;
   _dm.qr05.Open;
   Controle( True );
   dbgFunc.SetFocus;
end;

procedure T_Funcionarios.edtCEPExit(Sender: TObject);
begin
   If edtCEP.Text <> '' Then edtCEP.Text := FormataCEP( edtCEP.Text );
end;

procedure T_Funcionarios.edtFoneExit(Sender: TObject);
begin
   If edtFone.Text <> '' Then edtFone.Text := FormataFone( edtFone.Text );
end;

procedure T_Funcionarios.edtCelularExit(Sender: TObject);
begin
   If edtCelular.Text <> '' Then edtCelular.Text := FormataFone( edtCelular.Text );
end;

procedure T_Funcionarios.edtCPFExit(Sender: TObject);
begin
   If edtCPF.Text <> '' Then edtCPF.Text := FCPFCNPJ( edtCPF.Text );
end;

end.
