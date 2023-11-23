//
//  ListaTarefasViewModel.swift
//  AsaVax
//
//  Created by Gilberto Magno on 23/11/23.
//

import Foundation

@Observable
class ListaTarefasViewModel {
    
    var tarefas: [Tarefa] = []
    var coredataService: CoreDataService = .shared
    
    init() {
        self.tarefas = coredataService.getTarefas()
        self.tarefas = [
            .init(title: "Vacinar as Galinhas",
                  loteName: "Lote X",
                  tipoDeAtividade: .vacinacao,
                  date: Date(),
                  lembrete: "30 min",
                  descricao: "UMA BELA DESCRICAO",
                  isConcluded: false),
            .init(title: "Vacinar as Galinhas",
                  loteName: "Lote X",
                  tipoDeAtividade: .vacinacao,
                  date: Date(),
                  lembrete: "30 min",
                  descricao: "UMA BELA DESCRICAO",
                  isConcluded: false),
            .init(title: "Vacinar as Galinhas",
                  loteName: "Lote X",
                  tipoDeAtividade: .vacinacao,
                  date: Date(),
                  lembrete: "30 min",
                  descricao: "UMA BELA DESCRICAO",
                  isConcluded: false)
            ,
            .init(title: "Vacinar as Galinhas",
                  loteName: "Lote X",
                  tipoDeAtividade: .vacinacao,
                  date: Date(),
                  lembrete: "30 min",
                  descricao: "UMA BELA DESCRICAO",
                  isConcluded: true),
            .init(title: "Vacinar as Galinhas",
                  loteName: "Lote X",
                  tipoDeAtividade: .vacinacao,
                  date: Date(),
                  lembrete: "30 min",
                  descricao: "UMA BELA DESCRICAO",
                  isConcluded: true),
            .init(title: "Vacinar as Galinhas",
                  loteName: "Lote X",
                  tipoDeAtividade: .vacinacao,
                  date: Date(),
                  lembrete: "30 min",
                  descricao: "UMA BELA DESCRICAO",
                  isConcluded: true)
        ]
    }
    
    func tarefasConcluidas() -> [Tarefa] {
        tarefas.filter({ $0.isConcluded })
    }
    
    func tarefasPendentes() -> [Tarefa] {
        tarefas.filter({ !$0.isConcluded })
    }
    
    func getDay(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayInWeek = dateFormatter.string(from: date)
        return dayInWeek
    }
    
    
}
