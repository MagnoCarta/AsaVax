//
//  ListaDeCardsViewModel.swift
//  AsaVax
//
//  Created by Gilberto Magno on 23/11/23.
//

import Foundation

@Observable
class ListaDeCardsViewModel {
    
    var lotes: [Batch] = []
    var coredataService: CoreDataService = .shared
    var isSheeting: Bool = false
    var loteClicado: Batch?
    
    init() {
        fetchLotes()
    }
    
    func fetchLotes() {
        self.lotes = coredataService.getBatchs()
    }
    
}
