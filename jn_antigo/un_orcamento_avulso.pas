unit un_orcamento_avulso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  T_orcamento_avulso = class(TForm)
    gbEquipamento: TGroupBox;
    lblEquipamento: TLabel;
    lblArea: TLabel;
    cbEquipamento: TComboBox;
    edtDefeito: TLabeledEdit;
    edtComplemento: TLabeledEdit;
    cbArea: TComboBox;
    gbCliente: TGroupBox;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtCEP: TLabeledEdit;
    edtFone1: TLabeledEdit;
    edtFone2: TLabeledEdit;
    edtFax: TLabeledEdit;
    edtCelular: TLabeledEdit;
    edtEmail: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _orcamento_avulso: T_orcamento_avulso;

implementation

{$R *.dfm}

end.
