//
//  NumberTableViewCell.swift
//  HOPE
//
//  Created by Asma on 30/12/2021.
//

import UIKit

class NumberTableViewCell: UITableViewCell {
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func clickToCall(_ sender: UIButton) {

        
        }
        
        

    
    func setUpCell(title: String, number: String) {
        titleLabel.text = title
        numberLabel.text = number
    }

}
