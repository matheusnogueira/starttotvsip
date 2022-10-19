SET PROCEDURE TO classeAluno.Prg

REQUEST HB_GT_WIN_DEFAULT

Function Main()

    local oAluno    := nil
    local aExemplo  := {"A", "B", "C", "D"}
    local aAlunos   := {}
    local nI        := 0

    oAluno := Aluno():New("Adeilton", 3, 5, 7, 10)
    aAdd(aAlunos, oAluno)

    oAluno := Aluno():New("Edison", 5, 7, 8, 9)
    oAluno:LerDados()
    aAdd(aAlunos, oAluno)
    Qout()

    oAluno := Aluno():New("Fabricio", 5, 8, 9, 5)
    oAluno:LerDados()
    aAdd(aAlunos, oAluno)
    Qout()
    
    Qout()
    for nI := 1 to len(aAlunos)
        oAluno := aAlunos[nI]
        oAluno:PrintAll()
    next nI

return nil