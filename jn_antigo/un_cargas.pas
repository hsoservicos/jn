{
Iniciado em 20/02/2010.

Alterado em 26/02/2010 - Modificações nos botões, tipos de arquivo e processamento de dados. 
}

unit un_cargas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, ComCtrls, ExtCtrls;

type
  T_cargas = class(TForm)
    ArqCarga: TOpenDialog;
    btnArquivo: TBitBtn;
    edtArqvuivo: TEdit;
    btnCarga: TBitBtn;
    g: TGauge;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    rgTipoCarga: TRadioGroup;
    procedure btnArquivoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnCargaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtArqvuivoExit(Sender: TObject);
    procedure rgTipoCargaClick(Sender: TObject);
  private    { Private declarations }
   nL : Integer;
  public     { Public declarations }
  end;

var
  _cargas: T_cargas;

implementation

uses Un_UDF, un_dm, un_main;

{$R *.dfm}

procedure T_cargas.FormCreate(Sender: TObject);
begin
   nL := 0;
end;

procedure T_cargas.FormShow(Sender: TObject);
begin
   btnCarga.Visible    := False;
   g.Visible           := False;
   rgTipoCarga.Visible := False;
   edtArqvuivo.Text    := '';
   ArqCarga.InitialDir := _main.cLocal;
   btnCarga.Caption    := 'Rodar'#13'Script';
end;

procedure T_cargas.btnArquivoClick(Sender: TObject);
begin //
   If ArqCarga.Execute then
   Begin
      edtArqvuivo.Text := ArqCarga.FileName;
      nL := Numero_de_Linhas_em_um_Arquivo_TXT( ArqCarga.FileName );
   End;
end;

procedure T_cargas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_ESCAPE :
         Close;
      VK_RETURN :
      Begin
         Perform( WM_NEXTDLGCTL, 0, 0 );
         Key := 0;
      End;
   end;
end;

procedure T_cargas.edtArqvuivoExit(Sender: TObject);
begin
   If edtArqvuivo.Text <> '' Then rgTipoCarga.Visible := True;
end;

procedure T_cargas.rgTipoCargaClick(Sender: TObject);
begin
   btnCarga.Visible := True;
end;

procedure T_cargas.btnCargaClick(Sender: TObject);
//Var
//   i : Integer;
//   arq : TextFile;
//   Texto : TMemo;
//   cLinha : String;
begin
(*
   If edtArqvuivo.Text = '' Then
   Begin
      MessageDlg( 'Não foi informado o Caminho e'#13'Arquivo para execução.'#13'Módulo será finalizado.', mtWarning, [ mbOk ], 0 );
      Close;
   End
   Else
   Begin
      If btnCarga.Caption = 'Sair' Then
      Begin
         Close;
      End
      Else
      Begin
         If rgTipoCarga.ItemIndex = 0 Then
         Begin
            g.MinValue := 0;
            g.MaxValue := nL - 1;
            g.Visible := True;
            AssignFile( arq, ArqCarga.FileName );
            Reset( arq );
            i := 1;
            While not eof( arq ) Do
            begin
               g.Progress := i;
               i := i + 1;
               ReadLn( arq, cLinha );
               Label1.Caption := IntToStr( i ) + ' ' + cLinha;
               Application.ProcessMessages;
               Try
                  _dm.qrAux.Close;
                  _dm.qrAux.SQL.Text := cLinha;
                  _dm.qrAux.ExecSQL;
               Except
                  _dm.qrAux.Cancel;
                  CloseFile( arq );
                  If btnCarga.Caption = 'Rodar Script' Then btnCarga.Caption := 'Sair';
                  Raise Exception.Create( 'Falha na Execusão do Script.'#13'(Módulo Cargas)' );
                  Exit;
               end;
            end;
            CloseFile( arq );
         End
         Else
         Begin
            AssignFile( arq, ArqCarga.FileName );
            Reset( arq );
            Read( arq, Texto );
            Try
               _dm.qrAux.Close;
               _dm.qrAux.SQL.Text := Texto;
               _dm.qrAux.ExecSQL;
            Except
               _dm.qrAux.Cancel;
               CloseFile( arq );
               If btnCarga.Caption = 'Rodar Script' Then btnCarga.Caption := 'Sair';
               Raise Exception.Create( 'Falha na Execusão do Script.'#13'(Módulo Cargas)' );
               Exit;
            end;
            CloseFile( Texto );
         End;
         If btnCarga.Caption = 'Rodar Script' Then btnCarga.Caption := 'Sair';
      End;
   End; *)
end;

end.
