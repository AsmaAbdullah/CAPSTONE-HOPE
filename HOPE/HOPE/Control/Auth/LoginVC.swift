//
//  LoginVC.swift
//  HOPE
//
//  Created by Asma on 08/12/2021.
//

import UIKit
import FirebaseAuth
import Firebase
import SwiftMessages


class LoginVC: UIViewController {
    
    //MARK: Outlet for email and password
    
    @IBOutlet weak var emailLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Gesture Recognizer TAP
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //MARK: Confirm the existence of the account
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "toHome", sender: nil)
        }
    }
    
    //MARK: - A button to check whether the data is filled in
    
    @IBAction func loginTapped(_ sender: UIButton) {
        if emailLogin.text?.isEmpty ?? true || passwordLogin.text?.isEmpty ?? true {
            
            let message: MessageView = MessageView.viewFromNib(layout: .cardView)
            message.configureTheme(.warning)
            message.configureContent(body: "Please fill Email and Password".localaized)
            var config = SwiftMessages.defaultConfig
            config.presentationContext = .view(view)
            config.duration = .automatic
            config.presentationStyle = .top
            
            SwiftMessages.show(config: config, view: message)
            return
            
        } else {
            login()
        }
    }
    
    
    // MARK: -  Button to go to the Signup page ..
    
    @IBAction func signupTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Signup")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    // MARK: - Auth for Login ..
    
    func login() {
        Auth.auth().signIn(withEmail: emailLogin.text ?? "", password: passwordLogin.text ?? "") { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            if let error = error {
                
                let message: MessageView = MessageView.viewFromNib(layout: .cardView)
                message.configureTheme(.error)
                message.configureContent(body: "This email is not already Signup".localaized)
                var config = SwiftMessages.defaultConfig
                //                    config.presentationContext = .view(view)
                config.duration = .automatic
                config.presentationStyle = .top
                
                SwiftMessages.show(config: config, view: message)
                return
                
            } else {
                self?.performSegue(withIdentifier: "toHome", sender: nil)
            }
            //                self?.checkUserInfo()
        }
    }
    
    
    //        func checkUserInfo() {
    //            if Auth.auth().currentUser != nil {
    //                print(Auth.auth().currentUser?.uid)
    //            }
    //        }
    
    
}
