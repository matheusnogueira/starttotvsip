#include "fileio.ch"

function Main()

    local nHandleArq1   := 0
    local nHandleArq2   := 0

    nHandleArq1 := FCreate("Arquivo_01.txt", FC_NORMAL)
    nHandleArq2 := FCreate("Arquivo_02.txt", FC_NORMAL)

        FWrite(nHandleArq1, "Conteúdo do arquivo 1")
        FWrite(nHandleArq2, "Conteúdo do arquivo 2")

    FClose(nHandleArq1)
    FClose(nHandleArq2)

return nil