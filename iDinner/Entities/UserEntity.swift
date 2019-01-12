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
    @objc dynamic var name = ""
    @objc dynamic var isPay = false
    @objc dynamic var date = Date()
    
    override static func primaryKey() -> String {
        return "name"
    }
    
    convenience init(user: User) {
        self.init()
        
        self.name = user.name
        self.isPay = user.isPay
        self.date = user.date
        
    }
    func userModel() -> User {
        let userModel = User()
        
        userModel.name = self.name
        userModel.isPay = self.isPay
        userModel.date = self.date
        
        return userModel
    }
}
