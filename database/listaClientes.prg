Function Main()

    dbUseArea( .T., "DBFNTX", "CLIENTES", "CLI", .T. )
    
    CLI->(dbGoTop())
    while !CLI->(Eof())
          ? Alltrim(CLI->NOME) + " - " + CLI->CIDADE
          CLI->(dbSkip())
    enddo

    CLI->(dbCloseArea())

    qout("")
    qout("FIM")

return nil