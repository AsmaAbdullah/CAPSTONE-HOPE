//
//  EndOfSessionVC.swift
//  HOPE
//
//  Created by Asma on 27/12/2021.
//

import UIKit

class EndOfSessionVC: UIViewController {
    
    var selectedListSession: SetDetile!
    
    //MARK: Outlet for title, content and button
    
    @IBOutlet weak var subTitleSession: UILabel!
    @IBOutlet weak var sessionContent: UILabel!
    @IBOutlet weak var buttoneDone: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subTitleSession.text = selectedListSession.setThirdSubhead
        sessionContent.text = selectedListSession.setThirdContent
        
        subTitleSession.alpha = 0
        sessionContent.alpha = 0
        buttoneDone.alpha = 0
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, animations: { self.subTitleSession.alpha = 1
        }) { (true) in
            self.animationContent()
        }
    }
    
    
    //MARK: Back button to the home page
    
    @IBAction func endOfSession(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "backHome", sender: nil)
    }
    func animationContent() {
        UIView.animate(withDuration: 1, animations: {
            self.sessionContent.alpha = 1
        }) { (true) in
            self.animationButtone()
        }
    }
    
    //MARK: Function for animation the displayed data
    
    func animationButtone() {
        UIView.animate(withDuration: 1, animations: {
            self.buttoneDone.alpha = 1
        })
    }
}
