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
        getTarefaFetchs().forEach { context.delete($0) }
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
    
    func getTarefas() -> [Tarefa] {
        let entitiesFetchRequest = getTarefaFetchRequest()
        do {
            let entities = try context.fetch(entitiesFetchRequest)
            return convertToTarefa(entities: entities)
        } catch {
            return []
        }
    }
    
    func convertToTarefa(entities: [TarefaModel]) -> [Tarefa] {
        var convertedEntities: [Tarefa] = []
        convertedEntities = entities.map({
            Tarefa(title: $0.title ?? "",
                   loteName: $0.lote ?? "",
                   tipoDeAtividade: TipoDeAtividade(rawValue: $0.tipoDeAtividade ?? "consulta") ?? .consulta,
                   date: $0.date ?? Date(),
                   lembrete: $0.lembrete ?? "",
                   descricao: $0.descricao ?? "",
                   isConcluded: $0.isConcluded)
        })
        return convertedEntities
    }
    
    func convertToBatch(entities: [BatchModel]) -> [Batch] {
        var convertedEntities: [Batch] = []
        convertedEntities = entities.map({
            Batch(name: $0.name ?? "No Name",
                  date: $0.date ?? Date(),
                  numberBought: $0.numberBought ?? "0",
                  vaxDone: $0.vaxDone ?? "",
                  medicineApplied: $0.medicineApplied ?? "",
                  absoluteMortality: Int($0.absoluteMortality),
                  tipo: TipoDoLote(rawValue: $0.tipo ?? "corte") ?? .corte,
                  genero: Genero(rawValue: $0.genero ?? "misto") ?? .misto)
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
    
    private func getTarefaFetchs() -> [TarefaModel] {
        let entitiesFetchRequest = getTarefaFetchRequest()
        do {
            return try context.fetch(entitiesFetchRequest)
        } catch {
            return []
        }
    }
    
    private func getBatchFetchRequest() -> NSFetchRequest<BatchModel> {
        let entitiesFetchRequest = NSFetchRequest<BatchModel>(entityName: Batch.entityName)
        return entitiesFetchRequest
    }
    
    private func getTarefaFetchRequest() -> NSFetchRequest<TarefaModel> {
        let entitiesFetchRequest = NSFetchRequest<TarefaModel>(entityName: Tarefa.entityName)
        return entitiesFetchRequest
    }
    
}

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "AsaVax")
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
