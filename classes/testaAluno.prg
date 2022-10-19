SET PROCEDURE TO classAluno.prg

Function Main()

    local aAlunos   as Array   := {}
    local oAluno    as Object  := Nil
    local nI        as Numeric := 0

    Qout()
    Qout("Classe Aluno")
    Qout()

    oAluno := Aluno():New("Matheus Nogueira", 7, 6, 10, 9)
    aAdd(aAlunos, oAluno)
    oAluno := Aluno():New("Leticia Nogueira", 9, 8, 9, 10)
    aAdd(aAlunos, oAluno)
    oAluno := Aluno():New("Gabriel Nogueira", 8, 10,7,  6)
    aAdd(aAlunos, oAluno)

    for nI:=1 to len(aAlunos)
        oAluno := aAlunos[nI]
        oAluno:PrintAll(2)
        Qout()
    next nI
    Qout("FIM")

return nil