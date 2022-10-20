#include "fileio.ch"

Function Main()

    local nHndlRead := nil
    local nHndlWrit := nil
    local cBuffer   := " "
    local nI        := 0
    local cLinha    := ""
    local aLinhas   := {}

    nHndlRead := FOpen("arquivo_teste.txt", FC_NORMAL)
    nHndlWrit := FCreate("arquivo_teste_alterado.txt", FC_NORMAL)
    
    if nHndlRead < 0
        qOut("Erro: ", nHndlRead)
    endif

    while len(cBuffer) > 0
        cBuffer := FReadStr( nHndlRead, 1 )
        cLinha += cBuffer
        if Asc(cBuffer) == 13
            aAdd(aLinhas, cLinha)
            cLinha := ""
        endif
    enddo

    for nI := 1 to len(aLinhas)
        qOut(aLinhas[nI])
        FWrite(nHndlWrit, Upper(aLinhas[nI]))
    next nI

    fClose(nHndlRead)
    FClose(nHndlWrit)

    qout()
    qout("FIM")

return nil