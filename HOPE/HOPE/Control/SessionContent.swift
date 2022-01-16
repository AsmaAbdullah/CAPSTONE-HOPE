//
//  SessionContent.swift
//  HOPE
//
//  Created by Asma on 09/12/2021.
//

import UIKit
import CoreData
import FirebaseAuth
import FirebaseFirestore
import SwiftMessages

class SessionContent: UIViewController {
    
    
    var selectedSession: Session!
    var arraySession = [Session]()
    var yourSessionsList: [YourSessionsList] = []
    
    //MARK: Outlet for image, title, content of the sessions
    
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
        
        imageSession.layer.cornerRadius = 12
        imageSession.layer.borderColor = UIColor.lightGray.cgColor
        imageSession.layer.borderWidth = 1.0
    }
    
    
    //MARK: Action to add the session to your sessions page
    @IBAction func enrollSession(_ sender: UIButton) {
        
        
        //MARK: Checks if the session is already added or not
        var check = false
        let sessionsLists = fetchAllLists()
        
        for sessionList in sessionsLists {
            if sessionList.titleSession == selectedSession.titleSessions {
                
                warning()
                check = true
            }
        }
        if !check {
            success()
            //MARK: Add the session to your sessions
            createNewList(titleSession: selectedSession.titleSessions, imageSession:  selectedSession.image)
            
        }
    }
    
    
    
    //MARK:  CORE-DATA | The function of saving data in the coredata
    
    func createNewList(titleSession: String, imageSession: String){
        
        let context = persistentContainer.viewContext
        context.performAndWait {
            let list = YourSessionsList(context: context)
            list.titleSession = titleSession
            list.imageSession = imageSession
            list.uid = Auth.auth().currentUser?.uid ?? ""
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
    
    func fetchAllLists() -> [YourSessionsList]{
        let context = persistentContainer.viewContext
        var yourSessionsList : [YourSessionsList] = []
        
        do {
            yourSessionsList = try context.fetch(YourSessionsList.fetchRequest())
        } catch {
            print(error)
        }
        
        return yourSessionsList
    }
    
    //MARK: Function for alert
    
    fileprivate func warning() {
        let message: MessageView = MessageView.viewFromNib(layout: .cardView)
        message.configureTheme(.warning)
        message.configureContent(body: "You Already have added this session".localaized)
        var config = SwiftMessages.defaultConfig
        config.presentationContext = .view(view)
        config.duration = .automatic
        config.presentationStyle = .top
        SwiftMessages.show(config: config, view: message)
    }
    
    fileprivate func success() {
        let message: MessageView = MessageView.viewFromNib(layout: .cardView)
        message.configureTheme(.success)
        message.configureContent(body: "Has been successfully added".localaized)
        var config = SwiftMessages.defaultConfig
        config.presentationContext = .view(view)
        config.duration = .automatic
        config.presentationStyle = .top
        SwiftMessages.show(config: config, view: message)
    }
}
