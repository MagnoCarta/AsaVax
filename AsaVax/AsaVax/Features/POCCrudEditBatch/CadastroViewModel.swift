//
//  CadastroViewModel.swift
//  AsaVax
//
//  Created by Gilberto Magno on 23/11/23.
//

import Foundation

struct CadastroViewModel {
    
    var batch: Batch
    var editedBatch: Batch
    var coredataService: CoreDataService = .shared
    
    init(batch: Batch) {
        self.batch = batch
        self.editedBatch = batch
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
