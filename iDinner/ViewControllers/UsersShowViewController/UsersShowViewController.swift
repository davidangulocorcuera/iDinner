//
//  UsersShowViewController.swift
//  iDinner
//
//  Created by Biolizard on 06/01/2019.
//  Copyright © 2019 Biolizard. All rights reserved.
//

import UIKit

class UsersShowViewController: UIViewController {
 @IBOutlet weak var tableViewList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lista de participantes"
        registercells()
    }
    private func registercells(){
        let identifierTableView = "ShowListsTableViewCell"
        let cellNibSwitch = UINib(nibName: identifierTableView, bundle: nil)
        tableViewList.register(cellNibSwitch, forCellReuseIdentifier: "ShowListsTableViewCell")
        tableViewList.register(cellNibSwitch, forCellReuseIdentifier: identifierTableView)
    }
}
extension UsersShowViewController:
UITableViewDelegate,UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ShowListsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "ShowListsTableViewCell", for: indexPath) as? ShowListsTableViewCell)!
        switch indexPath.row {
        case 0:
            cell.lbl_name.text = "ej1"
        case 1:
            cell.lbl_name.text = "ej2"
        case 2:
            cell.lbl_name.text = "ej3"
        default:
            return cell
        }
        
        
        return cell
    }
    
}
