//
//  SessionContent.swift
//  HOPE
//
//  Created by Asma on 09/12/2021.
//

import UIKit
import CoreData

class SessionContent: UIViewController {

    
    var selectedArraySession: Session!
    
    var arrayOfTable = [sessionTable]() //

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

        imageSession.image = UIImage(named: selectedArraySession.image)
        titleSession.text = selectedArraySession.titleSessions
        sessionContent.text = selectedArraySession.Content
    }
    
    @IBAction func enrollSession(_ sender: UIButton) {
   
        createNewList(titleSession: selectedArraySession.titleSessions  , imageSession:  selectedArraySession.image)
         
        
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
