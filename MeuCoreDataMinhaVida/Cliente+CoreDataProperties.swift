//
//  Cliente+CoreDataProperties.swift
//  MeuCoreDataMinhaVida
//
//  Created by Lucas Pinheiro Almeida on 03/12/2018.
//  Copyright © 2018 Lucas Pinheiro Almeida. All rights reserved.
//
//

import Foundation
import CoreData


extension Cliente {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cliente> {
        return NSFetchRequest<Cliente>(entityName: "Cliente")
    }
    
    @NSManaged public var nome: String?
    @NSManaged public var fone: String?
    @NSManaged public var nrFilhos: Int16

}
