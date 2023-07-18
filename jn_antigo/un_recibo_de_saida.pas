unit un_recibo_de_saida;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  T_recibo_de_saida = class(TQuickRep)
    TitleBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    lblNOs: TQRLabel;
    QRShape2: TQRShape;
    lblDataEmissao: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
  private

  public

  end;

var
  _recibo_de_saida: T_recibo_de_saida;

implementation

uses Un_dm, Un_UDF, Un_Main, Un_Registro_Servico;  

{$R *.DFM}

end.
