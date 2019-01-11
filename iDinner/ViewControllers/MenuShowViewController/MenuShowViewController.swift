//
//  MenuShowViewController.swift
//  iDinner
//
//  Created by Biolizard on 06/01/2019.
//  Copyright © 2019 Biolizard. All rights reserved.
//

import UIKit

class MenuShowViewController: UIViewController {
@IBOutlet weak var tableViewMenuList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Show Menus"
        registercells()
        // Do any additional setup after loading the view.
    }
    private func registercells(){
        let identifierTableView = "ShowListsTableViewCell"
        let cellNibSwitch = UINib(nibName: identifierTableView, bundle: nil)
        tableViewMenuList.register(cellNibSwitch, forCellReuseIdentifier: "ShowListsTableViewCell")
        tableViewMenuList.register(cellNibSwitch, forCellReuseIdentifier: identifierTableView)
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
extension MenuShowViewController:
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
