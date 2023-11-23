//
//  StructDecoder.swift
//  AsaVax
//
//  Created by Gilberto Magno on 22/11/23.
//

import Foundation
import CoreData

protocol StructDecoder {
    
    // The name of our Core Data Entity
    
    static var entityName: String { get }
    
    // Return an NSManagedObject with our properties set
    
    func toCoreData(context: NSManagedObjectContext) throws -> NSManagedObject
    
}

enum SerializationError: Error {
    
    // We only support structs
    
    case structRequired
    
    // The entity does not exist in the Core Data Model
    
    case unknownEntity(name: String)
    
    // The provided type cannot be stored in core data
    
    case unsupportedSubType(label: String?)
    
}

extension StructDecoder {
    
    func toCoreData(context: NSManagedObjectContext) throws -> NSManagedObject {
        
        let entityName = type(of: self).entityName
        
        guard let desc = NSEntityDescription.entity(forEntityName: entityName, in: context) else {
            throw SerializationError.unknownEntity(name: entityName)
        }

        let managedObject = NSManagedObject(entity: desc, insertInto: context)
        let mirror = Mirror(reflecting: self)
        guard mirror.displayStyle == .struct else { throw SerializationError.structRequired }

        for case let (label?, anyValue) in mirror.children {
            let subMirror = Mirror(reflecting: anyValue)
            if subMirror.displayStyle == .optional {
                if subMirror.children.count == 0 {
                    continue
                }
            }
            if let attribute = managedObject.entity.attributesByName[label] {
                if attribute.isOptional {
                    if subMirror.displayStyle == .enum {
                        if let tipo = TipoDoLote.getRawValue(anyValue) {
                            managedObject.setValue(tipo , forKey: label)
                        } else if let tipo = Genero.getRawValue(anyValue) {
                            managedObject.setValue(tipo , forKey: label)
                        } else if let tipo = TipoDeAtividade.getRawValue(anyValue) {
                            managedObject.setValue(tipo , forKey: label)
                        } else {
                            managedObject.setValue(anyValue , forKey: label)
                        }
                    } else {
                        managedObject.setValue(anyValue, forKey: label)
                    }
                } else {
                    if !isItNil(value: anyValue,
                                attribute: attributeTypes[attribute.attributeType]) {
                        if subMirror.displayStyle == .enum {
                            managedObject.setValue(anyValue, forKey: label)
                        } else {
                            managedObject.setValue(anyValue, forKey: label)
                        }
                    }
                }
            }
        }
        
        return managedObject
        
    }
}

extension StructDecoder {
    
    var attributeTypes: [NSAttributeType: Any.Type] {
        [
            .URIAttributeType: URL.self,
            .UUIDAttributeType: UUID.self,
            .binaryDataAttributeType: Data.self,
            .booleanAttributeType: Bool.self,
            .compositeAttributeType: Any.self,
            .dateAttributeType: Date.self,
            .decimalAttributeType: Decimal.self,
            .doubleAttributeType: Double.self,
            .floatAttributeType: Float.self,
            .integer16AttributeType: Int16.self,
            .integer32AttributeType: Int32.self,
            .integer64AttributeType: Int64.self,
            .objectIDAttributeType: ObjectIdentifier.self,
            .stringAttributeType: String.self,
            .transformableAttributeType: Any.self,
            .undefinedAttributeType: Any.self
        ]
    }
    
    func isItNil<MyType>(value: Any?, attribute: MyType) -> Bool {
        var isItNil: Bool = false
        guard let value = value as? MyType else { return isItNil }
        return !isItNil
    }
    
}
extension RawRepresentable {
    static func getRawValue(_ value: Any) -> RawValue? {
        (value as? Self)?.rawValue
    }
}
