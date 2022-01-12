//
//  SignupVC.swift
//  HOPE
//
//  Created by Asma on 08/12/2021.
//

import UIKit
import FirebaseAuth
import Firebase
import SwiftMessages

class SignupVC: UIViewController {

    @IBOutlet weak var nameSignup: UITextField!
    @IBOutlet weak var emailSignup: UITextField!
    @IBOutlet weak var passwordSignup: UITextField!
    
    var isPsyco : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//
//        //MARK: Confirm the existence of the account
//        if Auth.auth().currentUser != nil {
//            performSegue(withIdentifier: "toHome", sender: nil)
//        }
//    }

    // MARK: - Switch
    
    @IBAction func switchUser(_ sender: UISwitch) {
        if sender.isOn {
            isPsyco = true
        }
    }
    
    
    // MARK: - Signup Button

    @IBAction func signupTapped(_ sender: UIButton) {
        if nameSignup.text?.isEmpty == true || emailSignup.text?.isEmpty == true || passwordSignup.text?.isEmpty == true {
            
            let message: MessageView = MessageView.viewFromNib(layout: .cardView)
            message.configureTheme(.warning)
            message.configureContent(body: "Please fill Name, Email and Password".localaized)
            var config = SwiftMessages.defaultConfig
//                    config.presentationContext = .view(view)
            config.duration = .automatic
            config.presentationStyle = .top
            
            SwiftMessages.show(config: config, view: message)
            return
            
//            let alert = UIAlertController(title: "Invalid Signup".localaized, message: "Please fill name, email and password".localaized, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok".localaized, style: .default, handler: nil))
//            self.present(alert, animated: true)
        } else {
            signup()
        }
    }
    
    // MARK: -  Button to go to the Login page ..

    @IBAction func loginTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    // MARK: - Auth for create account ..
    
    func signup() {
        
        Auth.auth().createUser(withEmail: emailSignup.text ?? "", password: passwordSignup.text ?? "") { authResult, error in
            if let error = error {
                //==============
                let message: MessageView = MessageView.viewFromNib(layout: .cardView)
                message.configureTheme(.error)
                message.configureContent(body:"The email address is already in use by another account.".localaized)
                var config = SwiftMessages.defaultConfig
    //                    config.presentationContext = .view(view)
                config.duration = .automatic
                config.presentationStyle = .top
                
                SwiftMessages.show(config: config, view: message)
                return
                
//                let alert = UIAlertController(title: "", message: "Error", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
                print(error.localizedDescription)
                
            } else {
                UserApi.addUser(name: self.nameSignup.text ?? "", uid: authResult?.user.uid ?? "", email: self.emailSignup.text ?? "", isPsyco: self.isPsyco, completion: { check in
                    if check {
                        print("Done Saving")
                        self.performSegue(withIdentifier: "toHome", sender: nil)
                    }
            })
            }
            guard error == nil else {
                print("Error \(String(describing: error?.localizedDescription))")
                return
            }
        }
    }
}
