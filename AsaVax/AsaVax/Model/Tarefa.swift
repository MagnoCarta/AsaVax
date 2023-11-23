//
//  Tarefa.swift
//  AsaVax
//
//  Created by Gilberto Magno on 23/11/23.
//

import Foundation

struct Tarefa: StructDecoder, Identifiable {
    var id: String { self.title }
    
    static var entityName: String = "TarefaModel"
    
    var title: String
    var loteName: String
    var tipoDeAtividade: TipoDeAtividade
    var date: Date
    var lembrete: String
    var descricao: String
    var isConcluded: Bool
    
}

enum TipoDeAtividade: String {
    case vacinacao = "Vacinação"
    case consulta = "Consulta"
    case alimentacao = "Alimentação"
}
