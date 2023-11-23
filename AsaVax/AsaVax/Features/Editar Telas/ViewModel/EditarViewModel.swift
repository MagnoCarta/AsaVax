//
//  EditarViewModel.swift
//  AsaVax
//
//  Created by Ana Raiany Guimarães Gomes on 2023-11-23.
//

import Foundation
import Observation

@Observable
class EditarViewModel {
    
    private var tarefa: Tarefa
    var tarefaEditada: Tarefa
    var coredataService: CoreDataService = .shared
    
    init(tarefa: Tarefa) {
        self.tarefa = tarefa
        self.tarefaEditada = tarefa
    }
    
    init() {
        self.tarefa = .init(title: "Vacinar as galinhas",
                            loteName: "Lote X",
                            tipoDeAtividade: .vacinacao,
                            date: Date(),
                            lembrete: "30 min antes",
                            descricao: "Vacinar todas as 200 galinhas do lote X. A vacina será contra a doença YYY e serão realizadas de maneira organizada pelos médicos responsáveis.")
        self.tarefaEditada = .init(title: "Vacinar as galinhas",
                                   loteName: "Lote X",
                                   tipoDeAtividade: .vacinacao,
                                   date: Date(),
                                   lembrete: "30 min antes",
                                   descricao: "Vacinar todas as 200 galinhas do lote X. A vacina será contra a doença YYY e serão realizadas de maneira organizada pelos médicos responsáveis.")
    }
    
    func pegarTodosOsLotes() -> [Batch] {
        coredataService.getBatchs()
    }
    
    
    func editTarefa() {
        var tarefas = Set(coredataService.getTarefas())
        tarefas.remove(tarefa)
        tarefas.insert(tarefaEditada)
        coredataService.saveEntities(entities: tarefas)
    }
    
    func deleteTarefa() {
        var tarefas = Set(coredataService.getTarefas())
        tarefas.remove(tarefa)
        coredataService.saveEntities(entities: tarefas)
    }
    
}
