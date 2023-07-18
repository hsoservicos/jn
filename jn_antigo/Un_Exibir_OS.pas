unit Un_Exibir_OS;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, jpeg, ExtCtrls, Buttons, StdCtrls;

type
  T_Exibir_OS = class(TForm)
    Panel1: TPanel;
    edtOS: TEdit;
    edtCliente: TEdit;
    edtSituacao: TEdit;
    edtEquipamento: TEdit;
    edtComplemento: TEdit;
    edtSerie: TEdit;
    edtEntrada: TEdit;
    edtArea: TEdit;
    edtTecnico: TEdit;
    edtExecutante: TEdit;
    edtDefeito: TMemo;
    cbPago: TCheckBox;
    edtValor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edtPrevisto: TEdit;
    edtSaida: TEdit;
    edtObservacao: TMemo;
    Label11: TLabel;
    edtServico: TMemo;
    btnFechar: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    lblRetornoTexto: TLabel;
    lblRetorno: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
  private    { Private declarations }
  public     { Public declarations }
  end;

var
  _Exibir_OS: T_Exibir_OS;

implementation

{$R *.dfm}

procedure T_Exibir_OS.FormCreate(Sender: TObject);
begin
//
end;

procedure T_Exibir_OS.FormShow(Sender: TObject);
begin //
   If ( edtOS.Text = '' ) or ( edtOS.Text = '0000000000' ) Then
   Begin
      _Exibir_OS.btnFechar.Caption := 'Finalizar visualização da O.S. - ( Sem Número )';
   End
   Else
      _Exibir_OS.Caption := 'Exibindo OS Nº ' + edtOS.Text;
end;

procedure T_Exibir_OS.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   Case Key Of
      VK_ESCAPE : Close;
      VK_RETURN : Close;
   End;
end;

procedure T_Exibir_OS.btnFecharClick(Sender: TObject);
begin
   Close;
end;

end.
