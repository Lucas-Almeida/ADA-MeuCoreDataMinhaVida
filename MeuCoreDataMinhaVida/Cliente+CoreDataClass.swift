//
//  Cliente+CoreDataClass.swift
//  MeuCoreDataMinhaVida
//
//  Created by Lucas Pinheiro Almeida on 03/12/2018.
//  Copyright © 2018 Lucas Pinheiro Almeida. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Cliente)
public class Cliente: NSManagedObject {

    convenience init(insertInto context: NSManagedObjectContext?) {
        self.init(entity: Cliente.entity(), insertInto: context)
    }
}
