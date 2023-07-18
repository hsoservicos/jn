unit Un_Aguarde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Gauges, StdCtrls, Buttons;

type
  T_Aguarde = class(TForm)
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    g: TGauge;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private    { Private declarations }
  public     { Public declarations }
   lFlg : Boolean;
  end;

var
  _Aguarde: T_Aguarde;

implementation

uses Un_UDF, Un_dm, DB, Un_Main, Math;

{$R *.dfm}

procedure T_Aguarde.FormCreate(Sender: TObject);
begin
   lFlg := False;
end;

procedure T_Aguarde.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   If Key = VK_ESCAPE Then Close;
end;

procedure T_Aguarde.FormShow(Sender: TObject);
begin
   Panel1.Visible := False;
end;

procedure T_Aguarde.BitBtn1Click(Sender: TObject);
Var
   cOs, cNova : String;
   nAux, nOs, nAtual : Integer;
begin
   BitBtn1.Visible := False;
   Panel1.Visible := True;
   Application.ProcessMessages;
   cOs := LerIni( _Main.cLocal + 'GS.INI', 'Numeracao', 'OS' );
   _dm.qr12.Close;
   _dm.qr12.SQL.Text := 'select * from Servicos where OS <> "" order by OS';
   _dm.qr12.Open;
   g.MinValue := 0;
   g.MaxValue := _dm.qr12.RecordCount;
   nOs        := 1;
   While Not _dm.qr12.Eof Do
   begin
      If IsInteger( _dm.qr12.FieldByName( 'OS' ).AsString ) Then
      Begin
         nAtual := StrToInt( GetNumeros( _dm.qr12.FieldByName( 'OS' ).AsString ) );
         If nOs < nAtual Then
         Begin
            nAux   := nAtual;
            nOs    := nAux;
         End;
      End;
      g.Progress := _dm.qr12.RecNo;
      _dm.qr12.Next;
   End;
   cNova := intToStr( nOs );
   GravarIni( _Main.cLocal + 'GS.INI', 'Numeracao', 'OS', cNova );
   Close;
end;

procedure T_Aguarde.FormDestroy(Sender: TObject);
begin
   If lFlg Then Close;
   // FormKeyDown( VK_ESCAPE );
end;

end.
