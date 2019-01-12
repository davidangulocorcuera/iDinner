//
//  UserRepository.swift
//  iDinner
//
//  Created by David Angulo on 11/01/2019.
//  Copyright © 2019 Biolizard. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class UserRepository: Repository {
    
    // Descargar todos
    func getAll() -> [User] {
        var users: [User] = []
        do {
            let entities = try Realm().objects(UserEntity.self).sorted(byKeyPath: "id", ascending: false)
            for entity in entities {
                let model = entity.userModel()
                users.append(model)
            }
        }
        catch let error as NSError {
            print("Error getAll users: ", error.description)
        }
        return users
    }
    
    // Obtener el id
    func get(identifier: String) -> User? {
        do {
            let realm =  try Realm()
            if let entity = realm.objects(UserEntity.self).filter("id == %@", identifier).first{
                let model = entity.userModel()
                return model
            }
        }
        catch {
            return nil
        }
        return nil
    }
    
    // Añadir un usuario
    func create(a: User) -> Bool {
        do {
            let entity = UserEntity(user: a)
            uiRealm.beginWrite()
            if let _ = uiRealm.object(ofType: UserEntity.self, forPrimaryKey: entity.id) {
                uiRealm.cancelWrite()
                return false
            }
            
            uiRealm.add(entity, update: false)
            try uiRealm.commitWrite()
        } catch let error {
            print(error)
            return false
        }
    
        return true
    }
    
    // Modificar un usuario
    func update(a: User) -> Bool {
        do {
            let realm = try Realm()
            let entity = UserEntity(user: a)
            try realm.write {
                realm.add(entity, update: true)
            }
        }
        catch {
            return false
        }
        
        return true
    }
    
    // Borrar un usuario
    func delete(a: User) -> Bool {
        do {
            let realm = try Realm()
            try realm.write {
                let entityToDelete = realm.objects(UserEntity.self).filter("id == %@", a.id)
                realm.delete(entityToDelete)
            }
            
        }
        catch {
            return false
        }
        return true
    }
}
