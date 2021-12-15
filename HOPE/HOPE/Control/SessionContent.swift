//
//  SessionContent.swift
//  HOPE
//
//  Created by Asma on 09/12/2021.
//

import UIKit

class SessionContent: UIViewController {

    
    var selectedArraySession: Session?
    var setSelectedArraySession: Session?
    
    @IBOutlet weak var imageSession: UIImageView!
    @IBOutlet weak var titleSession: UILabel!
    @IBOutlet weak var sessionContent: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setSelectedArraySession = selectedArraySession
        imageSession.image = setSelectedArraySession?.image
        titleSession.text = setSelectedArraySession?.titleSessions
        sessionContent.text = setSelectedArraySession?.Content
    }
    
    @IBAction func enrollSession(_ sender: UIButton) {
        let enrollSession = sessionTable(theTitle: titleSession.text ?? "", theImage: UIImage(named: imageSession.image)) 
        yourSessions.item.append(enrollSession)
        
        let alertController = UIAlertController(title: "", message: "Has been successfully added", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
