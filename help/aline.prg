Function Main()

    local cSexo   := ""
    Local nAlt := 0
    local aAltM  := {}
    local aAltF  := {}
    local nCont  := 0
    local nContM := 0
    local nCOntF := 0
    Local nSoma := 0
    local nMediaF := 0
    local nMediaM := 0
    local nI       := 0

    while nCont <= 2
        ACCEPT "Digite seu genero (M / F) : " to cSexo
        cSexo := UPPER(cSexo)
            if cSexo = "M"
                ACCEPT "Digite sua altura: " to nAlt
                nAlt := val(nAlt)                
                aAdd(aAltM, nAlt)
                nContM++
            else
                ACCEPT "Digite sua altura: " to nAlt
                nAlt := val(nAlt)
                aAdd(aAltF, nAlt)
                nContF++
            endif
        nCont++
    enddo

    nSoma := 0
    For nI := 1 to len(aAltM)
        nSoma += aAltM[nI]
    Next
    nMediaM := nSoma / nContM

    nSoma := 0
    For nI := 1 to len(aAltF)
        nSoma += aAltF[nI]
    Next
    nMediaF := nSoma / nContF

    QOUT("O total de homens é: ", alltrim(str(nContM)) , " e o total de mulhere é: " , alltrim(str(nContF)))
    QOUT("A média de altura dos homens do grupo é: " , nMediaM)
    QOUT("A média de altura das mulheres do grupo é: " , nMediaF)
       
RETURN nil

    
    
