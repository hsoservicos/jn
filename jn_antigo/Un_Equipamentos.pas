unit Un_Equipamentos;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, DBCtrls, Grids, DBGrids, DB, ExtCtrls, StdCtrls, Buttons;

type
  T_Equipamentos = class(TForm)
    pnlEquip: TPanel;
    dsEquip: TDataSource;
    dbgEquip: TDBGrid;
    dbnEquip: TDBNavigator;
    pnlCodEquip: TPanel;
    gbEquipamento: TGroupBox;
    edtDescricao: TEdit;
    btnSair: TBitBtn;
    btnNova: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsEquipDataChange(Sender: TObject; Field: TField);
    procedure btnNovaClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtDescricaoExit(Sender: TObject);
    procedure dbgEquipKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
   private    { Private declarations }
      cFlg, cBusca, cEqp : String;
      Procedure Controle( x : Boolean );
   public     { Public declarations }
      cPorta : String;
   end;

var
  _Equipamentos: T_Equipamentos;

implementation

uses Un_dm, Un_UDF;

{$R *.dfm}

procedure T_Equipamentos.FormCreate(Sender: TObject);
begin //
   cFlg   := '';
   cBusca := '';
   cEqp   := '';
   cPorta := '';
   pnlCodEquip.Hint := 'Informação do Código e o'#13'Nº de serviços registrados para este.';
end;

procedure T_Equipamentos.FormShow(Sender: TObject);
begin //
   _dm.qr03.Close;
   _dm.qr03.SQL.Text := 'select * from [Tipo de equipamento] order by Descricao';
   _dm.qr03.Open;
   Controle( True );
   dbgEquip.SetFocus;
end;

procedure T_Equipamentos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   Case Key Of
      VK_ESCAPE :
      Begin
         If gbEquipamento.Enabled Then // cFlg <> '' Then
         Begin
            cFlg := '';
            Controle( True );
            dbgEquip.SetFocus;
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

procedure T_Equipamentos.dsEquipDataChange(Sender: TObject; Field: TField);
begin
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from SERVICOS where Equipamento = ' + _dm.qr03.FieldByName( 'CodEquipamento' ).AsString + '';
   _dm.qr11.Open;
   cEqp   := IntToStr( _dm.qr11.RecordCount );
   pnlCodEquip.Caption := 'Cod: ' + _dm.qr03.FieldByName( 'CodEquipamento' ).AsString + '  Serv: ' + IntToStr( _dm.qr11.RecordCount );
   edtDescricao.Text   := _dm.qr03.FieldByName( 'DESCRICAO' ).AsString;
end;

procedure T_Equipamentos.btnNovaClick(Sender: TObject);
begin
   Controle( False );
   cFlg := 'N';
   edtDescricao.Text := '';
   edtDescricao.SetFocus;
end;

procedure T_Equipamentos.btnAlterarClick(Sender: TObject);
begin
   Controle( False );
   cFlg := 'A';
   edtDescricao.SetFocus;
end;

procedure T_Equipamentos.btnExcluirClick(Sender: TObject);
begin
   If cEqp <> '0' Then
   Begin
      MessageDlg( 'A V I S O:'#13''#13'' + Iif( cEqp, '1', 'Existe 1 serviço registrado ', 'Existem ' + cEqp + ' serviços registrados ' ) + 'com este Equipamento.'#13'Portanto não será permitida a exclusão do mesmo.'#13''#13'Para que se possa realizar a exclusão, deve-se'#13'realizar a exclusão de todos os serviços que'#13'estejam registrados com este Equipamento.', mtWarning, [ mbOk ], 0 );
      dbgEquip.SetFocus;
      Exit;
   End;
   If MessageDlg( 'Confirma Exclusão deste tipo de Equipamento ?'#13''#13'[ ' + _dm.qr03.FieldByName( 'Descricao' ).AsString + ' ]', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
   Begin
      _dm.qr12.Close;
      _dm.qr12.SQL.Text := 'delete from [Tipo de equipamento] where CodEquipamento = ' + _dm.qr03.FieldByName( 'CodEquipamento' ).AsString + '';
      _dm.qr12.ExecSQL;
   End;
   _dm.qr03.Close;
   _dm.qr03.Open;
   dbgEquip.SetFocus;
end;

procedure T_Equipamentos.edtDescricaoExit(Sender: TObject);
Var
   cSQL : String;
begin
   If edtDescricao.Text <> '' Then
   Begin
      cSQL := '';
      If cFlg = 'N' Then
      Begin
         _dm.qr12.Close;
         _dm.qr12.SQL.Text := 'select * from [Tipo de equipamento]';
         _dm.qr12.Open;
         If _dm.qr12.Locate( 'Descricao', edtDescricao.Text, [] ) Then
         Begin
            MessageDlg( 'A V I S O:'#13''#13'Descrição de Equipamento já registrada'#13'no Banco de Dados.'#13''#13'Favor verificar a Descrição'#13'a ser registrada.', mtWarning, [ mbOk ], 0 );
            edtDescricao.Text := '';
            edtDescricao.SetFocus;
            Exit;
         End
         Else
            cSQL := 'insert into [Tipo de equipamento] ( Descricao ) values ( "' + edtDescricao.Text + '" )';
      End;
      If cFlg = 'A' Then cSQL := 'update [Tipo de equipamento] set Descricao = "' + edtDescricao.Text + '" where CodEquipamento = ' + _dm.qr03.FieldByName( 'CodEquipamento' ).AsString + '';
      If MessageDlg( 'Confirma ' + Iif( cFlg, 'N', 'Inclusão', 'Alteração' ) + ' ?', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then
      Begin
         _dm.qr12.Close;
         _dm.qr12.SQL.Text := cSQL;
         _dm.qr12.ExecSQL;
      End;
   End;
   _dm.qr03.Close;
   _dm.qr03.Open;
   cFlg   := '';
   cBusca := '';
   cPorta := '';
   Controle( True );
   dbgEquip.SetFocus;
   Exit;
end;

procedure T_Equipamentos.Controle(x: Boolean);
begin
   btnNova.Enabled       := x;
   btnAlterar.Enabled    := x;
   btnExcluir.Enabled    := x;
   btnSair.Enabled       := x;
   gbEquipamento.Enabled := Not x;
end;

procedure T_Equipamentos.dbgEquipKeyPress(Sender: TObject; var Key: Char);
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
   _dm.qr03.Locate( 'Descricao', cBusca, [loPartialKey, loCaseInsensitive] );
end;

procedure T_Equipamentos.btnSairClick(Sender: TObject);
begin
   Close;
end;

end.
