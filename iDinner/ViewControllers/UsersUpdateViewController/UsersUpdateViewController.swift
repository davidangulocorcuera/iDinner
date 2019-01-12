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
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var sw_isPay: UISwitch!
    
    convenience init(user: User?) {
        self.init()
        if user == nil {
            self.user = User()
        } else {
            self.user = user
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Modificar " + user.name
        sw_isPay.setOn(user.isPay, animated: false)
        btnAdd.layer.cornerRadius = 25.0

        // Do any additional setup after loading the view.
    }
    @IBAction func updateButtonPressed() {
        user.isPay = sw_isPay.isOn
        user.date = Date()
        
        let repository = UserRepository()
        if repository.update(a: user) {
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        } else {
            // popup
            let alert = UIAlertController(title: "Error", message: "Error updating user", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            print(user)
        }
    }
}
