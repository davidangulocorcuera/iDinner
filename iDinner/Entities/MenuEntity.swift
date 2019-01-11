//
//  MenuEntity.swift
//  iDinner
//
//  Created by David Angulo on 11/01/2019.
//  Copyright © 2019 Biolizard. All rights reserved.
//

import Foundation
import RealmSwift

class MenuEntity: Object {
    @objc dynamic var id = ""
    @objc dynamic var first = ""
    @objc dynamic var second = ""
    @objc dynamic var dessert = ""
    @objc dynamic var drink = ""
    
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    convenience init(menu: Menu) {
        self.init()
        
        self.id = menu.id
        self.first = menu.first
        self.second = menu.second
        self.dessert = menu.dessert
        self.drink = menu.drink
        
    }
    func menuModel() -> Menu {
        let menuModel = Menu()
        
        menuModel.id = self.id
        menuModel.first = self.first
        menuModel.second = self.second
        menuModel.dessert = self.dessert
        menuModel.drink = self.drink

        
        return menuModel
    }
}
