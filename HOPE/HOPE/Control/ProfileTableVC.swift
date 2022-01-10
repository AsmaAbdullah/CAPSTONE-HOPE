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
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //MARK: for save certain data on the Fairbase
        
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { profile in
            self.profile = profile
            self.name.text = profile.name
            self.email.text = profile.email
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.section == 1) && (indexPath.row == 0) {

        }
        
        
        if (indexPath.section == 2) && (indexPath.row == 0) {
            performSegue(withIdentifier: "toNumbers", sender: nil)
        }
        if (indexPath.section == 2) && (indexPath.row == 1) {
            performSegue(withIdentifier: "toMap", sender: nil)
        }
    }
    
    @IBAction func changeLanguage(_ sender: UIButton) {
        
        let chengelangu = UIAlertController(title: NSLocalizedString("The application will be restarted", comment: ""), message: NSLocalizedString( "Choose your preferred language",comment: ""), preferredStyle: .actionSheet)
        chengelangu.addAction(UIAlertAction(title: "Einglish", style: .default, handler: { action in
            let currentlang = Locale.current.languageCode
            let newLanguage = currentlang == "en" ? "ar" : "en"
            UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
            exit(0)
        }))
        chengelangu.addAction(UIAlertAction(title: "عربي", style: .default, handler: {action in
            let currentlang = Locale.current.languageCode
            let newLanguage = currentlang == "en" ? "ar" : "ar"
            UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
            exit(0)
        }))
        chengelangu.addAction(UIAlertAction(title:NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil))
        present(chengelangu, animated: true, completion: nil)
    }
    
    
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
    
    
    
    @IBAction func logOut(_ sender: UIButton) {
        
        
        let alertController = UIAlertController(title: "Logout", message: "Are you sure to log out?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
           
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                self.dismiss(animated: true, completion: nil)
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}


