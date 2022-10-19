#include "fileio.ch"

function main()

ft_FUse( "test.txt" )
DO WHILE ! ft_FEof()
   ? ft_FReadLn()
   ft_FSkip()
ENDDO


return nil