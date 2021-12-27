//
//  SessionContent.swift
//  HOPE
//
//  Created by Asma on 09/12/2021.
//

import UIKit
import CoreData

class SessionContent: UIViewController {
    
    
    var selectedSession: Session!
    var arraySession = [Session]()
    
    @IBOutlet weak var imageSession: UIImageView!
    @IBOutlet weak var titleSession: UILabel!
    @IBOutlet weak var sessionContent: UILabel!
    
    
    // MARK: - SAVE CORE DATA
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BeneficiarySessions")
        container.loadPersistentStores (completionHandler: { desc, error in
            if let readError = error {
                print(readError)
            }
        })
        return container
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSession.image = UIImage(named: selectedSession.image)
        titleSession.text = selectedSession.titleSessions
        sessionContent.text = selectedSession.Content
    }
    
    @IBAction func enrollSession(_ sender: UIButton) {
        
        createNewList(titleSession: selectedSession.titleSessions  , imageSession:  selectedSession.image)
        
        let alertController = UIAlertController(title: "", message: "Has been successfully added", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - CORE-DATA
    
    func createNewList(titleSession: String, imageSession: String){
        
        let context = persistentContainer.viewContext
        context.performAndWait {
            let list = YourSessionsList(context: context)
            list.titleSession = titleSession
            list.imageSession = imageSession
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
    
    
    
}
