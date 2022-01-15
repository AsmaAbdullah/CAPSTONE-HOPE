//
//  ImportantNumbersVC.swift
//  HOPE
//
//  Created by Asma on 30/12/2021.
//

import UIKit

class ImportantNumbersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var importantNumber = [PhoneNumber]()
    
    //MARK: Outlet table view..
    
    @IBOutlet weak var numberTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTableView.delegate = self
        numberTableView.dataSource = self
    
        setPhoneNumber()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return importantNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberCell", for: indexPath) as! NumberTableViewCell
        let data = importantNumber[indexPath.row]
        cell.titleLabel.text = data.title
        cell.numberLabel.text = data.number
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    //MARK: Function for the data displayed in the application

    fileprivate func setPhoneNumber() {
        importantNumber.append(PhoneNumber.init(title: "(937) Service".localaized, number: "937"))
        importantNumber.append(PhoneNumber.init(title: "National Center (NCMH)".localaized, number: "920033360"))
        importantNumber.append(PhoneNumber.init(title: "King Faisal Specialist Hospital".localaized, number: "199019"))
        importantNumber.append(PhoneNumber.init(title: "Saudi Cancer Society".localaized, number: "0114402025"))
        importantNumber.append(PhoneNumber.init(title: "Zahra Association".localaized, number: "0114833652"))
        importantNumber.append(PhoneNumber.init(title: "Sanad Association".localaized, number: "920029997"))
        importantNumber.append(PhoneNumber.init(title: "Basma Association".localaized, number: "0165310022"))
        importantNumber.append(PhoneNumber.init(title: "Atfalona Association".localaized, number: "0555886470"))
        importantNumber.append(PhoneNumber.init(title: "Amass Association".localaized, number: "0114415566"))
        importantNumber.append(PhoneNumber.init(title: "Al-Hayat Association".localaized, number: "0545939786"))
        importantNumber.append(PhoneNumber.init(title: "Tfaul Association".localaized, number: "0135621112"))
        importantNumber.append(PhoneNumber.init(title: "Tahoor Association".localaized, number: "0163638181"))
    }
    
}

