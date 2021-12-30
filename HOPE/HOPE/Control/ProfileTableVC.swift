//
//  ProfileTableVC.swift
//  HOPE
//
//  Created by Asma on 29/12/2021.
//

import UIKit

class ProfileTableVC: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.section == 1) && (indexPath.row == 0) {
            let alert = UIAlertController(title: "IOh ", message: "This email is not already Signup", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
        if (indexPath.section == 2) && (indexPath.row == 0) {
        performSegue(withIdentifier: "toMeasures", sender: nil)
        }
        if (indexPath.section == 2) && (indexPath.row == 1) {
        performSegue(withIdentifier: "toNumbers", sender: nil)
        }
        if (indexPath.section == 2) && (indexPath.row == 2) {
        performSegue(withIdentifier: "toMap", sender: nil)
        }
        
        

        
        
    }
    
    
    
    //    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //    }
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //
    //    }
    
}


//override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//  switch indexPath.section {
// case (indexPath.section == 1): break
//            if indexPath.row == 0 {
//                let alert = UIAlertController(title: "IOh ", message: "This email is not already Signup", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//                self.present(alert, animated: true)
//            }

// case (indexPath.section == 2): break
//                    switch (indexPath.section == 2) {
//                    case (indexPath.row == 0):
//                        performSegue(withIdentifier: "toMeasures", sender: nil)
//                    case (indexPath.row == 1):
//                        performSegue(withIdentifier: "toNumbers", sender: nil)
//                    case (indexPath.row == 2):
//                        performSegue(withIdentifier: "toMap", sender: nil)
//                    default:
//                        print("")
//                    }

//   }
// }

