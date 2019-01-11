//
//  GroupEntity.swift
//  iDinner
//
//  Created by David Angulo on 11/01/2019.
//  Copyright © 2019 Biolizard. All rights reserved.
//

import Foundation
import RealmSwift

class GroupEntity: Object {
    @objc dynamic var id = ""

    
    override static func primaryKey() -> String {
        return "id"
    }
    
    convenience init(group: Group) {
        self.init()
        
        self.id = group.id
        
    }
    func groupModel() -> Group {
        let groupModel = Group()
        return groupModel
    }
}
