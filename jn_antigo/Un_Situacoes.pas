unit Un_Situacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBCtrls, Grids, DBGrids, StdCtrls, Buttons;

type
  T_Situacoes = class(TForm)
    pnlSituacao: TPanel;
    dbgSituacao: TDBGrid;
    dbnSituacao: TDBNavigator;
    dsSituacao: TDataSource;
    pnlCod: TPanel;
    gbSituacao: TGroupBox;
    edtDescricao: TEdit;
    btnSair: TBitBtn;
    btnNova: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsSituacaoDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgSituacaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnNovaClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtDescricaoExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
   private    { Private declarations }
      cFlg, cBusca, cSTC : String;
      Procedure Controle( x : Boolean );
   public     { Public declarations }
      cPorta : String;
   end;

var
   _Situacoes: T_Situacoes;

implementation

uses Un_dm, Un_UDF;

{$R *.dfm}

procedure T_Situacoes.FormCreate(Sender: TObject);
begin
   cFlg   := '';
   cSTC   := '';
   cBusca := '';
   cPorta := '';
   pnlCod.Hint := 'Informação do Código e o'#13'Nº de serviços registrados para esta.';
end;

procedure T_Situacoes.FormShow(Sender: TObject);
begin
   _dm.qr04.Close;
   _dm.qr04.SQL.Text := 'select * from Situacao order by Descricao';
   _dm.qr04.Open;
   Controle( True );
   dbgSituacao.SetFocus;
end;

procedure T_Situacoes.Controle(x: Boolean);
begin
   btnNova.Enabled    := x;
   btnAlterar.Enabled := x;
   btnExcluir.Enabled := x;
   btnSair.Enabled    := x;
   gbSituacao.Enabled := Not x;
end;

procedure T_Situacoes.dsSituacaoDataChange(Sender: TObject; Field: TField);
begin
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from SERVICOS where Situacao = ' + _dm.qr04.FieldByName( 'CodSituacao' ).AsString + '';
   _dm.qr11.Open;
   cSTC   := IntToStr( _dm.qr11.RecordCount );
   pnlCod.Caption    := 'Cod: ' + _dm.qr04.FieldByName( 'CodSituacao' ).AsString + '  Serv: ' + IntToStr( _dm.qr11.RecordCount );
   edtDescricao.Text := _dm.qr04.FieldByName( 'Descricao' ).AsString;
end;

procedure T_Situacoes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   Case Key Of
      VK_ESCAPE :
      Begin
         If cFlg <> '' Then
         Begin
            cFlg   := '';
            cBusca := '';
            _dm.qr04.Close;
            _dm.qr04.Open;
            Controle( True );
            dbgSituacao.SetFocus;
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

procedure T_Situacoes.dbgSituacaoKeyPress(Sender: TObject; var Key: Char);
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
   _dm.qr04.Locate( 'Descricao', cBusca, [loPartialKey, loCaseInsensitive] );
end;

procedure T_Situacoes.btnNovaClick(Sender: TObject);
begin
   Controle( False );
   cFlg := 'N';
   edtDescricao.Text := '';
   edtDescricao.SetFocus;
end;

procedure T_Situacoes.btnAlterarClick(Sender: TObject);
begin
   Controle( False );
   cFlg := 'A';
   edtDescricao.SetFocus;
end;

procedure T_Situacoes.btnExcluirClick(Sender: TObject);
begin
   If cSTC <> '0' Then
   Begin
      MessageDlg( 'A V I S O:'#13''#13'' + Iif( cSTC, '1', 'Existe 1 serviço registrado ', 'Existem ' + cSTC + ' serviços registrados ' ) + 'com esta Situação.'#13'Portanto não será permitida a exclusão do mesma.'#13''#13'Para que se possa realizar a exclusão, deve-se'#13'realizar a exclusão de todos os serviços que'#13'estejam registrados com esta Situação.', mtWarning, [ mbOk ], 0 );
      dbgSituacao.SetFocus;
      Exit;
   End;

   If MessageDlg( 'Confirma Exclusão de Situação ?'#13''#13'[ ' + _dm.qr04.FieldByName( 'Descricao' ).AsString + ' ]', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
   Begin
      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'delete from Situacao where CodSituacao = ' + _dm.qr04.FieldByName( 'CodSituacao' ).AsString + '';
      _dm.qr12.ExecSQL;
   End;
   cFlg   := '';
   cBusca := '';
   _dm.qr04.Close;
   _dm.qr04.Open;
   dbgSituacao.SetFocus;
end;

procedure T_Situacoes.edtDescricaoExit(Sender: TObject);
Var
   cSQL : String;
begin
   If edtDescricao.Text <> '' Then
   Begin
      cSQL := '';
      If cFlg = 'N' Then cSQL := 'insert into Situacao ( Descricao ) values ( "' + edtDescricao.Text + '" )';
      If cFlg = 'A' Then cSQL := 'update Situacao set Descricao = "' + edtDescricao.Text + '" where CodSituacao = ' + _dm.qr04.FieldByName( 'CodSituacao' ).AsString + '';
      If MessageDlg( 'Confirma ' + Iif( cFlg, 'N', 'Inclusão', 'Alteração' ) + ' ?', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
      Begin
         _dm.qr12.Close;
         _dm.qr12.SQL.Text := cSQL;
         _dm.qr12.ExecSQL;
      End;
   End;
   cFlg   := '';
   cBusca := '';
   cPorta := '';
   _dm.qr04.Close;
   _dm.qr04.Open;
   Controle( True );
end;

procedure T_Situacoes.btnSairClick(Sender: TObject);
begin
   Close;
end;

end.
