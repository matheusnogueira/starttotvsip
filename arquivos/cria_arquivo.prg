#include "fileio.ch"

Function Main()

    local nHandle   := nil

    IF (nHandle := FCreate("arquivo_teste.txt", FC_NORMAL)) == -1
        ? "O arquivo não pode ser criado:", FError()
        BREAK
     ELSE
        FWrite(nHandle, "Gravacao da 1a. linha do arquivo" + chr(13))
        FWrite(nHandle, "Gravacao da 2a. linha do arquivo" + chr(13))
        FWrite(nHandle, "Gravacao da 3a. linha do arquivo" + chr(13))
        FWrite(nHandle, "Gravacao da 4a. linha do arquivo" + chr(13))
        FClose(nHandle)
     ENDIF

return nil

