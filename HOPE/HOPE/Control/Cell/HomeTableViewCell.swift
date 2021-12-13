//
//  HomeTableViewCell.swift
//  HOPE
//
//  Created by Asma on 09/12/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imageSession: UIImageView!
    @IBOutlet weak var titleSession: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageSession.layer.cornerRadius = 12
        imageSession.layer.borderColor = UIColor.lightGray.cgColor
        imageSession.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    func setUpCell(imageSessi: UIImage, titleSessi: String) {
        imageSession.image = imageSessi
        titleSession.text = titleSessi
    }
}
