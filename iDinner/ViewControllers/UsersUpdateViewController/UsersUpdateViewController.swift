//
//  UsersUpdateViewController.swift
//  iDinner
//
//  Created by David Angulo on 11/01/2019.
//  Copyright © 2019 Biolizard. All rights reserved.
//

import UIKit

class UsersUpdateViewController: UIViewController {
    internal var user: User!
    
    convenience init(user: User?) {
        self.init()
        if user == nil {
            self.user = User()
        }
        else {
            self.user = user
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Modificar " + user.name
        // Do any additional setup after loading the view.
    }

}
