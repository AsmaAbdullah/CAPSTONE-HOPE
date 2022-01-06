//
//  ImportantNumbersVC.swift
//  HOPE
//
//  Created by Asma on 30/12/2021.
//

import UIKit

class ImportantNumbersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    private var isOpeningPhoneURL = false

    let numbers = [
        Support(facilityName: ["(937) Service"], phoneNumber: PhoneNumber("937")),
        Support(facilityName: ["National Center (NCMH)"], phoneNumber: PhoneNumber("920033360")),
        Support(facilityName: ["Atfalona Association"], phoneNumber: PhoneNumber("0555886470")),
        Support(facilityName: ["Zahra Association"], phoneNumber: PhoneNumber("0114833652")),
        Support(facilityName: ["Amass Association"], phoneNumber: PhoneNumber("0114415566")),
        Support(facilityName: ["Saudi Cancer Society"], phoneNumber: PhoneNumber("0114402025")),
        Support(facilityName: ["Al-Hayat Association"], phoneNumber: PhoneNumber("0545939786")),
        Support(facilityName: ["Tfaul Association"], phoneNumber: PhoneNumber("0135621112")),
        Support(facilityName: ["Tahoor Association"], phoneNumber: PhoneNumber("0163638181")),
        Support(facilityName: ["Sanad Association"], phoneNumber: PhoneNumber("920029997")),
        Support(facilityName: ["Basma Association"], phoneNumber: PhoneNumber("0165310022")),
        Support(facilityName: ["King Faisal Specialist Hospital"], phoneNumber: PhoneNumber("199019")),
    ]
    
    @IBOutlet weak var numberTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTableView.delegate = self
        numberTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberCell", for: indexPath) as! NumberTableViewCell
        let data = numbers[indexPath.row]
        cell.titleLabel.text = data.localizedName
        cell.numberLabel.text = data.phoneNumber.rawValue
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let number = numbers[indexPath.row]

      UIApplication.shared.open(number.phoneNumber.url) { success in
        if success {
          self.isOpeningPhoneURL = true
        } else {
          tableView.deselectRow(at: indexPath, animated: true)
        }
      }
    }
}

