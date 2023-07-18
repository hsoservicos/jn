unit un_dados_do_recibo_de_entrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  T_dados_do_recibo_de_entrada = class(TForm)
    GroupBox1: TGroupBox;
    edtLinha1: TLabeledEdit;
    edtLinha2: TLabeledEdit;
    edtLinha3: TLabeledEdit;
    edtLinha4: TLabeledEdit;
    edtLinha5: TLabeledEdit;
    BitBtn1: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private    { Private declarations }
  public     { Public declarations }
  end;

var
  _dados_do_recibo_de_entrada: T_dados_do_recibo_de_entrada;

implementation

uses Un_Main, Un_UDF;

{$R *.dfm}

procedure T_dados_do_recibo_de_entrada.FormShow(Sender: TObject);
begin
   edtLinha1.Text := LerIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 1' );
   edtLinha2.Text := LerIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 2' );
   edtLinha3.Text := LerIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 3' );
   edtLinha4.Text := LerIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 4' );
   edtLinha5.Text := LerIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 5' );
end;

procedure T_dados_do_recibo_de_entrada.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure T_dados_do_recibo_de_entrada.BitBtn1Click(Sender: TObject);
begin
   If ( edtLinha1.Text <> '' ) Then GravarIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 1', edtLinha1.Text );
   If ( edtLinha2.Text <> '' ) Then GravarIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 2', edtLinha2.Text );
   If ( edtLinha3.Text <> '' ) Then GravarIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 3', edtLinha3.Text );
   If ( edtLinha4.Text <> '' ) Then GravarIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 4', edtLinha4.Text );
   If ( edtLinha5.Text <> '' ) Then GravarIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 5', edtLinha5.Text );
   Close;
end;

end.
