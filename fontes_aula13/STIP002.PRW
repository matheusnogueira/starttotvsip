#include "protheus.ch"

USER FUNCTION STIP002()

LOCAL cFiltro   := ""
LOCAL aCores  := {{ 'SZ1->Z1_CREDITO > SZ1->Z1_RENDA' , 'ENABLE'  },;   // Credito OK
                  { 'SZ1->Z1_CREDITO < 50' , 'DISABLE' }}    			// Credito baixo

PRIVATE cCadastro := "Complemento de Credito"
PRIVATE aRotina     := {{"Pesquisar",	"AxPesqui"   	   	, 0, 1 },;
						{"Visualizar",	"AxVisual"   		, 0, 2 },;
						{"Incluir",		"AxInclui"  	 	, 0, 3 },;
						{"Alterar",		"AxAltera"   		, 0, 4 },;
						{"Excluir",		"AxDeleta"     		, 0, 5 },;
						{"Consultar",	"U_STIPXPTO"   		, 0, 8 },;      
						{"Relatorio 1",	"U_STIP01IMP"  		, 0, 8 },; 	 
						{"Relatorio 2",	"U_STIP02IMP"  		, 0, 8 },; 
						{"Relatorio 3",	"U_STIPTMSPrinter" 	, 0, 8 },;			
						{"Legenda",		"U_STIPLEG"			, 0, 8, 0, .F. }}       //"Legenda"

dbSelectArea('SZ1')
dbSetOrder(1)

mBrowse( ,,,,'SZ1',,,,,,aCores,,,,,,,,cFiltro)   
//mBrowse( ,,,,'SZ1',,,,,,,,,,,,,,cFiltro)

RETURN NIL
                 
                 

User Function STIPXPTO(cMensagem)

	default cMensagem := "XPTO Nada"

	Alert(cMensagem)

Return .T.    


User Function STIPLEG(cMensagem)

	default cMensagem := "STIPLEG Legenda"

	Alert(cMensagem)

Return .T.  



User Function STIP01IMP()
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Define variaveis padroes para todos os relatorios...                     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
LOCAL nFor
LOCAL nFor2
LOCAL cDado
LOCAL uDado
LOCAL cPerg       	:= "" // Pergunta padrao (SX1) dos parametros
PRIVATE nQtdLin     := 58       // Qtd de Linhas Por Pagina
PRIVATE nLimite     := 132       // Limite de Colunas
PRIVATE cTamanho    := "M"       // P=Pequeno;M=Medio;G=Grande -> P=80;M=132;G=220 (colunas)
PRIVATE cTitulo     := "Titulo do Relatorio 1" // Titulo do Relatorio
PRIVATE cDesc1      := "Descricao do Relatorio 1" // Descritivo para o usuario
PRIVATE cDesc2      := "" // Descritivo para o usuario
PRIVATE cDesc3      := ""
PRIVATE cAlias      := "SZ1" // Alias
PRIVATE cRel        := "IMPCRIGEN" // Nome do Relatorio
PRIVATE nli         := 01   // Variavel padrao para controlar numero de linha
PRIVATE nQtdini     := nli  // Variavel para controlar numero de linha inicial
PRIVATE m_pag       := 1    // Variavel padrao para contar numero da pagina
PRIVATE lCompres    := .F. // nao mude e padrao
PRIVATE lDicion     := .F. // nao mude e padrao
PRIVATE lFiltro     := .F. // Habilitar o filtro ou nao
PRIVATE lCrystal    := .F. // nao mudar controle do crystal reports
PRIVATE aReturn     := { "", 1,"", 1, 1, 1, "",1 } // padrao nao mude
PRIVATE lAbortPrint := .F. // Controle para abortar (sempre como esta aqui)
PRIVATE cCabec1     := "" // Primeira linha do cabecalho ;
PRIVATE cCabec2     := "" // utilizado pela funcao cabec...
PRIVATE nColuna     := 03 // Numero da coluna que sera impresso as colunas

//cRel  := SetPrint(cAlias,cRel,cPerg,@cTitulo,"","","",,{},,cTamanho,{},lFiltro,lCrystal)  
cRel	:= SetPrint(cAlias,cRel,"",@cTitulo,cDesc1,cDesc2,cDesc3, .F., {}, .F., cTamanho, , .F.)   

SetDefault(aReturn,cAlias)

@ ++nLi, nColuna pSay "**** "+cTitulo+" ****"

@ ++nLi, nColuna pSay Replicate("*",nLimite-nColuna)
@ ++nLi, nColuna pSay "LINHA DE CABECALHO DO RELATORIO"
@ ++nLi, nColuna pSay Replicate("*",nLimite-nColuna)

For nFor := 1 To 10
	@ ++nLi, 10 pSay "DADO 1"
	@ nLi, 50   pSay "DADO 2"
Next

@ ++nLi, nColuna pSay Replicate("*",nLimite-nColuna)
@ ++nLi, nColuna pSay StrZero(nFor,2)+" Registro(s) Listado(s)"
@ ++nLi, nColuna pSay Replicate("*",nLimite-nColuna)


Set Printer To
Ourspool(cRel)

Return

                       

User Function STIP02IMP()
 
	PRIVATE nQtdLin     := 58       // Qtd de Linhas Por Pagina
	PRIVATE nLimite     := 132       // Limite de Colunas
	PRIVATE cTamanho    := "M"       // P=Pequeno;M=Medio;G=Grande -> P=80;M=132;G=220 (colunas)
	PRIVATE cTitulo     := "Titulo do Relatorio 2" // Titulo do Relatorio
	PRIVATE cDesc1      := "Descricao do Relatorio 2" // Descritivo para o usuario
	PRIVATE cDesc2      := "" // Descritivo para o usuario
	PRIVATE cDesc3      := ""
	PRIVATE cAlias      := "SZ1" // Alias
	PRIVATE cRel        := "IMPCOMCRE" // Nome do Relatorio
	PRIVATE cPerg 	   	:= "X_zTeste"
	PRIVATE nli         := 01   // Variavel padrao para controlar numero de linha
	PRIVATE nQtdini     := nli  // Variavel para controlar numero de linha inicial
	PRIVATE m_pag       := 1    // Variavel padrao para contar numero da pagina
	PRIVATE lCompres    := .F. // nao mude e padrao
	PRIVATE lDicion     := .F. // nao mude e padrao
	PRIVATE lFiltro     := .F. // Habilitar o filtro ou nao
	PRIVATE lCrystal    := .F. // nao mudar controle do crystal reports
	PRIVATE aReturn     := { "", 1,"", 1, 1, 1, "",1 } // padrao nao mude
	PRIVATE lAbortPrint := .F. // Controle para abortar (sempre como esta aqui)
	PRIVATE cCabec1     := "    PREFIXO TITULO      PARC.  TIP  EMISSAO   VENCTO      VENCTO REAL VLR. ORIGINAL       PAGO                SALDO "  // Primeira linha do cabecalho ;
	PRIVATE cCabec2     := "" // utilizado pela funcao cabec...
	PRIVATE nColuna     := 03 // Numero da coluna que sera impresso as colunas  
	PRIVATE aOrd		:= {}
 
    /*
    Parâmetros do aReturn
    aReturn - Preenchido pelo SetPrint()
    aReturn[1] - Reservado para formulário
    aReturn[2] - Reservado para numero de vias
    aReturn[3] - Destinatário
    aReturn[4] - Formato 1=Paisagem 2=Retrato
    aReturn[5] - Mídia 1-Disco 2=Impressora
    aReturn[6] – Porta ou arquivo 1-Lpt1... 4-Com1...
    aReturn[7] - Expressão do filtro
    aReturn[8] - Ordem a ser selecionada
    aReturn[9] [10] [n] - Campos a processar se houver
    */
 
    //Ordens do relatório
    aAdd( aOrd, "Cliente" )
 
    //Cria as perguntas do relatório e chama para a memória
    fCriaSX1()
    Pergunte(cPerg,.F.)
 
    //Mostra a tela de configuração do relatório 
    cRel := SetPrint(cAlias, cRel, cPerg, @cTitulo, cDesc1, cDesc2, cDesc3, .F., aOrd, .F., cTamanho, , .F.)
 
    //Estabelece os padrões para impressão, conforme escolha do usuário
    SetDefault(aReturn,cAlias)
 
    //Chama função que processa os dados
    RptStatus( { || fImpRel() }, cTitulo, "Processando e imprimindo dados, aguarde...", .T. )
Return
 
/*---------------------------------------------------------------------*
| Func:  fImpRel                                                      |
| Desc:  Função para impressão do relatório                           |
*---------------------------------------------------------------------*/
 
Static Function fImpRel()   

    Local cIndice   := ""
    Local cFiltro   := ""
    cTitulo += aOrd[aReturn[8]]
    cFiltro := "Z1_FILIAL == '"+xFilial("SZ1")+"' "
    cFiltro += ".And. Z1_CLIENTE >= '"+mv_par01+"' "
    cFiltro += ".And. Z1_CLIENTE <= '"+mv_par02+"' "
 
    //Ordenação por Cliente
    If aReturn[8] == 1
        cIndice := "Z1_CLIENTE+Z1_LOJACLI"
    Endif
 
    dbSelectArea("SZ1")
    dbSetOrder(1)
    SetRegua(SZ1->(RecCount()))   
 
    //Enquanto houver dados 
    SZ1->(dbGoTop())
    nli := nQtdLin + 10
    While !SZ1->(Eof()) .And. !lAbortPrint
        //Se atingir 55 linhas, imprime cabeçalho
        If nli > nQtdLin
            Cabec(cTitulo,cCabec1,cCabec2,cRel,cTamanho)
            nli := Prow()+1
        Endif
        
        @ nli, 5 PSAY "Matheus"
        nli ++
 
        //Imprime dados do Cliente
        @ nli, 5 PSay "Cod/Loj/Nome: " + SZ1->Z1_CLIENTE + "-" + SZ1->Z1_LOJACLI + " " + Str(SZ1->Z1_CREDITO)
        nli ++
        

		@ nli, 5 PSay SZ1->Z1_CLIENTE
		@ nli, 15 PSay SZ1->Z1_LOJACLI   
		//NOME DO CLIENTE
		@ nli, 50 PSay SZ1->Z1_RENDA PICTURE "@E 99,999,999,999.99"
		@ nli, 70 PSay SZ1->Z1_CREDITO PICTURE "@E 99,999,999,999.99"
		nli ++
 		SZ1->(dbSkip())
 		IncRegua()  
 		
 		//Se o usuário cancelou, finaliza
	    If lAbortPrint
	        @ nli, 5 PSay cCancel
	        Return
	    Endif
    EndDo
 

 
    //Imprime o total geral
    //@ nli, 000 PSay Replicate("=",nLimite)
    //nli ++
    //@ nli, 5 PSay "TOTAL GERAL....."
    //@ nli, 50 PSay 0 PICTURE "@E 99,999,999,999.99"
    //@ nli, 70 PSay 0 PICTURE "@E 99,999,999,999.99"
 
    //Se não atingiu o limite, imprime o rodapé
   // If nli <> 80
   //     Roda(cbCont,cbTxt,cTamanho)
   // Endif
 
    //Mostra o relatório
    Set Printer TO
    OurSpool(cRel)     
    
Return


// https://tdn.totvs.com/display/tec/TMSPrinter
USER FUNCTION STIPTMSPrinter()   

    private cAcesso := Repl(" ",10)
     
    DEFINE DIALOG oMainWnd TITLE "Exemplo TMSPrinter" FROM 180,180 TO 550,700 PIXEL 
        // Monta objeto para impressão 
        oPrint := TMSPrinter():New("Exemplo TMSPrinter") 
        oPrint:SetPortrait() 
        oPrint:Setup()    
        oPrint:StartPage()                 
        oFont1 := TFont():New('Courier new',,-18,.T.) 
        oPrint:Say( 10,10,"Texto para visualização",oFont1,1400,CLR_HRED ) 
        oPrint:SayBitmap( 100,200,"C:\Dir\Totvs.bmp",400,400 )
        oPrint:Line( 130,10,130,900 )
        oPrint:Box( 130,10,600,900 )   
        oBrush1 := TBrush():New( , CLR_YELLOW ) 
        oPrint:FillRect( {100, 10, 200, 200}, oBrush1 ) 
        oBrush1:End()
        // Visualiza a impressão 
        oPrint:EndPage()      
        oPrint:Preview() 
    ACTIVATE DIALOG oMainWnd CENTERED
RETURN              



/*---------------------------------------------------------------------*
| Func:  fCriaSX1                                                     |
| Desc:  Função para criar o grupo de perguntas                       |
*---------------------------------------------------------------------*/
 
Static Function fCriaSx1()
    Local aP := {}
    Local i := 0
    Local cSeq
    Local cMvCh
    Local cMvPar
    Local aHelp := {}
     
    //Adiciona os parâmetros
    aAdd(aP,{"Cliente de","C",6,0,"G","","SZ1","" ,"" ,"","",""})
    aAdd(aP,{"Cliente ate","C",6,0,"G","(mv_par02>=mv_par01)","SZ1","" ,"" ,"","",""})

    aAdd(aHelp,{"Informe o código do cliente.","inicial."})
    aAdd(aHelp,{"Informe o código do cliente.","final."})
     
    //Percorre, recriando
    For i:=1 To Len(aP)
        cSeq := StrZero(i,2,0)
        cMvPar := "mv_par"+cSeq
        cMvCh := "mv_ch"+IIF(i<=9,Chr(i+48),Chr(i+87))
        PutSx1(cPerg,;
        cSeq,;
        aP[i,1],aP[i,1],aP[i,1],;
        cMvCh,;
        aP[i,2],;
        aP[i,3],;
        aP[i,4],;
        0,;
        aP[i,5],;
        aP[i,6],;
        aP[i,7],;
        "",;
        "",;
        cMvPar,;
        aP[i,8],aP[i,8],aP[i,8],;
        "",;
        aP[i,9],aP[i,9],aP[i,9],;
        aP[i,10],aP[i,10],aP[i,10],;
        aP[i,11],aP[i,11],aP[i,11],;
        aP[i,12],aP[i,12],aP[i,12],;
        aHelp[i],;
        {},;
        {},;
        "")
    Next i
Return