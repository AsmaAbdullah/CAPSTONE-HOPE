//
//  SessionsVC.swift
//  HOPE
//
//  Created by Asma on 16/12/2021.
//

import UIKit

class SessionsVC: UIViewController {

    
    var selectedListSession: SessionDetile!

    @IBOutlet weak var titleSession: UILabel!
    @IBOutlet weak var imageSession: UIImageView!
    @IBOutlet weak var firstSubHead: UILabel!
    @IBOutlet weak var firstContent: UILabel!
    @IBOutlet weak var secondSubHead: UILabel!
    @IBOutlet weak var secondContent: UILabel!
    @IBOutlet weak var thirdSubHead: UILabel!
    @IBOutlet weak var thirdContent: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleSession.text = selectedListSession.title
        imageSession.image = selectedListSession.imageSession
        firstSubHead.text = selectedListSession.firstSubHead
        firstContent.text = selectedListSession.firstContent
        secondSubHead.text = selectedListSession.secondSubhead
        secondContent.text = selectedListSession.secondContent
        thirdSubHead.text = selectedListSession.thirdSubhead
        thirdContent.text = selectedListSession.thirdContent
    }
    
    @IBAction func finishSession(_ sender: UIButton) {
    }
}

