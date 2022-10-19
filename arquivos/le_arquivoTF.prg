#include "hbnf"

Function Main

    local nLast, cLine, nRecno
    local nHandle := FT_FUse("arquivo_teste.txt")
  // Se houver erro de abertura abandona processamento
  if nHandle = -1
    return nil
  endif
  // Posiciona na primeria linha
  FT_FGoTop()
  // Retorna o número de linhas do arquivo
  nLast := FT_FLastRec()
  MsgAlert( nLast )
  While !FT_FEOF()
    cLine  := FT_FReadLn()
    // Retorna a linha corrente
    nRecno := FT_FRecno()
    // Retorna o recno da Linha
    MsgAlert( "Linha: " + cLine + " - Recno: " + StrZero(nRecno,3) )
    // Pula para próxima linha
    FT_FSKIP()
  End
  // Fecha o Arquivo
  FT_FUSE()

return nil