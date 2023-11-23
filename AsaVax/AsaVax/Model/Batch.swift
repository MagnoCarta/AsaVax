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
    var date: String
    var numberBought: Int
    var vaxDone: [String]
    var medicineApplied: [String]
    var mortalityFrequency: Int = 1
    var absoluteMortality: Int
    var mortalityRate: Double { Double(absoluteMortality/Calendar.current.numberOfDaysBetween(date.dateFromISOFormatString() ?? .now, and: .now))
    }
    
}
