//
//  UsersAddViewController.swift
//  iDinner
//
//  Created by Biolizard on 06/01/2019.
//  Copyright © 2019 Biolizard. All rights reserved.
//

import UIKit

class UsersAddViewController: UIViewController {
    @IBOutlet weak var btnAdd: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Añadir participante"
        btnAdd.layer.cornerRadius = 15.0
        btnAdd.layer.borderWidth = 2
        btnAdd.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
