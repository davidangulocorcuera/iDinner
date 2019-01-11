//
//  UserEntity.swift
//  iDinner
//
//  Created by David Angulo on 11/01/2019.
//  Copyright © 2019 Biolizard. All rights reserved.
//

import Foundation
import RealmSwift

class UserEntity: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var platos: [String]!
    @objc dynamic var isPay = false
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    convenience init(user: User) {
        self.init()
        
        self.id = user.id
        self.name = user.name
        self.platos = user.platos
        self.isPay = user.isPay
        
    }
    func userModel() -> User {
        let userModel = User()
        
        userModel.id = self.id
        userModel.name = self.name
        userModel.platos = self.platos
        userModel.isPay = self.isPay
        
        return userModel
    }
}
