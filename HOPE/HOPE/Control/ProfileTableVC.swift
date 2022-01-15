//
//  ProfileTableVC.swift
//  HOPE
//
//  Created by Asma on 29/12/2021.
//

import UIKit
import Firebase
import FirebaseAuth


class ProfileTableVC: UITableViewController {
    
    var profile: User?
    
    
    // MARK: Outlet for name and email ..
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //MARK: To view data from Firebase
        
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { profile in
            self.profile = profile
            self.name.text = profile.name
            self.email.text = profile.email
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        if (indexPath.section == 1) && (indexPath.row == 0) {
        //        }
        //
        if (indexPath.section == 2) && (indexPath.row == 0) {
            performSegue(withIdentifier: "toNumbers", sender: nil)
        }
        if (indexPath.section == 2) && (indexPath.row == 1) {
            performSegue(withIdentifier: "toMap", sender: nil)
        }
    }
    
    //MARK: Language change function
    
    @IBAction func changeLanguage(_ sender: UIButton) {
        
        if let appSettings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(appSettings) {
            UIApplication.shared.open(appSettings)
        }
    }
    
    
    //MARK: Function to change to dark mode
    
    @IBAction func changeToDarkMode(_ sender: UISwitch) {
        if #available(iOS 13.0, *) {
            let appDelegate = UIApplication.shared.windows.first
            if sender.isOn {
                appDelegate?.overrideUserInterfaceStyle = .dark
                return
            }
            appDelegate?.overrideUserInterfaceStyle = .light
            return
        }
    }
    
    
    //MARK: logout function
    
    @IBAction func logOut(_ sender: UIButton) {
        
        
        let alertController = UIAlertController(title: "Logout".localaized, message: "Are you sure to log out?".localaized, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "OK".localaized, style: .default, handler: { action in
            
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                self.dismiss(animated: true, completion: nil)
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        }))
        alertController.addAction(UIAlertAction(title: "Cancel".localaized, style: .destructive, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
}


