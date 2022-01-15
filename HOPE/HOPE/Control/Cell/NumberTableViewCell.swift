//
//  NumberTableViewCell.swift
//  HOPE
//
//  Created by Asma on 30/12/2021.
//

import UIKit
import SwiftMessages

class NumberTableViewCell: UITableViewCell {
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: Action button to copy the number
    @IBAction func clickToCall(_ sender: UIButton) {
        
        UIPasteboard.general.string = numberLabel.text
        
        let message: MessageView = MessageView.viewFromNib(layout: .cardView)
        message.configureTheme(.info)
        message.configureContent(title: "", body: "The Number Has Been Copied".localaized, iconImage: .checkmark)
        var config = SwiftMessages.defaultConfig
        config.presentationContext = .automatic
        config.duration = .automatic
        config.presentationStyle = .top
        SwiftMessages.show(config: config, view: message)
        
        }
    
    func setUpCell(title: String, number: String) {
        titleLabel.text = title
        numberLabel.text = number
    }
}
