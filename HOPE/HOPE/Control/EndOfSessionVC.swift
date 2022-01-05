//
//  EndOfSessionVC.swift
//  HOPE
//
//  Created by Asma on 27/12/2021.
//

import UIKit
import Cosmos

class EndOfSessionVC: UIViewController {

    var selectedListSession: SetDetile!

    
    @IBOutlet weak var subTitleSession: UILabel!
    @IBOutlet weak var sessionContent: UILabel!
    @IBOutlet weak var buttoneDone: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subTitleSession.text = selectedListSession.setThirdSubhead
        sessionContent.text = selectedListSession.setThirdContent
        
        // ======================
        subTitleSession.alpha = 0
        sessionContent.alpha = 0
        buttoneDone.alpha = 0
    }

    @IBAction func endOfSession(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Rate\n\n\n", message: "", preferredStyle: .actionSheet)
        let ratingView = CosmosView(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        
        ratingView.rating = 0
        ratingView.settings.starSize = 30
        ratingView.settings.emptyBorderColor = UIColor.black
        ratingView.settings.updateOnTouch = true
        ratingView.frame.origin.x = alert.view.frame.width/2 - 100
        ratingView.frame.origin.y = 40
        
        alert.addAction(UIAlertAction(title: "Rate", style: .default, handler: { (alert) in
           
//            self.performSegue(withIdentifier: "backHome", sender: nil)
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "backHome")
//            vc.modalPresentationStyle = .automatic
//            self.present(vc, animated: true)
        }))
          
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        alert.view.addSubview(ratingView)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, animations: { self.subTitleSession.alpha = 1
        }) { (true) in
                self.animationContent()
            }
    }
        
        func animationContent() {
            UIView.animate(withDuration: 1, animations: {
                self.sessionContent.alpha = 1
            }) { (true) in
                self.animationButtone()
            }
        }
    func animationButtone() {
        UIView.animate(withDuration: 1, animations: {
            self.buttoneDone.alpha = 1
        }) 
    }
}
