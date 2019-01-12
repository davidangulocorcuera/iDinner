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
    internal var userRepository = UserRepository()
    internal var users:[User] = []
    internal var repository = UserRepository()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lista de participantes"
        registercells()
        users = repository.getAll()
        tableViewList.reloadData()
        
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
        
        return users.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            navigationController?.pushViewController(UsersUpdateViewController(user: users[indexPath.row]), animated: true)
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ShowListsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "ShowListsTableViewCell", for: indexPath) as? ShowListsTableViewCell)!
       
        let user = users[indexPath.row]
        cell.lbl_name.text = user.name
        return cell
        
            }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let user = users[indexPath.row]
            if repository.delete(a: user){
                users.remove(at: indexPath.row)
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.endUpdates()
            }
        }
    }
    
}
