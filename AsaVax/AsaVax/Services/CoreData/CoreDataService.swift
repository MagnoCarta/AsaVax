//
//  CoreDataService.swift
//  AsaVax
//
//  Created by Gilberto Magno on 22/11/23.

import Foundation
import CoreData
import SensorKit

class CoreDataService {
    
    let context = PersistenceController.shared.container.viewContext
    static let shared = CoreDataService()
    
    private init() {}
    
    func saveEntities<T: StructDecoder>(entities: any Sequence<T>) {
        getFetchs().forEach { context.delete($0) }
        entities.forEach { _ = try? $0.toCoreData(context: context) }
        do {
            try context.save()
        } catch {
            print("It was not possible to save the context")
            print(error)
        }
    }
    
    func getBatchs() -> [Batch] {
        let entitiesFetchRequest = getBatchFetchRequest()
        do {
            let entities = try context.fetch(entitiesFetchRequest)
            return convertToBatch(entities: entities)
        } catch {
            return []
        }
    }
    
    func convertToBatch(entities: [BatchModel]) -> [Batch] {
        var convertedEntities: [Batch] = []
        convertedEntities = entities.map({
            Batch(name: $0.name ?? "No Name",
                  date: $0.date ?? "11/11/11",
                  numberBought: Int($0.numberBought),
                  vaxDone: $0.vaxDone ?? [],
                  medicineApplied: $0.medicineApplied ?? [],
                  absoluteMortality: Int($0.absoluteMortality))
        })
        return convertedEntities
    }
    
    private func getFetchs() -> [BatchModel] {
        let entitiesFetchRequest = getBatchFetchRequest()
        do {
            return try context.fetch(entitiesFetchRequest)
        } catch {
            return []
        }
    }
    
    private func getBatchFetchRequest() -> NSFetchRequest<BatchModel> {
        let entitiesFetchRequest = NSFetchRequest<BatchModel>(entityName: Batch.entityName)
        let descriptor = NSSortDescriptor(key: "toTime", ascending: true)
        entitiesFetchRequest.sortDescriptors = [descriptor]
        return entitiesFetchRequest
    }
    
}

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "SleepApp")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
