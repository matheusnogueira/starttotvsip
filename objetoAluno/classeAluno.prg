#include "/usr/local/include/harbour/hbclass.ch"
// #include "C:\StartTOTVSIP\HMG.3.5\HARBOUR\include\hbclass.ch"
// #include "hbclass.ch"

Class Aluno

	Data cNome  	    as String
    Data nNota1     	as Numeric
    Data nNota2     	as Numeric
    Data nNota3     	as Numeric
    Data nNota4     	as Numeric
 
	Method New() Constructor
    Method LerDados()
    Method CalcMedia()
    Method PrintAll(nOpc)
	
EndClass

Method New(cNome, nNota1, nNota2, nNota3, nNota4) Class Aluno

    if cNome = nil
        cNome := ""
    endif

    if nNota1 = nil
        nNota1 := 0
    endif  
    
    if nNota2 = nil
        nNota2 := 0
    endif 
    
    if nNota3 = nil
        nNota3 := 0
    endif 
    
    if nNota4 = nil
        nNota4 := 0
    endif     


    self:cNome      := cNome
    self:nNota1     := nNota1
    self:nNota2     := nNota2
    self:nNota3     := nNota3
    self:nNota4     := nNota4

Return self


Method LerDados() Class Aluno
    
    ACCEPT "Nome.........:" to ::cNome
    INPUT "Nota1........:" to ::nNota1
    INPUT "Nota2........:" to ::nNota2
    INPUT "Nota3........:" to ::nNota3
    INPUT "Nota4........:" to ::nNota4

return nil


Method CalcMedia() Class Aluno

    local nMedia := (::nNota1 + ::nNota2 + ::nNota3 + ::nNota4) / 4

return nMedia


Method PrintAll(nOpc as Numeric) Class Aluno

    qOut("Nome do Aluno......:", ::cNome)
    qOut("Nota 1o. Bimestre..:", Transform(::nNota1, "99.99"))
    qOut("Nota 2o. Bimestre..:", Transform(::nNota2, "99.99"))
    qOut("Nota 3o. Bimestre..:", Transform(::nNota3, "99.99"))
    qOut("Nota 4o. Bimestre..:", Transform(::nNota4, "99.99"))
    qOut("Media..............:", Transform(::CalcMedia(), "99.99"))
		 		
return Nil