{
JN INFORMATICA
Av. Caxanga ,345 - Apt.09 - 1°andar - Madalena – Recife/PE
CGC: 40.384.835/0001-07 – Insc. Mun: 0

Anterior - 09/07/2011 - Humberto Santos
Edição em 01/07/2020 - Humberto Santos

Un_Registro_Servico
NovaOS - 21/07/2020 - Removido bloco de repetição, estava gerando redundância no processamento.

}

unit Un_Main;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ExtCtrls, Menus, jpeg,
   StdCtrls, TLHelp32, XPMan;

type
  T_Main = class(TForm)
    mMenu: TMainMenu;
    pMenu: TPopupMenu;
    Tempo: TTimer;
    stb: TStatusBar;
    Cadastros1: TMenuItem;
    Areas1: TMenuItem;
    Clientes1: TMenuItem;
    Equipamentos1: TMenuItem;
    Situacoes1: TMenuItem;
    Funcionarios1: TMenuItem;
    Servicos1: TMenuItem;
    Registro1: TMenuItem;
    Sair1: TMenuItem;
    imgLogoGs: TImage;
    Servios1: TMenuItem;
    Clientes2: TMenuItem;
    Sair2: TMenuItem;
    Consultar1: TMenuItem;
    pnlRede: TPanel;
    N1: TMenuItem;
    LeituradeNdeOs1: TMenuItem;
    Fechamento1: TMenuItem;
    Script1: TMenuItem;
    Configuraes1: TMenuItem;
    DadosnaOS1: TMenuItem;
    RecibodeEntrada1: TMenuItem;
    XPManifest1: TXPManifest;
    gbAviso: TGroupBox;
    lblAviso1: TLabel;
    tOS: TTimer;
    tAviso: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Areas1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Equipamentos1Click(Sender: TObject);
    procedure Situacoes1Click(Sender: TObject);
    procedure Registro1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure Script1Click(Sender: TObject);
    procedure RecibodeEntrada1Click(Sender: TObject);
    procedure tOSTimer(Sender: TObject);
    procedure tAvisoTimer(Sender: TObject);
    procedure Fechamento1Click(Sender: TObject);
   private    { Private declarations }
      cBusca : String;
   public     { Public declarations }
      cPath, nIP : String;
      cLocal, cUnid : String;
      stlCivil, stlFunc, stlClientes : TStringList;
      stlEquip, stlArea, stlSit : TStringList;
      stlOs : TStringList;
      Procedure ErrorMsg( Sender : TObject; E: exception );
      Procedure Rodape( Sender: TObject );
  end;

var
   _Main : T_Main;

implementation

uses
   Un_dm, Un_Areas, Un_Clientes,
   Un_UDF, Un_Equipamentos, Un_Situacoes, Un_Funcionarios,
   Un_Registro_Servico, Un_ConsultarServico, un_dados_do_recibo_de_entrada, un_cargas,
   un_fechamento_de_os;

{$R *.dfm}

procedure T_Main.ErrorMsg( Sender : TObject; E : exception );
var
   Filename : String;
   LogFile : TextFile;
begin
   Filename := ChangeFileExt( Application.Exename, '.log' );       // Prepara o arquivo de log.
   AssignFile( LogFile, Filename );
   if FileExists( FileName ) then
      Append( LogFile )                                            // Caso já exista abre o arquivo.
   else
      Rewrite( LogFile );                                          // Caso contrário cria um arquivo.
   try
      Writeln( LogFile, DateTimeToStr( Now ) + ': ' + E.Message ); // Escreve o erro envontrado no arquivo.
   finally
      CloseFile( LogFile );                                        // Fecha o arquivo.
   end;
   GravarIni( _Main.cLocal + 'JN.INI', 'Execução', 'ON', '0' );
   MessageDlg( E.Message +
               #13#13 +
               'Por favor entre em contato com o suporte técnico:'#13'HSO Serviços Técnicos'#13'Fones: (81) 3028.0800 / 8783.8320 / 9268.0142 / 9823.7034'#13'email: hsoservicos@oi.com.br'#13'Mensseger: hsoservicos@hotmail.com',
               mtError,
               [mbOK], 0 );                                        // Apresenta a informação de erro.
end;

Procedure T_Main.Rodape(Sender: TObject);
begin
   stb.Panels[0].Text := Application.Hint;
end;

procedure T_Main.FormCreate(Sender: TObject);
var
   i: Integer;
begin // Criação
   Application.ProcessMessages;
   Application.OnException    := ErrorMsg;
   Application.OnHint         := Rodape;
   Application.HintColor      := $005BFFAD; // clSkyBlue; //
   Application.HintHidePause  := 100000;
   Application.HintPause      := 20; {Tempo de exibição do Hint}
   Application.HintShortPause := 1;  {Tempo para exibir o Hint}
   cLocal    := ExtractFilePath( Application.ExeName );
   cPath     := Copy( cLocal, 3, Length( cLocal ) - 2 );
   cUnid     := Copy( cLocal, 1, 1 );
   nIP       := GetIP;
   cBusca    := '';
// {*
   for i := 1 to ParamCount do // Leitura de parâmetros de inicialização.
   begin
      if LowerCase(ParamStr(i)) = 'corrigir' then
      begin
         GravarIni( cLocal + 'JN.INI', 'Execução', 'ON', '0' );
         ShowMessage( 'Correção da Inicialização...' );
      end;
   end;
// *}
   Formato_de_Data;
   If ( Not FileExists( _Main.cLocal + 'JN.INI' ) )  Then
   Begin
      GravarIni( _Main.cLocal + 'JN.INI', 'GERAL',           'Sistema',         'Aplicativo de Gestão da JN INFORMATICA - em ADO' );
      GravarIni( _Main.cLocal + 'JN.INI', 'GERAL',           'Local',           cLocal );
      GravarIni( _Main.cLocal + 'JN.INI', 'GERAL',           'Versao',          '2.1.1.0' );
      GravarIni( _Main.cLocal + 'JN.INI', 'GERAL',           'Interno',         'JN.EXE' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Banco de Dados',  'Database',        'jn' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Banco de Dados',  'Servidor BD',     'Access' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Banco de Dados',  'Provider',        'Microsoft.Jet.OLEDB.4.0' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Banco de Dados',  'HostName',        nIP );
      GravarIni( _Main.cLocal + 'JN.INI', 'Banco de Dados',  'Pasta',           cPath ); // 'JN INFORMATICA'
      GravarIni( _Main.cLocal + 'JN.INI', 'Banco de Dados',  'BD',              'BD_JN.mdb' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Banco de Dados',  'Caminho na Rede', '' );
      GravarIni( _Main.cLocal + 'JN.INI', 'REGISTRO',        'Inicio',          DateToStr( Now ) );
      GravarIni( _Main.cLocal + 'JN.INI', 'DESENVOLVIMENTO', 'Empresa',         'HSO Serviços' );
      GravarIni( _Main.cLocal + 'JN.INI', 'DESENVOLVIMENTO', 'Desenvolvedor',   'Humberto Santos' );
      GravarIni( _Main.cLocal + 'JN.INI', 'DESENVOLVIMENTO', 'Contato',         '(81) 98121.4008' );
      GravarIni( _Main.cLocal + 'JN.INI', 'DESENVOLVIMENTO', 'Email',           'hsoservicos@gmail.com' );
      GravarIni( _Main.cLocal + 'JN.INI', 'DESENVOLVIMENTO', 'Messenger',       'hsoservicos' );
   End;

   If ( LerIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Nome' ) = '' ) Then
   Begin
      GravarIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Nome',        'JN INFORMATICA' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Endereco',    'Av. Caxangá, 345 - 1º andar - Aptº 09, Sala 1' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Bairro',      'Madalena' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Cidade',      'Recife' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Estado',      'PE' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Empresa', 'CEP',         '50.720-000' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Empresa', 'DDD',         '81' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Fone #1',     '99617.3912' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Fone #2',     '0' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Empresa', 'Fax',         '0' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Empresa', 'CNPJ',        '40.384.835/0001-07' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Empresa', 'IE',          'nd' );
      GravarIni( _Main.cLocal + 'JN.INI', 'Empresa', 'eMail',       'joaonobrega2004@hotmail.com' );
   End;
   If ( LerIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 1' ) = '' ) Then GravarIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 1', 'Obs: Após ser aprovado o orçamento, favor retirar o equipamento no prazo de 07 (sete) dias.' );
   If ( LerIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 2' ) = '' ) Then GravarIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 2', 'Caso contrário será cobrada taxa de armazenamento de R$ 1,00 (dia).' );
   If ( LerIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 3' ) = '' ) Then GravarIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 3', 'O equipamento só será entregue mediante a Ordem de Serviço.' );
   If ( LerIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 4' ) = '' ) Then GravarIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 4', 'Garantia de 90 (noventa) dias para serviços executados, a partir do dia da entrega.' );
   If ( LerIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 5' ) = '' ) Then GravarIni( _Main.cLocal + 'JN.INI', 'Recibo Entrada', 'Linha 5', 'Perderá a garantia se o lacre da empresa for violado.' );
   If ( LerIni( _Main.cLocal + 'JN.INI', 'Execução', 'ON' ) = '' ) Then
   Begin
      GravarIni( _Main.cLocal + 'JN.INI', 'Execução', 'ON', '0' );
   End;
   pnlRede.Visible := False;
   _dm := T_dm.Create( Self );
   If Not _dm.jn.Connected Then
   Begin
      Application.Terminate;
   End;
   If ( LerIni( _Main.cLocal + 'JN.INI', 'Execução', 'ON' ) = '1' ) Then
   Begin
      MessageDlg( 'ERRO:'#13''#13'Aplicação em Execução!'#13''#13'> FAVOR VERIFICAR <', mtWarning, [ mbOk ], 0 );
      Application.Terminate;
   End
   else
   Begin
      GravarIni( _Main.cLocal + 'JN.INI', 'Execução', 'ON', '1' );
   End;
   
   If ( LerIni( _Main.cLocal + 'JN.INI', 'Numeracao', 'OS' ) = '' ) Then
   Begin
      GravarIni( _Main.cLocal + 'JN.INI', 'Numeracao', 'OS',         '1' );
   End
   Else
   Begin
      Try
         _Registro_Servico := T_Registro_Servico.Create( Self );
//         GravarIni( _Main.cLocal + 'JN.INI', 'Numeracao', 'OS', IntToStr( _Registro_Servico.NovaOS - 1 ) );
      Finally
         _Registro_Servico.Release;
         _Registro_Servico := Nil;
      End;
   End;

   stlCivil    := TStringList.Create;
   stlFunc     := TStringList.Create;
   stlClientes := TStringList.Create;
   stlEquip    := TStringList.Create;
   stlArea     := TStringList.Create;
   stlSit      := TStringList.Create;
   stlOs       := TStringList.Create;
   stb.Panels[2].Text := DateTimeToStr( Now );
end;

procedure T_Main.FormShow(Sender: TObject);
begin // Abretura
   gbAviso.Visible := False;
   stb.Panels[2].Text := DateTimeToStr( Now );
   _dm.qrAux.Close;
   _dm.qrAux.SQL.Text := 'select * from Servicos where Controle is Null';
   _dm.qrAux.Open;
   If _dm.qrAux.RecordCount > 0 Then
   Begin
      lblAviso1.Color   := clRed;
      lblAviso1.Caption := 'Existem ' + FormatFloat( '###,##0', _dm.qrAux.RecordCount ) + ' Ordens de Serviço em aberto no sistema.';
      gbAviso.Visible   := True;
      Application.ProcessMessages;
   End;
end;

procedure T_Main.tAvisoTimer(Sender: TObject);
begin //
   If gbAviso.Visible Then
   Begin
      lblAviso1.Visible := Not lblAviso1.Visible;
      Application.ProcessMessages;
   End;
end;

procedure T_Main.tOSTimer(Sender: TObject);
begin //
   _dm.qrAux.Close;
   _dm.qrAux.SQL.Text := 'select * from Servicos where Controle is Null';
   _dm.qrAux.Open;
   If _dm.qrAux.RecordCount > 0 Then
   Begin
      lblAviso1.Color   := clRed;
      lblAviso1.Caption := 'Existem ' + FormatFloat( '###,##0', _dm.qrAux.RecordCount ) + ' O.S. em aberto no sistema.';
      gbAviso.Visible   := True;
      Application.ProcessMessages;
   End
   Else
   Begin
      gbAviso.Visible   := False;
   End;
   _dm.qrAux.Close;
end;

procedure T_Main.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   Case Key Of
      VK_ESCAPE : Close;
      VK_F2 :
      Begin
         _ConsultarServico := T_ConsultarServico.Create( Self );
         Try
            _ConsultarServico.ShowModal;
         Finally
            _ConsultarServico.Release;
            _ConsultarServico := Nil;
         End;
      End;
   End;
end;

procedure T_Main.Sair1Click(Sender: TObject);
begin
   Close;
end;

procedure T_Main.Areas1Click(Sender: TObject);
begin // Áreas
   _Areas := T_Areas.Create( Self );
   Try
      _Areas.ShowModal;
   Finally
      _Areas.Release;
      _Areas := Nil;
   End;
end;

procedure T_Main.Clientes1Click(Sender: TObject);
begin // Clientes
   _Clientes := T_Clientes.Create( Self );
   Try
      _Clientes.ShowModal;
   Finally
      _Clientes.Release;
      _Clientes := Nil;
   End;
end;

procedure T_Main.Equipamentos1Click(Sender: TObject);
begin // Equipamentos
   _Equipamentos := T_Equipamentos.Create( Self );
   Try
      _Equipamentos.ShowModal;
   Finally
      _Equipamentos.Release;
      _Equipamentos := Nil;
   End;
end;

procedure T_Main.Situacoes1Click(Sender: TObject);
begin // Situação
   _Situacoes := T_Situacoes.Create( Self );
   Try
      _Situacoes.ShowModal;
   Finally
      _Situacoes.Release;
      _Situacoes := Nil;
   End;
end;

procedure T_Main.Funcionarios1Click(Sender: TObject);
begin // Funcionários
   _Funcionarios := T_Funcionarios.Create( Self );
   Try
      _Funcionarios.ShowModal;
   Finally
      _Funcionarios.Release;
      _Funcionarios := Nil;
   End;
end;

procedure T_Main.Registro1Click(Sender: TObject);
begin // Serviços
   _Registro_Servico := T_Registro_Servico.Create( Self );
   Try
      _Registro_Servico.ShowModal;
   Finally
      _Registro_Servico.Release;
      _Registro_Servico := Nil;
   End;
end;

procedure T_Main.Consultar1Click(Sender: TObject);
begin
   _ConsultarServico := T_ConsultarServico.Create( Self );
   Try
      _ConsultarServico.ShowModal;
   Finally
      _ConsultarServico.Release;
      _ConsultarServico := Nil;
   End;
end;

procedure T_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   If MessageDlg( 'Finalizar Sistema - JN?', mtConfirmation, [ mbYes, mbNo ], 0  ) = mrNo Then
   Begin
      Abort;
   End
   else
   begin
      GravarIni( _Main.cLocal + 'JN.INI', 'Execução', 'ON', '0' );
   end;
end;

procedure T_Main.Script1Click(Sender: TObject);
begin // Carga de Scripts SQL.

   _cargas := T_cargas.Create( Self );
   Try
      _cargas.ShowModal;
   Finally
      _cargas.Release;
      _cargas.Destroy;
      _cargas := Nil;
   End;

end;

procedure T_Main.RecibodeEntrada1Click(Sender: TObject);
begin //
   Try
      _dados_do_recibo_de_entrada := T_dados_do_recibo_de_entrada.Create( Self );
      _dados_do_recibo_de_entrada.ShowModal;
   Finally
      _dados_do_recibo_de_entrada.Release;
      _dados_do_recibo_de_entrada.Destroy;
      _dados_do_recibo_de_entrada := Nil;
   End;
end;

procedure T_Main.Fechamento1Click(Sender: TObject);
begin { Verificar como funciona o módulo! }
   try
      _fechamento_de_os := T_fechamento_de_os.Create( Self );
      _fechamento_de_os.ShowModal;
   Finally
      _fechamento_de_os.Release;
      _fechamento_de_os.Destroy;
      _fechamento_de_os := Nil;
   End;
end;

end.
