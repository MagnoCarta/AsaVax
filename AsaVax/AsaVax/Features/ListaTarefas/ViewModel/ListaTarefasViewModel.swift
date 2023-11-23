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
    var isSheeting: Bool = false
    var tarefaClicada: Tarefa?
    
    init() {
        fetchTarefas()
    }
    
    func fetchTarefas() {
        self.tarefas = coredataService.getTarefas()
    }
    
    var tarefasConcluidas: [Tarefa] {
        tarefas.filter({ $0.isConcluded })
    }
    
    var tarefasPendentes: [Tarefa] {
        tarefas.filter({ !$0.isConcluded })
    }
    
    func getDay(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayInWeek = dateFormatter.string(from: date)
        return dayInWeek
    }
    
    
}
