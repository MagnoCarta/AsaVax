//
//  CadastroViewModel.swift
//  AsaVax
//
//  Created by Gilberto Magno on 23/11/23.
//

import Foundation
import Observation

@Observable
class CadastroViewModel {
    
    private var batch: Batch
    var editedBatch: Batch
    var coredataService: CoreDataService = .shared
    
    init(batch: Batch) {
        self.batch = batch
        self.editedBatch = batch
    }
    
    init() {
        self.batch = .init(name: "", date: Date(), numberBought: "", vaxDone: [], medicineApplied: [], absoluteMortality: 1, tipo: .corte, genero: .femea)
        self.editedBatch = .init(name: "", date: Date(), numberBought: "", vaxDone: [], medicineApplied: [], absoluteMortality: 1, tipo: .corte, genero: .femea)
        
    }
    
    
    func editBatch() {
        var batchs = Set(coredataService.getBatchs())
        batchs.remove(batch)
        batchs.insert(editedBatch)
        coredataService.saveEntities(entities: batchs)
    }
    
    func deleteBatch() {
        var batchs = Set(coredataService.getBatchs())
        batchs.remove(batch)
        coredataService.saveEntities(entities: batchs)
    }
    
}
