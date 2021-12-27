//
//  YourSessionsVC.swift
//  HOPE
//
//  Created by Asma on 14/12/2021.
//

import UIKit
import CoreData


class YourSessionsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arraySession = [Session]()
    var selectedSession: Session!
    
    var listSession = [SessionDetile]()
    var selectedListSession: SetDetile?
    
    //    var listSession = [SessionDetile]()
    //    var selectedListSessions: Sessions!
    
    
    
    
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
        
        setListSession()
        
        
        //        let theSession = listSession.first(where: { sessionDetail in
        //            return sessionDetail.title == self.selectedSession.titleSessions
        //        }) //
        
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
        
        cell.imageView?.layer.cornerRadius = 12
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        cell.imageView?.layer.borderWidth = 1.0
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = listSession[indexPath.row]
        selectedListSession = SetDetile(setTitle: data.title, setImageSession: data.imageSession, setDefinition: data.definition, setFirstSubHead: data.firstSubHead, setFirstContent: data.firstContent, setSecondSubhead: data.secondSubhead, setSecondContent: data.secondContent, setThirdSubhead: data.thirdSubhead, setThirdContent: data.thirdContent)
        
        //        selectedListSession = listSession[indexPath.row]
        performSegue(withIdentifier: "toSession", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? SessionsVC {
            vc.selectedListSession = selectedListSession
        }
        //        if segue.identifier == "toSessionDetiles" {
        //            let destunation = segue.destination as! SessionsVC
        //            destunation.selectedSession = selectedSession
        //        }
        
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
    
    fileprivate func setListSession() {
        listSession.append(SessionDetile.init(title: "Self-Image and Cancer", imageSession: UIImage(resource: .Session1)!, definition: "Self-image is how a person views himself or herself. Because of the many physical and emotional changes after a cancer diagnosis, people may experience positive and negative changes to their self-image.", firstSubHead: "Physical changes", firstContent: "Both cancer and its treatment may change how you look. How you feel about your appearance is called body image. Many people with cancer feel self-conscious about changes to their bodies. Some of the more common physical changes of cancer include:\n- Hair loss\n- Weight gain or weight loss\n- Surgery scars\n- Rash, typically from drug therapies\n- Loss of an organ, limb, or breast\n- The need for an ostomy, which is a surgical opening that allows bodily waste to exit the body into a bag\n- Fatigue or loss of energy, which can cause you to give up activities you once enjoyed.\n  Many of these changes will resolve or get better as time passes after treatment. But make sure to share any concerns you have with your health care team. Ask them for more information about ways to relieve these symptoms or the emotional discomfort you may feel because of them.", secondSubhead: "Emotional changes", secondContent: "Cancer disrupts so many parts of a person’s life, from relationships to work and hobbies. Depending on the seriousness of the illness and the chance of recovery, it may also force you to make changes to your future and deal with the chance of dying. During this time, you may feel many different emotions:\n- Sadness, Anxiety\n- Loneliness or a sense of being different from others\n- Fear, Anger, Frustration, Guilt\n- Feeling out of control\n- A change in the way you think about yourself and the future.\n But many people with cancer have also reported positive changes. These positive changes can be emotional, spiritual, or intellectual. For example, you may feel:\n- An appreciation for the strength of your body.\n- Peace, Gratitude\n- Awareness and appreciation that life is short and special.\n- Grateful for new important relationships with caregivers and other patients.\n- A shift in priorities.\n- Clarity about meaning in life and personal goals", thirdSubhead: "Coping with self-image changes", thirdContent: "You may view yourself and your body differently after cancer. These tips may help you cope:\n- Allow time to adjust. Accepting a cancer diagnosis and undergoing treatment may change your life. It takes time to adapt.\n- Talk with others who have been in similar situations.\n- Build a network of friends and family who can support you and help you feel positive.\n- Ask for and accept help. Pass off tasks that take up your energy and are not pleasing to you.\n- Stay calm and, if you are able, embrace humor.\n- Ask your health care team about possible reconstructive surgery, prosthetic devices, and/or cosmetic solutions.\n- As much as possible, remain active.\n- Seek counseling."))
        
        listSession.append(SessionDetile.init(title: "Coping With Uncertainty", imageSession: UIImage(resource: .Session2)!, definition: "Many people with cancer may feel a lack of certainty about what the future holds. After a cancer diagnosis, you may feel that your life is less secure than it once was. It is important to ask for support when you are feeling this way.", firstSubHead: "Causes of uncertainty", firstContent: "Both newly diagnosed patients and long-term survivors have common worries. These may include: Having to put plans on hold. You may feel like you are unable to look to the future. Making plans is difficult for many practical reasons. For instance, it can be hard to plan a family vacation when you may not know exactly when you will have treatment. Some people feel unable to make any plans. One approach that works well for many people with cancer is to remain flexible and accept that plans may change. Fear about cancer treatment and side effects. You may be worried or scared of the possible side effects of treatment, such as pain, nausea, or fatigue. Or you may fear becoming dependent on others during cancer treatment or missing activities that you enjoy. Long-term cancer survivors may worry about having late effects. These are side effects of cancer treatment that happen months or years after treatment ends. Talk with your health care team about possible late effects and how they can be managed. The treatment will not work. No treatment works the same for every person, even those with the same type of cancer. Some treatments are more effective for some people. Other treatments may work but cause side effects. Understanding what your treatment options are today and in the future may help you know what to expect next. Fear of dying or losing someone you love. Facing the idea of dying can be difficult. Feeling fear is natural when you think about dying or losing someone you love. It’s normal to struggle with a fear of death. Yet, if these feelings become stronger, talk with your health care team about resources to help you cope.", secondSubhead: "Dealing with the “what ifs” of cancer", secondContent: "Acknowledging the unknowns of cancer may make you feel anxious, angry, sad, or afraid. You may even have physical symptoms from these feelings. For instance, it may cause sleeping problems or make it harder to focus at work. Learning to manage the uncertainty is an important part of staying healthy. These tips may help you cope: Recognize that there are situations you can control and those you cannot. As hard as it sounds, many people find it helpful to let go of those things that they cannot change and focus on their reaction to events. Talk with your health care team if your feelings of uncertainty are affecting your daily life. They can help you find the resources you need to feel better. Talk with a counselor or social worker at the hospital. They may recommend a support group in your area. A group may help you share with others who are going through a similar cancer experience. There are also support communities online that you can join. Talk with friends and family members. Tell them how you are feeling and how they can help.", thirdSubhead: "", thirdContent: ""))
    }
}
