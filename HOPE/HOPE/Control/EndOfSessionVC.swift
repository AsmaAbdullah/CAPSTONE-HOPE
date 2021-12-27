//
//  EndOfSessionVC.swift
//  HOPE
//
//  Created by Asma on 27/12/2021.
//

import UIKit

class EndOfSessionVC: UIViewController {

    var selectedListSession: SetDetile!

    
    @IBOutlet weak var subTitleSession: UILabel!
    @IBOutlet weak var sessionContent: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subTitleSession.text = selectedListSession.setThirdSubhead
        sessionContent.text = selectedListSession.setThirdContent
    }

    @IBAction func endOfSession(_ sender: UIButton) {
            
    }

}
