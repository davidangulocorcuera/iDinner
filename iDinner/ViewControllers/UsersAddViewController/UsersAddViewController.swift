//
//  UsersAddViewController.swift
//  iDinner
//
//  Created by Biolizard on 06/01/2019.
//  Copyright © 2019 Biolizard. All rights reserved.
//

import UIKit
protocol AddUserViewControllerDelegate: class {
    func addUserViewController(_ vc: UsersAddViewController, didEditUser user: User)
}
class UsersAddViewController: UIViewController , UITextFieldDelegate  {
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var sw_isPay: UISwitch!


    internal var user: User!
    weak var delegate: AddUserViewControllerDelegate!

    convenience init(user: User?) {
        self.init()
        if user == nil {
            self.user = User()
            self.user.isPay = false
            self.user.name = UUID().uuidString
            
        }
        else {
            self.user = user
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Añadir participante"
        btnAdd.layer.cornerRadius = 15.0
        btnAdd.layer.borderWidth = 2
        btnAdd.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        setupAddTargetIsNotEmptyTextFields()
        
        // Do any additional setup after loading the view.
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupAddTargetIsNotEmptyTextFields() {
        btnAdd.isHidden = true //hidden okButton
        tf_name.addTarget(self, action: #selector(textFieldsIsNotEmpty),
                                    for: .editingChanged)
    }
    
    @objc func textFieldsIsNotEmpty(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        guard
            let name = tf_name.text, !name.isEmpty
        else {
            self.btnAdd.isHidden = true
            return
        }
        // enable okButton if all conditions are met
        btnAdd.isHidden = false
    }
    
    @IBAction func addButtonPressed() {
        self.user.name = tf_name.text
        self.user.isPay = sw_isPay.isOn
        self.user.date = Date()
        delegate.addUserViewController(self, didEditUser: user)
    }
}
extension UsersViewController: AddUserViewControllerDelegate{
    func addUserViewController(_ vc: UsersAddViewController, didEditUser user: User) {
         let repository = UserRepository()
        if repository.create(a: user) {
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        } else {
            // popup
            print("error")
        }
    }
}
