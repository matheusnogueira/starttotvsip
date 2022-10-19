#include "fileio.ch"

Function Main()

    local nHandle   := nil
    local cBuffer   := ""
    local nLength   := 0
    local cString   := ""

    nHandle := FOpen("arquivo_teste.txt", FC_NORMAL)
    nLength := FSEEK(nHandle, 0, FS_END)
    FSEEK(nHandle, 0)

    if nHandle < 0
        qOut("Erro: ", nHandle)
    endif

    FRead(nHandle, @cBuffer, 132) 

    // FSEEK(nHandle, 0)
    // cString := FReadStr( nHandle, 132 )
    // qout(cString)

    FSEEK(nHandle, 0)
    cString := FReadStr( nHandle, 32 )
    qout(cString)
    cString := FReadStr( nHandle, 33 )
    qout(cString)  
    cString := FReadStr( nHandle, 33 )
    qout(cString)  
    cString := FReadStr( nHandle, 33 )
    qout(cString)          

    // qout(cBuffer)
    qout("FIM")
    qout(nLength)

return nil