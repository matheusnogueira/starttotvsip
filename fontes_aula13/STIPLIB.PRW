#include "protheus.ch"

User Function MA030ROT()

	local aRotina	:= {}
                     
	aAdd(aRotina,{"Importar",	"u_STIPIMPOR"	, 0 , 3,0 ,NIL})

Return aRotina

             

User Function STIPIMPOR()    
	           
	local nHandle	:= 0
	local nLast		:= 0
	local nRecno	:= 0
	local cLine		:= ""
	
	// Abre o arquivo
	local nHandle := FT_FUse("C:\StartTOTVSIP\Fontes\clientes.txt")
	// Se houver erro de abertura abandona processamento
	if nHandle = -1 
		Alert("Falha na abertura do arquivo")
   		return
	endif
	// Posiciona na primeira linha
	FT_FGoTop()
	// Retorna o número de linhas do arquivo
	nLast := FT_FLastRec()
	
	While !FT_FEOF()
		cLine  := FT_FReadLn()
		// Retorna a linha corrente
		nRecno := FT_FRecno()
		// Retorna o recno da linha
		MsgAlert( "Linha: " + cLine + " - Recno: " + StrZero(nRecno,3) )
		// Pula para próxima linha
		FT_FSKIP()
	End
	// Fecha o arquivo
	FT_FUSE()
	
Return 