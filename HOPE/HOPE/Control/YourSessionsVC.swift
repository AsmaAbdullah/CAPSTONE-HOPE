//
//  YourSessionsVC.swift
//  HOPE
//
//  Created by Asma on 14/12/2021.
//

import UIKit
import CoreData


class YourSessionsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var arrayOfTable = [sessionTable]()
    
    //var selectedArraySession: Session?
    
    // MARK: - CORE-DATA
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BeneficiarySessions")
        
        container.loadPersistentStores (completionHandler: { desc, error in
            if let readError = error {
                print(readError)
            }
        })
        return container
    }()

   var yourSessionsList: [YourSessionsList] = []

    @IBOutlet weak var yourSessionTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yourSessionTable.delegate = self
        yourSessionTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.fetchAllLists()
        self.yourSessionTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yourSessionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "yourSessionCell", for: indexPath)
        cell.textLabel?.text = yourSessionsList[indexPath.row].titleSession
        cell.imageView?.image = UIImage(named: yourSessionsList[indexPath.row].imageSession ?? "")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedArraySession = arraySession[indexPath.row]
        
        performSegue(withIdentifier: "toContent", sender: nil)
    }
    
    
    
    //MARK: - Fetch for COREDATA
    
    func fetchAllLists() {
        let context = persistentContainer.viewContext
        do {
            yourSessionsList = try context.fetch(YourSessionsList.fetchRequest())
        } catch {
            print(error)
        }
    }
}


func setTopicOfSessions() {
    
    
}
