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
    
    
    @IBAction func logOut(_ sender: UIButton) {
        
        let firebaseAuth = Auth.auth()
       do {
         try firebaseAuth.signOut()
           self.dismiss(animated: true, completion: nil)
       } catch let signOutError as NSError {
         print("Error signing out: %@", signOutError)
       }
    }
    
    }
    
    
    
    //    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //    }
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //
    //    }


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

