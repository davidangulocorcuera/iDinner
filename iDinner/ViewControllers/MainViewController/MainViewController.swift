//
//  MainViewController.swift
//  iDinner
//
//  Created by Biolizard on 01/01/2019.
//  Copyright © 2019 Biolizard. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableViewOptions: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registercells()

        // Do any additional setup after loading the view.
    }
    private func registercells(){
        let identifierTableView = "MainTableViewCell"
        let cellNibSwitch = UINib(nibName: identifierTableView, bundle: nil)
        tableViewOptions.register(cellNibSwitch, forCellReuseIdentifier: "MainTableViewCell")
        tableViewOptions.register(cellNibSwitch, forCellReuseIdentifier: identifierTableView)
    }
    
        
    }
extension MainViewController:
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(MenuViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(UsersViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(GroupsViewController(), animated: true)
        default:
            return 
        }
         
        
        
        
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MainTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell)!
        switch indexPath.row {
        case 0:
             cell.lbl_name.text = "Menús"
        case 1:
            cell.lbl_name.text = "Participantes"
        case 2:
            cell.lbl_name.text = "Grupos"
        default:
            return cell
        }
        
        
        return cell
    }
  


}

