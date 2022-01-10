//
//  SignupVC.swift
//  HOPE
//
//  Created by Asma on 08/12/2021.
//

import UIKit
import FirebaseAuth
import Firebase

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
            let alert = UIAlertController(title: "Invalid Signup", message: "Please fill name, email and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            signup()
        }
        performSegue(withIdentifier: "toHome", sender: nil)
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
