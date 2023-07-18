program JN;

uses
  Forms,
  windows,
  Dialogs,
  SysUtils,
  Un_Main in 'Un_Main.pas' {_Main},
  Un_dm in 'Un_dm.pas' {_dm: TDataModule},
  Un_Areas in 'Un_Areas.pas' {_Areas},
  Un_Clientes in 'Un_Clientes.pas' {_Clientes},
  Un_UDF in 'Un_UDF.pas',
  Un_Situacoes in 'Un_Situacoes.pas' {_Situacoes},
  Un_Funcionarios in 'Un_Funcionarios.pas' {_Funcionarios},
  Un_Registro_Servico in 'Un_Registro_Servico.pas' {_Registro_Servico},
  Un_ConsultarServico in 'Un_ConsultarServico.pas' {_ConsultarServico},
  Un_Exibir_OS in 'Un_Exibir_OS.pas' {_Exibir_OS},
  Un_Equipamentos in 'Un_Equipamentos.pas' {_Equipamentos},
  Un_Movimentar_Servicos in 'Un_Movimentar_Servicos.pas' {_Movimentar_Servicos},
  Un_Imprimir_OS in 'Un_Imprimir_OS.pas' {_Imprimir_OS: TQuickRep},
  un_recibo_os in 'un_recibo_os.pas' {_Recibo_OS: TQuickRep},
  un_fechamento_de_os in 'un_fechamento_de_os.pas' {_fechamento_de_os},
  un_dados_do_recibo_de_entrada in 'un_dados_do_recibo_de_entrada.pas' {_dados_do_recibo_de_entrada},
  un_recibo_de_saida in 'un_recibo_de_saida.pas' {_recibo_de_saida: TQuickRep},
  un_orcamento_avulso in 'un_orcamento_avulso.pas' {_orcamento_avulso};

{$R *.res}

begin
   Application.Initialize;
   Application.Title := 'JN Informática';
  Application.CreateForm(T_Main, _Main);
   Application.Run;
end.
