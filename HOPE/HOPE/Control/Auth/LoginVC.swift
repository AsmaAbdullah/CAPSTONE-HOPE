//
//  LoginVC.swift
//  HOPE
//
//  Created by Asma on 08/12/2021.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var emailLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        checkUserInfo()
//    }
    
    // MARK: - Login Button
    
    @IBAction func loginTapped(_ sender: UIButton) {
        if emailLogin.text?.isEmpty ?? true || passwordLogin.text?.isEmpty ?? true {
            let alert = UIAlertController(title: "Invalid Login", message: "Please fill email and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
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
                let alert = UIAlertController(title: "IOh ", message: "This email is not already Signup", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self?.present(alert, animated: true)
                    print(error.localizedDescription)
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
