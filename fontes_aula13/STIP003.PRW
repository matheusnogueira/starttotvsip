#include "protheus.ch"

USER FUNCTION STIP003()

LOCAL cFiltro   := ""

PRIVATE cCadastro := "Complemento de Credito"
PRIVATE aRotina     := {{"Pesquisar",	"AxPesqui"   	   	, 0, 1 },;
						{"Visualizar",	"AxVisual"   		, 0, 2 },;
						{"Incluir",		"AxInclui"  	 	, 0, 3 },;
						{"Alterar",		"AxAltera"   		, 0, 4 },;
						{"Excluir",		"AxDeleta"     		, 0, 5 }} 
dbSelectArea('SZ2')
dbSetOrder(1)

mBrowse( ,,,,'SZ2',,,,,,,,,,,,,,cFiltro)

RETURN NIL
                 
                 
