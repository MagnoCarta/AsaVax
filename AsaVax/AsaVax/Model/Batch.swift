//
//  Batch.swift
//  AsaVax
//
//  Created by Gilberto Magno on 22/11/23.
//

import Foundation

struct Batch: StructDecoder, Hashable {
    static var entityName: String = "BatchModel"
    
    var name: String
    var date: Date
    var numberBought: String
    var vaxDone: String
    var medicineApplied: String
    var mortalityFrequency: Int = 1
    var absoluteMortality: Int = 0
    var tipo: TipoDoLote
    var genero: Genero
    var mortalityRate: Double { Double(absoluteMortality/Calendar.current.numberOfDaysBetween(date, and: .now))
    }
    
}

enum TipoDoLote: String, CaseIterable {
    case poedeira
    case corte
}

enum Genero: String, CaseIterable {
    case misto
    case femea
    case macho
}
