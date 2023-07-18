unit Un_UDF;

interface

Uses
   Windows, IniFiles, Dialogs, SysUtils, ConvUtils, Winsock, Registry, Forms;

type
   DriveType = ( dtUnknown, dtNotExist, dtRemovable, dtFixed, dtRemote, dtCdRom, dtRamDisk, dtError );
   TVolInfo = record
   Name: string;
   Serial: Cardinal;
   IsCompressed: boolean;
   MaxCompLen: Cardinal;
   FileSysName: string;
end;

Function AbreviaNome( Nome: String ): String;

// Encriptação
Function Encrypt( cSenha : String ) : String;
Function EncDecStr( StrValue : String; Chave: Word ) : String;

// > Tratando de Daos em arquivos .Ini <
Function GravarIni( cArquivo, cSecao, cIdentificador, cValor : String ) : Boolean;
Function LerIni( cArquivo, cSecao, cIdentificador : String ) : String;

// > Tratar Numeros <<
Function Virgula_por_Ponto( cValor : String ) : String;
Function GetNumeros( sStrn: String ): String;
Function TiraFormatacao( cValor : String ) : String;
Function StrZero( nVariavel, nTamanho : Integer ) : String;
Function IsInteger( TestaString: String ) : boolean;

// > Trata Datas <
Function InverteData( dData : String ) : String;
Function InverteDataIB( dData : String ) : String;
Function DataExtenso( Data:TDateTime ): String;
Function UltDiaDoMes( Data: TDateTime ): Word; // Retorna o Ultimo dia do mes de uma determinada data.
Function DateMais( Dat : TDateTime ; Numdias : Integer ) : TDateTime; { Soma um determinado número de dias à data atual }
Function DateMenos( Dat : TDateTime ; Numdias : Integer ) : TDateTime; { Subtrai um determinado número de dias à data atual }
Function NomedoMes( dData : TDateTime ) : String;
Procedure Formato_de_Data;
Function AnoBixesto(Data: TDateTime): Boolean; {Testa se um ano é bixesto, retornando True em caso positivo}

// > Unidade de Disco <
Function DriveLetters: string; { Retorna uma string contendo as letras de unidades de existentes }
Function GetIP : string; //--> Declare a Winsock na clausula uses da unit

// > Booleanas <
Function FBoolToStr( Check : Boolean ) : String;              // converte de booleano para String
Function FStrToBool( Valor : String ) : Boolean;             // converte de string para booleano

Function ControlaCampoTexto( cDado : String ) : String;
Function CampoInforme( cDado : String ) : String;

Function Iif( cDado, cCheck, cValor1, cValor2 : String ) : String;

// Formatação
Function FormataDATA( cDado : String ) : String;
Function FormataCEP( cDado : String ) : String;
Function FormataFone( cDado : String ) : String;

// CPF e CNPJ
Function FCPF( xCPF : String ) : Boolean;
Function FCNPJ( xCNPJ : String ) : Boolean;
Function FCPFCNPJ( xDado : String ) : String;

// Impressao
Function PreparaTexto( Texto: String ) : String;

Function Numero_de_Linhas_em_um_Arquivo_TXT( Arqtexto : String ) : integer;

Function Centralizar( cDado : String ; nEspaco : Integer ) : String;
Function FormataEspaco( cDado : String ; nEspaco : Integer ) : String;

Function extenso( valor : real ) : string;

implementation

Const
   Unidades : array[1..9] of string = ( 'Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove' );
   Dez : array[1..9] of string = ( 'Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove' );
   Dezenas : array[1..9] of string = ( 'Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa' );
   Centenas : array[1..9] of string = ( 'Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos' );
   MoedaSigular = 'Real';
   MoedaPlural = 'Reais';
   CentSingular = 'Centavo';
   CentPlural = 'Centavos';
   Zero = 'Zero';

Function Encrypt( cSenha : String ) : String;
Const
   cChave : String = 'Jesus';
Var
   x, y : Integer;
   cNova : String;
Begin
   For X := 1 To Length( cChave ) Do
      Begin
         cNova := '';
         For Y := 1 To Length( cSenha ) do
            cNova := cNova + Chr( ( Ord( cChave[x] ) xor Ord( cSenha[y] ) ) );
         cSenha := cNova;
      End;
   Result := cSenha;
End;

Function EncDecStr( StrValue : String; Chave: Word ) : String;
var
   I: Integer;
   OutValue : String;
begin
   OutValue := '';
   for I := 1 to Length( StrValue ) do
      OutValue := OutValue + char( ( ord( StrValue[ I ] ) - Chave ) );
//      OutValue := OutValue + char( Not ( ord( StrValue[ I ] ) - Chave ) ); // Not // <- Erro, gera dados como um Trojan.
   Result := OutValue;
end;

Function GravarIni( cArquivo, cSecao, cIdentificador, cValor : String ) : Boolean;
Var cArqIni : TIniFile;
begin
   cArqIni := TIniFile.Create( cArquivo );
   try
      cArqIni.WriteString( cSecao, cIdentificador, cValor );
      Result := True;
   except
      ShowMessage( 'Não foi possível gravar no arquivo: ' + cArquivo );
      Result := False;
   end;
   cArqIni.Free;
end;

Function LerIni( cArquivo, cSecao, cIdentificador : String ) : String;
Var
   cArqIni : TIniFile;
begin
   cArqIni := TIniFile.Create( cArquivo );
   result := cArqIni.ReadString( cSecao, cIdentificador, '' );
   cArqIni.Free;
end;

Function Virgula_por_Ponto( cValor : String ) : String;
Var
   i : Integer;
   cVal : String;
begin
   cVal := cValor;
   If cVal <> ' ' Then
      Begin
         For i := 1 To Length( cValor ) do
         Begin
            If cVal[i] = '.' Then cVal[i] := ','
            Else
               If cVal[i] = ',' Then cVal[i] := '.';
         End;
      End;
   Result := cVal;
end;

Function GetNumeros( sStrn: String ): String;
var i: integer;
    sResult, sLetra: String;
begin
  for i := 1 to Length( sStrn ) do
  begin
    sLetra := Copy( sStrn, i, 1 );
    if ( sLetra > Chr( 47 ) ) and ( sLetra < Chr( 58 ) ) and ( sLetra <> '.' ) and ( sLetra <> '-' ) and ( sLetra <> '/' ) then
      sResult := sResult + sLetra;
  end;
  Result := sResult;
end;

Function TiraFormatacao( cValor : String ) : String;
Var
   i : Integer;
   cRet : String;
Begin
   cRet := '';
   for i := 1 to Length( cValor ) do
   begin
      If Copy( cValor, i, 1 ) <> ',' Then cRet := cRet + Copy( cValor, i, 1 );
      If Copy( cValor, i, 1 ) <> '.' Then cRet := cRet + Copy( cValor, i, 1 );
      If Copy( cValor, i, 1 ) <> 'R' Then cRet := cRet + Copy( cValor, i, 1 );
      If Copy( cValor, i, 1 ) <> '$' Then cRet := cRet + Copy( cValor, i, 1 );
   end;
   Result := cRet;
End;

Function StrZero( nVariavel, nTamanho : Integer ) : String;
Var
   nValor, i : Integer;
   cZeros : String;
begin
   nValor := nVariavel;
   cZeros := '';
   If ( nTamanho - Length( IntToStr( nValor ))) > 0 Then
      Begin
         For i := 1 To ( nTamanho - Length( IntToStr( nValor ))) do
            cZeros := cZeros + '0';
      End;
   Result := cZeros + IntToStr( nValor );
end;

Function IsInteger( TestaString: String ) : boolean;
begin
   Result := True;
   try
      StrToInt( TestaString );
   except
   On EConvertError do
      Result := False;
   end;
end;

Function InverteData( dData : String ) : String;
Var
   cData : String;
Begin
   cData := GetNumeros( dData );
   Result := '';
   If cData <> '' Then
      Result := Copy( cData, 3, 2 ) + '/' + Copy( cData, 1, 2 ) + '/' + Copy( cData, 5, 4 );
End;

Function InverteDataIB( dData : String ) : String;
Var
   cData : String;
Begin
   cData := GetNumeros( dData );
   Result := '';
   If cData <> '' Then
      Result := Copy( cData, 5, 4 ) + '/' + Copy( cData, 3, 2 ) + '/' + Copy( cData, 1, 2 );
End;

// Exibe a data por extenso.
Function DataExtenso( Data:TDateTime ): String;
var
   NoDia : Integer;
//   Now: TdateTime;
   DiaDaSemana : array [1..7] of String;
   Meses : array [1..12] of String;
   Dia, Mes, Ano : Word;
begin
   DiaDasemana [1] := 'Domingo';
   DiaDasemana [2] := 'Segunda-feira';
   DiaDasemana [3] := 'Terça-feira';
   DiaDasemana [4] := 'Quarta-feira';
   DiaDasemana [5] := 'Quinta-feira';
   DiaDasemana [6] := 'Sexta-feira';
   DiaDasemana [7] := 'Sábado';
   Meses [1]  := 'Janeiro';
   Meses [2]  := 'Fevereiro';
   Meses [3]  := 'Março';
   Meses [4]  := 'Abril';
   Meses [5]  := 'Maio';
   Meses [6]  := 'Junho';
   Meses [7]  := 'Julho';
   Meses [8]  := 'Agosto';
   Meses [9]  := 'Setembro';
   Meses [10] := 'Outubro';
   Meses [11] := 'Novembro';
   Meses [12] := 'Dezembro';
   DecodeDate (Data, Ano, Mes, Dia);
   NoDia := DayOfWeek (Data);
   Result := DiaDaSemana [NoDia] + ', ' + inttostr (Dia) + ' de ' + Meses [Mes]+ ' de ' + inttostr (Ano);
end;

Function UltDiaDoMes( Data: TDateTime ): Word;  // Retorna o Ultimo dia do mes de uma determinada data.
var
   d, m, a : Word;
   dt : TDateTime;
begin
   DecodeDate( Data, a, m, d );
   Inc( m );
   if m = 13 then
   begin
      m := 1;
   end;
   dt := EncodeDate( a, m, 1 );
   dt := dt - 1;
   DecodeDate( dt, a, m, d );
   Result := d;
end;

Function DateMais( Dat : TDateTime ; Numdias : Integer ) : TDateTime; { Soma um determinado número de dias à data atual }
begin
   Dat := Dat + Numdias;
   Result := Dat;
end;

Function DateMenos( Dat : TDateTime ; Numdias : Integer ) : TDateTime; { Subtrai um determinado número de dias à data atual }
begin
   Dat := Dat - Numdias;
   Result := Dat;
end;

Function NomedoMes( dData : TDateTime ) : String;
var
   d, m, a : Word;
   cM : String;
begin
   DecodeDate( dData, a, m, d );
   case m of
       1: cM := 'Janeiro';
       2: cM := 'Fevereiro';
       3: cM := 'Março';
       4: cM := 'Abril';
       5: cM := 'Maio';
       6: cM := 'Junho';
       7: cM := 'Julho';
       8: cM := 'Agosto';
       9: cM := 'Setembro';
      10: cM := 'Outubro';
      11: cM := 'Novembro';
      12: cM := 'Dezembro';
      Else cM := '';
   end;
   Result := cM;
End;

Procedure Formato_de_Data;
Begin
   If Not ( Pos( 'dd/MM/yyyy', ShortDateFormat ) > 0 ) Then
   Begin
      WinExec( 'RunDLL32.exe Shell32.DLL, Control_RunDLL intl.cpl', SW_Show );
      MessageDlg( 'O Formato de "Data" configurado não é correto'#13'' +
                  'para uso no Sistema.'#13''+
                  ''#13''+
                  'Formato atual: "'+ ShortDateFormat + '"'#13''+
                  ''#13''+
                  'Formato correto a ser utilizado: "dd/MM/aaaa".'#13''+
                  ''#13''+
                  'A Janlea exibida:'#13''+
                  '"Opções Regionais e de Idioma".'#13''+
                  'Deve ser utilizada para configuração do formato correto.'#13''+
                  'Favor clicar no Botão "Personalizar",'#13''+
                  'Logo após clicar na Guia "Data"'#13''+
                  'Alterar o formato em:'#13''+
                  '"Formato de Data Abreviada", para: "dd/MM/aaaa"'#13''+
                  'para ativar esta configuração.'#13'' +
                  'Depois clicar em "Aplicar" e depois "OK".'#13'' +
                  'E novamente clicar em "Aplicar" e depois "OK".'#13'' +
                  ''#13''+
                  'Logo após execute novamente o Sistema.'#13'',
                  mtInformation, [ mbOK ], 0 );
      Application.Terminate;
   End;
End;

Function AnoBixesto( Data: TDateTime ) : Boolean; {Testa se um ano é bixesto, retornando True em caso positivo}
Var
   Dia, Mes, Ano : Word;
Begin
   DecodeDate( Data, Ano, Mes, Dia );
   If Ano mod 4 <> 0 Then
   Begin
      Result := False;
   End
   Else
      If Ano mod 100 <> 0 Then
      Begin
         Result := True;
      End
      Else
         If Ano mod 400 <> 0 Then
         Begin
            Result := False;
         End
         Else
         Begin
            Result := True;
         End;
End;

Function DriveLetters: string; { Uso: S := tbDriveLetters; - retorna 'ACD' se existir as unidades: A:, C: e D: }
var
  Drives: LongWord;
  I: byte;
begin
  Result := '';
  Drives := GetLogicalDrives;
  if Drives <> 0 then
  for I := 65 to 90 do
  if ((Drives shl (31 - (I - 65))) shr 31) = 1 then
  Result := Result + Char(I);
end;

Function GetIP : string; //--> Declare a Winsock na clausula uses da unit
var
   WSAData : TWSAData;
   HostEnt : PHostEnt;
   Name :string;
begin
   WSAStartup(2, WSAData);
   SetLength(Name, 255);
   Gethostname(PChar(Name), 255);
   SetLength(Name, StrLen(PChar(Name)));
   HostEnt := gethostbyname(PChar(Name));
   with HostEnt^ do
      Result := Format( '%d.%d.%d.%d',
                        [Byte(h_addr^[0]),
                         Byte(h_addr^[1]),
                         Byte(h_addr^[2]),
                         Byte(h_addr^[3])] );
   WSACleanup;
end;

Function FBoolToStr( Check : Boolean ) : String; // Converte de Boolean para String
begin
   If Check then Result := 'T'
   Else          Result := 'F';
end;

Function FStrToBool( Valor : string ) : Boolean; // Converte de String para Boolean
begin
   Result := UpperCase( Trim( Valor ) ) = 'T'
end;

Function ControlaCampoTexto( cDado : String ) : String;
Begin
   If cDado = '' Then
      Result := 'NULL'
   Else
      If UpperCase( cDado ) = 'NULL' Then
         Result := ''
      Else
         Result := cDado;
End;

Function CampoInforme( cDado : String ) : String;
Begin
   If cDado = '' Then
      Result := 'NÃO INFORMADO';
End;

Function Iif( cDado, cCheck, cValor1, cValor2 : String ) : String;
Begin
   if cDado = cCheck then
      Result := cValor1
   else
      Result := cValor2;
End;

function AbreviaNome( Nome: String ): String;
var
   Nomes: array[1..20] of string;
   i, TotalNomes: Integer;
begin
   Nome := Trim(Nome);
   Result := Nome;
   Nome := Nome + #32;    {Insere um espaço para garantir que todas as letras sejam testadas}
   i := Pos(#32, Nome);   {Pega a posição do primeiro espaço}
   if i > 0 then
      begin
         TotalNomes := 0;
         while i > 0 do     {Separa todos os nomes}
            begin
               Inc(TotalNomes);
               Nomes[TotalNomes] := Copy(Nome, 1, i - 1);
               Delete(Nome, 1, i);
               i := Pos(#32, Nome);
            end;
      if TotalNomes > 2 then
         begin
            for i := 2 to TotalNomes - 1 do {Abreviar a partir do segundo nome, exceto o último.}
               begin
                  if Length(Nomes[i]) > 3 then {Contém mais de 3 letras? (ignorar de, da, das, do, dos, etc.)}
                     Nomes[i] := Nomes[i][1] + '.';{Pega apenas a primeira letra do nome e coloca um ponto após.}
               end;
            Result := '';
            for i := 1 to TotalNomes do
            Result := Result + Trim(Nomes[i]) + #32;
            Result := Trim(Result);
         end;
      end;
end;

Function FormataDATA( cDado : String ) : String;
Var
   i : Integer;
   cTemp : String;
   Dia, Mes, Ano : Word;
Begin
   cTemp := '';
   for i := 1 to Length( cDado ) do
   begin
       if Pos( Copy( cDado, i, 1 ), '/' ) = 0 then
       begin
          cTemp := cTemp + Copy( cDado, i, 1 );
       end;
   end;
   cDado := cTemp;
   DecodeDate ( Now , Ano, Mes, Dia );
   Case Length( cDado ) Of
    6 : Result := Copy( cDado, 1, 2 ) + '/' + Copy( cDado, 3, 2 ) + '/' + Copy( IntToStr( Ano ), 1, 2 ) + Copy( cDado, 5, 2 );
    8 : Result := Copy( cDado, 1, 2 ) + '/' + Copy( cDado, 3, 2 ) + '/' + Copy( cDado, 5, 4 );
   Else
      Begin
         ShowMessage( 'Favor informar a data'#13'No formato: DDMMAAAA'#13'Sem as barras.' );
         Result := '';
      End;
   End;
End;

Function FormataCEP( cDado : String ) : String;
Begin
   If Length( cDado ) = 8 Then Result := Copy( cDado, 1, 2 ) + '.' + Copy( cDado, 3, 3 ) + '-' + Copy( cDado, 6, 3 )
   Else                        Result := cDado;
End;

Function FormataFone( cDado : String ) : String;
Begin
   If Length( cDado ) = 8 Then Result := Copy( cDado, 1, 4 ) + '-' + Copy( cDado, 5, 4 )
   Else                        Result := cDado;
End;

Function FCPF( xCPF : String ) : Boolean; {Testa se o CPF é válido ou não}
Var
   d1, d4, xx, nCount, resto, digito1, digito2 : Integer;
   Check : String;
Begin
   d1 := 0; d4 := 0; xx := 1;
   for nCount := 1 to Length( xCPF ) - 2 do
   begin
       if Pos( Copy( xCPF, nCount, 1 ), '/-.' ) = 0 then
       begin
          d1 := d1 + ( 11 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
          d4 := d4 + ( 12 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
          xx := xx+1;
       end;
   end;
   resto := (d1 mod 11);
   if resto < 2 then
   begin
      digito1 := 0;
   end
   else
   begin
      digito1 := 11 - resto;
   end;
   d4 := d4 + 2 * digito1;
   resto := (d4 mod 11);
   if resto < 2 then
   begin
      digito2 := 0;
   end
   else
   begin
      digito2 := 11 - resto;
   end;
   Check := IntToStr( Digito1 ) + IntToStr( Digito2 );
   if Check <> copy( xCPF, succ( length( xCPF ) - 2 ), 2 ) then
   begin
      Result := False;
   end
   else
   begin
      Result := True;
   end;
end;

Function FCNPJ( xCNPJ : String ) : Boolean; {Testa se o CGC é válido ou não}
Var
   d1, d4, xx, nCount, fator, resto, digito1, digito2 : Integer;
   Check : String;
begin
   d1 := 0; d4 := 0; xx := 1;
   for nCount := 1 to Length( xCNPJ )-2 do
   begin
      if Pos( Copy( xCNPJ, nCount, 1 ), '/-.' ) = 0 then
      begin
         if xx < 5 then
         begin
            fator := 6 - xx;
         end
         else
         begin
            fator := 14 - xx;
         end;
          d1 := d1 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
         if xx < 6 then
         begin
            fator := 7 - xx;
         end
         else
         begin
            fator := 15 - xx;
         end;
         d4 := d4 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
         xx := xx+1;
      end;
   end;
   resto := ( d1 mod 11 );
   if resto < 2 then
   begin
      digito1 := 0;
   end
   else
   begin
      digito1 := 11 - resto;
   end;
   d4 := d4 + 2 * digito1;
   resto := ( d4 mod 11 );
   if resto < 2 then
   begin
      digito2 := 0;
   end
   else
   begin
      digito2 := 11 - resto;
   end;
   Check := IntToStr( Digito1 ) + IntToStr( Digito2 );
   if Check <> copy( xCNPJ, succ( length( xCNPJ ) - 2 ), 2 ) then
   begin
      Result := False;
   end
   else
   begin
      Result := True;
   end;
end;

Function FCPFCNPJ( xDado : String ) : String;
Var
   r : String;
Begin
   r := '';
   xDado := GetNumeros( xDado );
   If FCPF( xDado ) Then
   Begin
      r := Copy( xDado,  1, 3 ) + '.' +
           Copy( xDado,  4, 3 ) + '.' +
           Copy( xDado,  7, 3 ) + '-' +
           Copy( xDado, 10, 2 );
   End
   Else
   Begin
      If FCNPJ( xDado ) Then
      Begin
         r := Copy( xDado,  1, 2 ) + '.' +
              Copy( xDado,  3, 3 ) + '.' +
              Copy( xDado,  6, 3 ) + '/' +
              Copy( xDado,  9, 4 ) + '-' +
              Copy( xDado, 13, 2 );
      End
      Else
      Begin
         ShowMessage( 'O Número informado não é um CPF ou CNPJ' );
      End;
   End;
   Result := r;
End;

Function PreparaTexto( Texto : String ): String;
var
   I: integer;
   T: String;
begin
   T := '';
   // Substitui os caracteres acentuados por caracteres normais,
   // usando o BackSpace (#8) para simular acentuações. Por exemplo,
   // o caractere "ã" é trocado por "a" + BackSpace + "~". Como resultado,
   // o caractere "~" será impresso em cima do caractere "~".
   for I := 1 to Length(Texto) do
      Case Texto[I] of
         'á': T := T + 'a' + #8 + #39;
         'Á': T := T + 'A' + #8 + #39;
         'à': T := T + 'a' + #8 + '`';
         'À': T := T + 'A' + #8 + '`';
         'ã': T := T + 'a' + #8 + '~';
         'Ã': T := T + 'A' + #8 + '~';
         'â': T := T + 'a' + #8 + '^';
         'Â': T := T + 'A' + #8 + '^';
         'é': T := T + 'e' + #8 + #39;
         'É': T := T + 'E' + #8 + #39;
         'ê': T := T + 'e' + #8 + '^';
         'Ê': T := T + 'E' + #8 + '^';
         'í': T := T + 'i' + #8 + #39;
         'Í': T := T + 'I' + #8 + #39;
         'ó': T := T + 'o' + #8 + #39;
         'Ó': T := T + 'O' + #8 + #39;
         'õ': T := T + 'o' + #8 + '~';
         'Õ': T := T + 'O' + #8 + '~';
         'ô': T := T + 'o' + #8 + '^';
         'Ô': T := T + 'O' + #8 + '^';
         'ú': T := T + 'u' + #8 + #39;
         'Ú': T := T + 'U' + #8 + #39;
         'ç': T := T + 'c' + #8 + ',';
         'Ç': T := T + 'C' + #8 + ',';
         else
         T := T + Texto[I];
      end;
   Result := T;
end;

Function Numero_de_Linhas_em_um_Arquivo_TXT( Arqtexto : String ) : integer; // Retorna o número de linhas que um arquivo possui
Var
   f : Textfile;
   cont : integer;
Begin
//   linha := 0;   linha, 
   cont  := 0;
   AssignFile( f, Arqtexto );
   Reset( f );
   While not eof( f ) Do
   begin
      ReadLn( f );
      Cont := Cont + 1;
   end;
   Closefile( f );
   Result := cont;
end;

Function Centralizar( cDado : String ; nEspaco : Integer ) : String;
Var
   cEspacos : String;
   nMedia, i, nSobra : Integer;

Begin
   cEspacos := '';
   nMedia := Round( ( nEspaco - Length( cDado ) ) / 2 );
   nSobra := nEspaco - ( nMedia + Length( cDado ) ) - 1;
   For i := 1 to nMedia do
   Begin
      cEspacos := cEspacos + ' ';
   End;
   cDado := cEspacos + cDado + ' ';
   For i := 1 to nSobra do
   Begin
      cDado := cDado + ' ';
   End;
   Result := cDado;
End;

Function FormataEspaco( cDado : String ; nEspaco : Integer ) : String;
Var
   cEspacos : String;
   nFalta, i : Integer;
Begin
   cEspacos := '';
   nFalta := nEspaco - Length( cDado );
   For i := 1 to nFalta do
   Begin
      cEspacos := cEspacos + ' ';
   End;
   cDado := cEspacos + cDado;
   Result := cDado;
End;

Function extenso( valor : real ) : string;
var
   Texto, Milhar, Centena, Centavos, msg : string;
////////////////////////////////fucao auxiliar extenso////////////////////////////////
  function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
    begin
      if Expressao then Result := CasoVerdadeiro
      else              Result := CasoFalso;
  end;
////////////////////////////funcao auxiliar extenso/////////////////////////
  function MiniExtenso (trio: string): string;
    var
      Unidade, Dezena, Centena: string;
    begin
      Unidade := '';
      Dezena  := '';
      Centena := '';
      if (trio[2]='1') and (trio[3]<>'0') then
        begin
          Unidade := Dez[strtoint(trio[3])];
          Dezena  := '';
        end
      else
        begin
          if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
          if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
      end;
      if (trio[1]='1') and (Unidade='') and (Dezena='') then
        Centena := 'Cem'
      else
        if trio[1]<>'0' then Centena := Centenas[strtoint(trio[1])]
        else                 Centena := '';
      Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
      + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
  end;

begin
  if (valor>999999.99) or (valor<0) then
    begin
      msg :='O valor está fora do intervalo permitido.';
      msg := msg + ' O número deve ser maior ou igual a zero e menor que 999.999,99.';
      msg := msg + ' Se não for corrigido o número não será escrito por extenso.';
      showmessage(msg);
      Result:='';
      exit;
    end;
  if valor=0 then
    begin
      Result:='';
      Exit;
  end;
  Texto    := formatfloat('000000.00',valor);
  Milhar   := MiniExtenso(Copy(Texto,1,3));
  Centena  := MiniExtenso(Copy(Texto,4,3));
  Centavos := MiniExtenso('0'+Copy(Texto,8,2));
  Result   := Milhar;
  if Milhar <> '' then
    begin
      if copy(texto,4,3)='000' then Result := Result+' Mil Reais'
      else                          Result := Result+' Mil ';
  end;
  if (((copy(texto,4,2)='00') and (Milhar<>'') and (copy(texto,6,1)<>'0')))or (centavos='') and (milhar<>'')  then
    Result:=Result+' e ';
  if ( Milhar + Centena <> '' ) then Result := Result + Centena;
  if ( Milhar = '' ) and ( copy( texto, 4, 3 ) = '001' ) then Result := Result + ' Real'
  else
  if (copy(texto,4,3)<>'000') then
    Result:=Result+' Reais';
  if Centavos='' then
    begin
      Result := Result + '';
      Exit;
  end
  else
    begin
      if Milhar + Centena = '' then
        Result := Centavos
      else
        Result := Result + ' e ' + Centavos;
  end;
  if (copy(texto,8,2)='01') and (Centavos<>'') then Result := Result + ' Centavo'
  else                                              Result := Result + ' Centavos';
end;

end.
