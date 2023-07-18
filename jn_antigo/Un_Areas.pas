unit Un_Areas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Grids, DBGrids, DB, ExtCtrls, StdCtrls, Buttons;

type
  T_Areas = class(TForm)
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
    procedure btnSairClick(Sender: TObject);
   private    { Private declarations }
      cFlg, cBusca, cEqp : String;
      Procedure Controle( x : Boolean );
   public     { Public declarations }
      cPorta : String;
  end;

var
   _Areas: T_Areas;

implementation

uses Un_dm, Un_UDF;

{$R *.dfm}

procedure T_Areas.FormCreate(Sender: TObject);
begin
   cFlg   := '';
   cBusca := '';
   cEqp   := '';
   cPorta := '';
   pnlCodArea.Hint := 'Informação do Código e o'#13'Nº de serviços registrados para esta.';
end;

procedure T_Areas.FormShow(Sender: TObject);
begin
   _dm.qr01.Close;
   _dm.qr01.SQL.Text := 'select * from AREA order by Descricao';
   _dm.qr01.Open;
   Controle( True );
   dbgAreas.SetFocus;
end;

procedure T_Areas.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure T_Areas.dsAreasDataChange(Sender: TObject; Field: TField);
begin
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from SERVICOS where Area = ' + _dm.qr01.FieldByName( 'CodArea' ).AsString + '';
   _dm.qr11.Open;
   cEqp := IntToStr( _dm.qr11.RecordCount );
   pnlCodArea.Caption := 'Cod: ' + _dm.qr01.FieldByName( 'CodArea' ).AsString + '  Serv: ' + IntToStr( _dm.qr11.RecordCount );
   edtDescricao.Text  := _dm.qr01.FieldByName( 'DESCRICAO' ).AsString;
end;

procedure T_Areas.Controle(x: Boolean);
begin
   btnNova.Enabled     := x;
   btnAlterar.Enabled  := x;
   btnExcluir.Enabled  := x;
   btnSair.Enabled     := x;
   gbDescricao.Enabled := Not x;
end;

procedure T_Areas.btnNovaClick(Sender: TObject);
begin
   Controle( False );
   cFlg := 'N';
   edtDescricao.Text := '';
   edtDescricao.SetFocus;
end;

procedure T_Areas.btnAlterarClick(Sender: TObject);
begin
   Controle( False );
   cFlg := 'A';
   edtDescricao.SetFocus;
end;

procedure T_Areas.btnExcluirClick(Sender: TObject);
begin
   If cEqp <> '0' Then
   Begin
      MessageDlg( 'A V I S O:'#13''#13'' + Iif( cEqp, '1', 'Existe 1 equipamento registrado ', 'Existem ' + cEqp + ' equipamentos registrados ' ) + 'com esta Área.'#13'Portanto não será permitida a exclusão da mesma.'#13''#13'Para que se possa realizar a exclusão, deve-se'#13'realizar a exclusão de todos os equipamentos que'#13'estejam registrados para esta Área.', mtWarning, [ mbOk ], 0 );
      dbgAreas.SetFocus;
      Exit;
   End
   Else
   Begin
      If MessageDlg( 'Confirma Exclusão da Área ?'#13''#13'[ ' + _dm.qr01.FieldByName( 'Descricao' ).AsString + ' ]', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
      Begin
         _dm.qr12.Close;
         _dm.qr12.SQL.Text := 'delete from AREA where CodArea = ' + _dm.qr01.FieldByName( 'CodArea' ).AsString + '';
         _dm.qr12.ExecSQL;
      End;
      _dm.qr01.Close;
      _dm.qr01.Open;
   End;
   dbgAreas.SetFocus;
end;

procedure T_Areas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure T_Areas.edtDescricaoExit(Sender: TObject);
Var
   cSQL : String;
begin
   cSQL := '';
   If cFlg = 'N' Then cSQL := 'insert into AREA ( Descricao ) values ( "' + edtDescricao.Text + '" )';
   If cFlg = 'A' Then cSQL := 'update AREA set Descricao = "' + edtDescricao.Text + '" where CodArea = ' + _dm.qr01.FieldByName( 'CodArea' ).AsString + '';
   If MessageDlg( 'Confirma ' + Iif( cFlg, 'N', 'Inclusão', 'Alteração' ) + ' ?', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
   Begin
      _dm.qr12.Close;
      _dm.qr12.SQL.Text := cSQL;
      _dm.qr12.ExecSQL;
   End;
   _dm.qr01.Close;
   _dm.qr01.Open;
   cFlg   := '';
   cBusca := '';
   cPorta := '';
   Controle( True );
   dbgAreas.SetFocus;
end;

procedure T_Areas.dbgAreasKeyPress(Sender: TObject; var Key: Char);
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
   _dm.qr01.Locate( 'Descricao', cBusca, [loPartialKey, loCaseInsensitive] );
end;

end.
