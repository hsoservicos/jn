unit un_recibo_os;

interface

uses
   Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, DB;

type
  T_Recibo_OS = class(TQuickRep)
    TitleBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    lblNRecibo: TQRLabel;
    QRShape2: TQRShape;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    lblDataEmissao: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrTexto: TQRRichText;
    qrGarantia: TQRRichText;
    lblValor: TQRLabel;
    QRShape5: TQRShape;
    PageFooterBand1: TQRBand;
    lblDataCiente: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel4: TQRLabel;
    qrObservacoes: TQRRichText;
    QRLabel5: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private

  public

  end;

var
  _Recibo_OS: T_Recibo_OS;

implementation

uses Un_dm, Un_UDF, Un_Main;

{$R *.DFM}

procedure T_Recibo_OS.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
Var
   cCliente, cEquip, cArea, cExecutado : String;
   nValor : Real;
   cLinhas, cGarantia, cObservacoes : String;
begin
   _Recibo_OS.ReportTitle := 'Recibo da OS ' + lblNRecibo.Caption;
   QRLabel1.Caption       := 'Fone: ' +
                             LerIni( _Main.cLocal + 'JN.INI', 'Empresa', 'DDD' ) + ' ' +
                             LerIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Fone #1' );
   QRLabel3.Caption       := LerIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Endereco' ) + ' ' +
                             LerIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Bairro' ) + ' ' +
                             LerIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Cidade' ) + ' ' +
                             LerIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Estado' ) + ' ' +
                             LerIni( _Main.cLocal + 'JN.INI', 'Empresa', 'CEP' );

   QRLabel11.Caption         := 'Email: ' + LerIni( _Main.cLocal + 'JN.INI', 'Empresa', 'eMail' );

   QRLabel5.Caption          := 'CNPJ: ' + LerIni( _Main.cLocal + 'JN.INI', 'Empresa', 'CNPJ' );


   QRLabel10.Caption      := LerIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Nome' );
   lblDataEmissao.Caption := DateToStr( Now );
   lblDataCiente.Caption := '' + DataExtenso( Now ) + '.';
   _dm.qr10.Close;
   _dm.qr10.SQL.Text := 'select * from Servicos';
   _dm.qr10.Open;
   _dm.qr10.Locate( 'OS', lblNRecibo.Caption, [] );
   nValor           := _dm.qr10.FieldByName( 'Valor' ).AsFloat;
   lblValor.Caption := 'R$ ' + FormatFloat( '##,##0.00', nValor ) + '  ';
   cExecutado       := _dm.qr10.FieldByName( 'ServicoExecutado' ).AsString;
   cObservacoes     := _dm.qr10.FieldByName( 'Obs' ).AsString;
   qrObservacoes.Lines.Add( cObservacoes );
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from Clientes';
   _dm.qr11.Open;
   _dm.qr11.Locate( 'CodCliente', _dm.qr10.FieldByName( 'CodCliente' ).AsString, [] );
   cCliente := _dm.qr11.FieldByName( 'NomeCliente' ).AsString;
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from [Tipo de equipamento]';
   _dm.qr11.Open;
   _dm.qr11.Locate( 'CodEquipamento', _dm.qr10.FieldByName( 'Equipamento' ).AsString, [] );
   cEquip := _dm.qr11.FieldByName( 'Descricao' ).AsString;
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from Area order by Descricao';
   _dm.qr11.Open;
   cArea := _dm.qr11.FieldByName( 'Descricao' ).AsString;;
//   lblDefeito.Caption  := _dm.qr10.FieldByName( 'Defeito' ).AsString;

   qrTexto.Lines.Clear;
   cLinhas := '     Recebemos de(a) ' + cCliente +
              ', a importância supra de R$ ' + FormatFloat( '##,##0.00', nValor ) +
              ' ( ' + extenso( nValor ) + ' ), referente serviço de manutenção em seu equipamento ( ' +
              '' + cEquip + ', ' + _dm.qr10.FieldByName( 'Complemento' ).AsString + ', Nº de Série: ' +
              _dm.qr10.FieldByName( 'NSerie' ).AsString + ' )' + #13 +
              '     No qual foi realizado: ' + #13 + cExecutado;
{              + #13 + 'Retirado por: ' + _dm.qr10.FieldByName( 'Portador' ).AsString;
Removido por solicitação do Edlas, em 03/07/2020.
}
   qrTexto.Lines.Add( cLinhas );
   qrGarantia.Lines.Clear;
   cGarantia := '1 - A JN INFORMATICA, inscrita no CNPJ nº 40.384.835/0001-07, assegura ao cliente acima identificado uma garantia de 90 (Noventa) dias sobre o equipamento acima descrito, contada a partir da data de emissão desse recibo.' + #13 +
                '2 - A Garantia cobre somente os defeitos de funcionamento das peças e componentes dos equipamentos descritos nas condições normais de uso - de acordo com as instruções dos manuais de operação que acompanham os mesmos, e que são fornecidos pelos ' +
                'fabricantes.' + #13 +
                '3 - Essa garantia ficará automaticamente cancelada se o equipamento vier a sofrer reparos por pessoas não autorizadas, receber maus tratos ou sofrer danos decorrentes de acidentes, quedas, variações de tensão elétrica e sobrecarga' +
                ' acima do especificado, ou qualquer ocorrência imprevisível, decorrentes de má utilização dos equipamentos por parte do usuário.';
   qrGarantia.Lines.Add( cGarantia );
end;

end.
