function main()

    local aDBStruct := {}

    aAdd(aDBStruct, {"NOME",        "C",  100, 0})
    aAdd(aDBStruct, {"CIDADE",      "C",  050, 0})
    aAdd(aDBStruct, {"ESTADO",      "C",  002, 0})
    aAdd(aDBStruct, {"EMAIL",       "C",  100, 0})
    aAdd(aDBStruct, {"TELEFONE",    "C",  020, 0})
    aAdd(aDBStruct, {"NASCIMENTO",  "D",  008, 0})
    aAdd(aDBStruct, {"CREDITO",     "N",  015, 2})
    aAdd(aDBStruct, {"OBSERVACOES", "M",  015, 2})

    DBCreate( "CLIENTES.DBF", aDBStruct )

return nil