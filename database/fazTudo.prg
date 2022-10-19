
Function Main()

      local aDBStruct := {}

      SET DATE TO BRITISH

      FErase("CLIENTES.DBF")
      FErase("CLI00001.NTX")
      FErase("CLI00002.NTX")

      CriaDBClientes()
      PopulaDBClientes()
      ListaDBClientes()

Return nil


Static Function ListaDBClientes()

      local cBusca := ""

      dbUseArea( .T., "DBFNTX", "CLIENTES", "CLI", .T. )
      CLI->(dbSetIndex( "CLI00001" ))
      CLI->(dbSetIndex( "CLI00002" ))
      
      qOut("CLIENTES_X_NOME")      
      CLI->(dbGoTop())
      while !CLI->(Eof())
            ImprimeCliente()
            CLI->(dbSkip())
      enddo
      qOut("")

      qOut("CLIENTES_X_CIDADE")
      CLI->(dbSetOrder( 2 ))
      CLI->(dbGoTop())
      while !CLI->(Eof())
            ImprimeCliente()
            CLI->(dbSkip())
      enddo
      qOut("")


      qOut("CIDADE MOGI GUACU")
      CLI->(dbSetOrder( 2 ))
      CLI->(dbGoTop())
      cBusca := "MOGI GUACU"
      if CLI->(dbSeek(cBusca))
            while CLI->CIDADE = cBusca
                  ImprimeCliente()
                  CLI->(dbSkip())
            enddo
      else
            qOut("Não encontrado")
      endif
      
      qOut("")


      CLI->(dbCloseArea())

return nil


Static Function ImprimeCliente()
      ? "*************************************************"
      ? "Nome........: " + CLI->NOME
      ? "Cidade......: " + CLI->CIDADE
      ? "Estado......: " + CLI->ESTADO
      ? "Email.......: " + CLI->EMAIL
      ? "Telefone....: " + CLI->TELEFONE
      ? "Nascimento..: " + DtoC(CLI->NASCIMENTO)
      ? "Credito.....: " + Transform(CLI->CREDITO, "999,999.99")
      ? ""
return nil


Static Function PopulaDBClientes()

      dbUseArea( .T., "DBFNTX", "CLIENTES", "CLI", .T. )
      CLI->(dbSetIndex( "CLI00001" ))
      CLI->(dbSetIndex( "CLI00002" ))
      
      CLI->(dbAppend())
            REPLACE NOME            WITH "MATHEUS NOGUEIRA"
            REPLACE CIDADE          WITH "CAMPINAS"
            REPLACE ESTADO          WITH "SP"
            REPLACE EMAIL           WITH "matheus.nogueira@totvs.com.br"
            REPLACE TELEFONE        WITH "(19) 99294.2697"
            REPLACE NASCIMENTO      WITH CTOD("07/04/1976")
            REPLACE CREDITO         WITH 1000.00
      CLI->(dbCommit())

      CLI->(dbAppend())
            CLI->NOME         := "LETICIA NOGUEIRA"
            CLI->CIDADE       := "MOGI MIRIM"
            CLI->ESTADO       := "SP"
            CLI->EMAIL        := "leticia.nogueira@gmail.com"
            CLI->TELEFONE     := "(19) 99294.2698"
            CLI->NASCIMENTO   := CTOD("30/06/2008")
            CLI->CREDITO      := 1500.00
      CLI->(dbCommit())
      
      CLI->(dbAppend())
            CLI->NOME         := "GABRIEL NOGUEIRA"
            CLI->CIDADE       := "MOGI GUACU"
            CLI->ESTADO       := "SP"
            CLI->EMAIL        := "gabriel.nogueira@gmail.com"
            CLI->TELEFONE     := "(19) 99294.2699"
            CLI->NASCIMENTO   := CTOD("11/07/2012")
            CLI->CREDITO      := 2000.00
      CLI->(dbCommit())

      CLI->(dbAppend())
            CLI->NOME         := "ISMAEL"
            CLI->CIDADE       := "MOGI GUACU"
            CLI->ESTADO       := "SP"
            CLI->EMAIL        := "isamel@gmail.com"
            CLI->TELEFONE     := "(19) 99294.2600"
            CLI->NASCIMENTO   := CTOD("11/03/2012")
            CLI->CREDITO      := 2000.00
      CLI->(dbCommit())      

      CLI->(dbCloseArea())      

return nil


static function CriaDBClientes()

      local aDBStruct := {}

      aAdd(aDBStruct, {"NOME",        "C",  100, 0})
      aAdd(aDBStruct, {"CIDADE",      "C",  050, 0})
      aAdd(aDBStruct, {"ESTADO",      "C",  002, 0})
      aAdd(aDBStruct, {"EMAIL",       "C",  100, 0})
      aAdd(aDBStruct, {"TELEFONE",    "C",  020, 0})
      aAdd(aDBStruct, {"NASCIMENTO",  "D",  008, 0})
      aAdd(aDBStruct, {"CREDITO",     "N",  015, 2})

      DBCreate( "CLIENTES.DBF", aDBStruct )

      dbUseArea( .T., "DBFNTX", "CLIENTES", "CLI", .T. )
      CLI->(dbCreateIndex( "CLI00001", "NOME", { || CLI->NOME }))
      CLI->(dbCreateIndex( "CLI00002", "CIDADE", { || CLI->CIDADE }))
      CLI->(dbCloseArea())

return nil