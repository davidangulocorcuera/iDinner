//
//  MenuViewController.swift
//  iDinner
//
//  Created by Biolizard on 01/01/2019.
//  Copyright © 2019 Biolizard. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var tableViewOptionsMenu: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
         title = "Menús"
        registercells()
        // Do any additional setup after loading the view.
    }
    private func registercells(){
        let identifierTableView = "MainTableViewCell"
        let cellNibSwitch = UINib(nibName: identifierTableView, bundle: nil)
        tableViewOptionsMenu.register(cellNibSwitch, forCellReuseIdentifier: "MainTableViewCell")
        tableViewOptionsMenu.register(cellNibSwitch, forCellReuseIdentifier: identifierTableView)
    }

}
extension MenuViewController:
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
            navigationController?.pushViewController(MenuShowViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(MenuAddViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(MenuDeleteViewController(), animated: true)
        default:
            return
        }
        
        
        
        
    }
    /* func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     true
     }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     <#code#>
     }*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MainTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell)!
        switch indexPath.row {
        case 0:
            cell.lbl_name.text = "Consultar"
        case 1:
            cell.lbl_name.text = "Añadir"
        case 2:
            cell.lbl_name.text = "Borrar"
        default:
            return cell
        }
        
        
        return cell
    }
}

