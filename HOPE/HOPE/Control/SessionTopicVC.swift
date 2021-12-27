//
//  SessionTopicVC.swift
//  HOPE
//
//  Created by Asma on 27/12/2021.
//

import UIKit

class SessionTopicVC: UIViewController {

    var selectedListSession: SetDetile!
    
    
    @IBOutlet weak var firstSubTitleSession: UILabel!
    @IBOutlet weak var firstSessionContent: UILabel!
    @IBOutlet weak var secondSubTitleSession: UILabel!
    @IBOutlet weak var secondSessionContent: UILabel!
    
    
    
    @IBOutlet weak var sessionImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstSubTitleSession.text = selectedListSession.setFirstSubHead
        firstSessionContent.text = selectedListSession.setFirstContent
        secondSubTitleSession.text = selectedListSession.setSecondSubhead
        secondSessionContent.text = selectedListSession.setSecondContent
        
    }
    
    @IBAction func continueSession(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toEndOfSession", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? EndOfSessionVC {
            vc.selectedListSession = selectedListSession
        }
    }
}
