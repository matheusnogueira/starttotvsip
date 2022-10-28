#include "protheus.ch"


USER FUNCTION STIP001()   
     	
	dbSelectArea("SZ1")
	dbSetOrder(1)	 
	 
	AxCadastro("SZ1", "Complemento de Credito Cliente", nil, nil)

Return Nil

          
User Function STIPVCRE(nValCredito)

	local lRet 		:= .T.
	local nLimite	:= Round(M->Z1_RENDA * 2, 2)

	if nValCredito > nLimite
		lRet := .F.
		msgStop("O limete de credito desse cliente não pode ser superior a: " + Alltrim(TRANSFORM(nLimite, "@R 99,999.99")))
	endif

Return lRet  


User Function STIPVALNAS(dDataNasc)  
	
	local lRet		:= .T.
	local nAnos		:= DateDiffYear(dDataNasc, Date())
                       
	if nAnos < 18
		lRet := .F.
		msgStop("O cliente deve ser maior de 18 anos e esse tem: " + Alltrim(Str(nAnos)))
	endif

Return lRet  
  



































