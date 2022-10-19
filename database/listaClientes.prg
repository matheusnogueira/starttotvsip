Function Main()

    dbUseArea( .T., "DBFNTX", "CLIENTES", "CLI", .T. )
    
    CLI->(dbGoTo(3))
    Qout(Alltrim(CLI->NOME))
    CLI->(dbSkip(-1))
    Qout(Alltrim(CLI->NOME))

    CLI->(dbGoTop())
    while !CLI->(Eof())
          ? Alltrim(CLI->NOME) + " - " + CLI->CIDADE
          CLI->(dbSkip())
    enddo

    CLI->(dbCloseArea())

    qout("")
    qout("FIM")

return nil