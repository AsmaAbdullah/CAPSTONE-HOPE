//
//  ProfileVC.swift
//  HOPE
//
//  Created by Asma on 12/12/2021.
//

import UIKit

class ProfileVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func darkMood(_ sender: UISwitch) {
        
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
    
    
}

