#include "fileio.ch"

Function Main()

    local nHandle   := criaArquivo("arquivo_aleatorio.txt")
    local nI        := 0

    if nHandle > 0
        for nI := 1 to 1000
            FWrite(nHandle, linhaAleatoria(50) + chr(13))
        next nI
        FClose(nHandle)
    endif

return nil


static function linhaAleatoria(nTamanho)

    local cLinha := ""
    local nRand  := 0
    local nI     := 0

    if nTamanho = nil
        nTamanho := 100
    endif

    for nI := 1 to nTamanho
        nRand := RANDOM()%78 +48
        cLinha += chr(nRand)
        // cLinha += str(nRand)
    next nI

return cLinha


static function criaArquivo(cNomeArquivo)

    local nHandle   := 0

    IF (nHandle := FCreate(cNomeArquivo, FC_NORMAL)) == -1
        ? "O arquivo não pode ser criado:", FError()
    ENDIF

return nHandle