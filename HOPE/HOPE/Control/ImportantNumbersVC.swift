//
//  ImportantNumbersVC.swift
//  HOPE
//
//  Created by Asma on 30/12/2021.
//

import UIKit

class ImportantNumbersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    var arrayNumber = [PhoneNumber]()
    
    @IBOutlet weak var numberTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTableView.delegate = self
        numberTableView.dataSource = self
        setInformation()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberCell", for: indexPath) as! NumberTableViewCell
        let data = arrayNumber[indexPath.row]
        cell.setUpCell(title: data.title, number: data.number)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    
    
    func setInformation() {
        arrayNumber.append(PhoneNumber.init(title: "(937) Service", number: "937"))
        arrayNumber.append(PhoneNumber.init(title: "National Center (NCMH)", number: "920033360"))
        arrayNumber.append(PhoneNumber.init(title: "Atfalona Association", number: "0555886470"))
        arrayNumber.append(PhoneNumber.init(title: "Zahra Association", number: "0114833652"))
        arrayNumber.append(PhoneNumber.init(title: "Amass Association", number: "0114415566"))
        arrayNumber.append(PhoneNumber.init(title: "Saudi Cancer Society", number: "0114402025"))
        arrayNumber.append(PhoneNumber.init(title: "Al-Hayat Association", number: "0545939786"))
        arrayNumber.append(PhoneNumber.init(title: "Tfaul Association", number: "0135621112"))
        arrayNumber.append(PhoneNumber.init(title: "Tahoor Association", number: "0163638181"))
        arrayNumber.append(PhoneNumber.init(title: "Sanad Association", number: "920029997"))
        arrayNumber.append(PhoneNumber.init(title: "Basma Association", number: "0165310022"))
        arrayNumber.append(PhoneNumber.init(title: "King Faisal Specialist Hospital", number: "199019"))
    }
    
    @IBAction func callFunc(_ sender: UIButton) {

        
    }
    
    
    
    
}
