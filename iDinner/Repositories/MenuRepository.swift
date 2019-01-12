//
//  MenuRepository.swift
//  iDinner
//
//  Created by David Angulo on 11/01/2019.
//  Copyright © 2019 Biolizard. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class MenuRepository: Repository {
    
    // Descargar todos
    func getAll() -> [Menu] {
        var menus: [Menu] = []
        do {
            let entities = try Realm().objects(MenuEntity.self).sorted(byKeyPath: "date", ascending: false)
            for entity in entities {
                let model = entity.menuModel()
                menus.append(model)
            }
        }
        catch let error as NSError {
            print("Error getAll menus: ", error.description)
        }
        return menus
    }
    
    // Obtener el id
    func get(identifier: String) -> Menu? {
        do {
            let realm =  try Realm()
            if let entity = realm.objects(MenuEntity.self).filter("id == %@", identifier).first{
                let model = entity.menuModel()
                return model
            }
        }
        catch {
            return nil
        }
        return nil
    }
    
    // Añadir un menu
    func create(a: Menu) -> Bool {
        do {
            let realm = try Realm()
            let entity = MenuEntity(menu: a)
            try realm.write {
                realm.add(entity, update: true)
            }
        }
        catch {
            return false
        }
        
        return true
    }
    
    // Modificar un menu
    func update(a: Menu) -> Bool {
        return create(a: a)
    }
    
    // Borrar un menu
    func delete(a: Menu) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                let entityToDelete = realm.objects(MenuEntity.self).filter("id == %@", a.id)
                realm.delete(entityToDelete)
            }
            
        }
        catch {
            return false
        }
        return true
    }
}
