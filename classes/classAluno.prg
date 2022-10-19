#include "/usr/local/include/harbour/hbclass.ch"
// #include "hbclass.ch"

****************************************************************************************************************************************************
&& Classe Aluno
****************************************************************************************************************************************************
Class Aluno

	Data cNome  	    as String
    Data nNota1     	as Numeric
    Data nNota2     	as Numeric
    Data nNota3     	as Numeric
    Data nNota4     	as Numeric
 
	Method New() Constructor
    Method CalcMedia()
    Method PrintAll(nOpc)
	
EndClass

****************************************************************************************************************************************************
Method New(cNome, nNota1, nNota2, nNota3, nNota4) Class Aluno

    if cNome = Nil
        cNome := "Matheus Nogueira"
    endif

    if nNota1 = Nil
        nNota1 := 8
    endif
    
    if nNota2 = Nil
        nNota2 := 7
    endif
    
    if nNota3 = Nil
        nNota3 := 10
    endif
    
    if nNota4 = Nil
        nNota4 := 9
    endif    

	::cNome		    := cNome
    ::nNota1     	:= nNota1
    ::nNota2     	:= nNota2
    ::nNota3     	:= nNota3
    ::nNota4     	:= nNota4
		 		
Return Self

****************************************************************************************************************************************************
Method CalcMedia() Class Aluno

    local nMedia := (::nNota1 + ::nNota2 + ::nNota3 + ::nNota4) / 4
		 		
Return nMedia

****************************************************************************************************************************************************
Method PrintAll(nOpc as Numeric) Class Aluno

    if nOpc = Nil
        nOpc := 1
    endif

    if nOpc = 1
        qOut(::cNome)
        qOut(::nNota1)
        qOut(::nNota2)
        qOut(::nNota3)
        qOut(::nNota4)
        qOut(::CalcMedia())
    else
        qOut("Nome do Aluno......:", ::cNome)
        qOut("Nota 1o. Bimestre..:", Transform(::nNota1, "99.99"))
        qOut("Nota 2o. Bimestre..:", Transform(::nNota2, "99.99"))
        qOut("Nota 3o. Bimestre..:", Transform(::nNota3, "99.99"))
        qOut("Nota 4o. Bimestre..:", Transform(::nNota4, "99.99"))
        qOut("Media..............:", Transform(::CalcMedia(), "99.99"))
    endif
		 		
return Nil