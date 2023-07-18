unit Un_GS_Areas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Grids, DBGrids, DB, ExtCtrls, StdCtrls, Buttons;

type
  T_GS_Areas = class(TForm)
    Panel1: TPanel;
    dsAreas: TDataSource;
    dbgAreas: TDBGrid;
    dbnAreas: TDBNavigator;
    btnSair: TBitBtn;
    gbDescricao: TGroupBox;
    edtDescricao: TEdit;
    btnNova: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    pnlCodArea: TPanel;
    procedure FormShow(Sender: TObject);
    procedure dsAreasDataChange(Sender: TObject; Field: TField);
    procedure btnNovaClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtDescricaoExit(Sender: TObject);
    procedure dbgAreasKeyPress(Sender: TObject; var Key: Char);
   private    { Private declarations }
      cFlg, cBusca, cEqp : String;
      Procedure Controle( x : Boolean );
   public     { Public declarations }
      cPorta : String;
  end;

var
   _GS_Areas: T_GS_Areas;

implementation

uses Un_dm, Un_UDF;

{$R *.dfm}

procedure T_GS_Areas.FormCreate(Sender: TObject);
begin
   cFlg   := '';
   cBusca := '';
   cEqp   := '';
   cPorta := '';
   pnlCodArea.Hint := 'Informação do Código e o'#13'Nº de serviços registrados para esta.';
end;

procedure T_GS_Areas.FormShow(Sender: TObject);
begin
   _dm.qrGArea.Close;
   _dm.qrGArea.SQL.Text := 'select * from T_SERVICO_AREA order by SA_DESCRICAO';
   _dm.qrGArea.Open;
   Controle( True );
   dbgAreas.SetFocus;
end;

procedure T_GS_Areas.dsAreasDataChange(Sender: TObject; Field: TField);
begin
   _dm.qrAux.Close;
   _dm.qrAux.SQL.Text := 'select * from T_SERVICO_OS_GS where SOSGS_AREA = ' + _dm.qrGArea.FieldByName( 'SA_ID' ).AsString + '';
   _dm.qrAux.Open;
   cEqp := IntToStr( _dm.qrAux.RecordCount );
   pnlCodArea.Caption := 'Cod: ' + _dm.qrGArea.FieldByName( 'SA_ID' ).AsString + '  Serv: ' + IntToStr( _dm.qrAux.RecordCount );
   edtDescricao.Text  := _dm.qrGArea.FieldByName( 'SA_DESCRICAO' ).AsString;
end;

procedure T_GS_Areas.Controle(x: Boolean);
begin
   btnNova.Enabled     := x;
   btnAlterar.Enabled  := x;
   btnExcluir.Enabled  := x;
   btnSair.Enabled     := x;
   gbDescricao.Enabled := Not x;
end;

procedure T_GS_Areas.btnNovaClick(Sender: TObject);
begin
   Controle( False );
   cFlg := 'N';
   edtDescricao.Text := '';
   edtDescricao.SetFocus;
end;

procedure T_GS_Areas.btnAlterarClick(Sender: TObject);
begin
   Controle( False );
   cFlg := 'A';
   edtDescricao.SetFocus;
end;

procedure T_GS_Areas.btnExcluirClick(Sender: TObject);
begin
   If cEqp <> '0' Then
   Begin
      MessageDlg( 'A V I S O:'#13''#13'' + Iif( cEqp, '1', 'Existe 1 equipamento registrado ', 'Existem ' + cEqp + ' equipamentos registrados ' ) + 'com esta Área.'#13'Portanto não será permitida a exclusão da mesma.'#13''#13'Para que se possa realizar a exclusão, deve-se'#13'realizar a exclusão de todos os equipamentos que'#13'estejam registrados para esta Área.', mtWarning, [ mbOk ], 0 );
      dbgAreas.SetFocus;
      Exit;
   End
   Else
   Begin
      If MessageDlg( 'Confirma Exclusão da Área ?'#13''#13'[ ' + _dm.qrGArea.FieldByName( 'Descricao' ).AsString + ' ]', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
      Begin
         _dm.qrAux.Close;
         _dm.qrAux.SQL.Text := 'delete from T_SERVICO_AREA where SA_ID = ' + _dm.qrGArea.FieldByName( 'SA_ID' ).AsString + '';
         _dm.qrAux.ExecSQL;
      End;
      _dm.qrGArea.Close;
      _dm.qrGArea.Open;
   End;
   dbgAreas.SetFocus;
end;

procedure T_GS_Areas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure T_GS_Areas.edtDescricaoExit(Sender: TObject);
Var
   cSQL : String;
begin
   cSQL := '';
   If cFlg = 'N' Then cSQL := 'insert into T_SERVICO_AREA ( SA_DESCRICAO ) values ( "' + edtDescricao.Text + '" )';
   If cFlg = 'A' Then cSQL := 'update T_SERVICO_AREA set SA_DESCRICAO = "' + edtDescricao.Text + '" where SA_ID = ' + _dm.qrGArea.FieldByName( 'SA_ID' ).AsString + '';
   If MessageDlg( 'Confirma ' + Iif( cFlg, 'N', 'Inclusão', 'Alteração' ) + ' ?', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
   Begin
      _dm.qrAux.Close;
      _dm.qrAux.SQL.Text := cSQL;
      _dm.qrAux.ExecSQL;
   End;
   _dm.qrGArea.Close;
   _dm.qrGArea.Open;
   cFlg   := '';
   cBusca := '';
   cPorta := '';
   Controle( True );
   dbgAreas.SetFocus;
end;

procedure T_GS_Areas.dbgAreasKeyPress(Sender: TObject; var Key: Char);
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
   _dm.qrGArea.Locate( 'SA_DESCRICAO', cBusca, [loPartialKey, loCaseInsensitive] );
end;

end.
