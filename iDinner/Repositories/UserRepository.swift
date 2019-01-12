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
       
        let entities = uiRealm.objects(UserEntity.self).sorted(byKeyPath: "date", ascending: false)
        for entity in entities {
            let model = entity.userModel()
            users.append(model)
        }
        
        return users
    }
    
    // Obtener el id
    func get(identifier: String) -> User? {
        if let entity = uiRealm.objects(UserEntity.self).filter("name == %@", identifier).first{
            let model = entity.userModel()
            return model
        }
        return nil
    }
    
    // Añadir un usuario
    func create(a: User) -> Bool {
        do {
            let entity = UserEntity(user: a)
            uiRealm.beginWrite()
            if let _ = uiRealm.object(ofType: UserEntity.self, forPrimaryKey: entity.name) {
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
            let entity = UserEntity(user: a)
            try uiRealm.write({
                uiRealm.add(entity, update: true)
            })
        } catch let error {
            print(error)
            return false
        }
        
        return true
    }
    
    // Borrar un usuario
    func delete(a: User) -> Bool {
        do {
            try uiRealm.write({
                let entity = uiRealm.objects(UserEntity.self).filter("name == %@", a.name)
                uiRealm.delete(entity)
            })
        } catch let error {
            print(error)
            return false
        }
        
        return true
    }
}
