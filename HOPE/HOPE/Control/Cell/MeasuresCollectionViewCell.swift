//
//  MeasuresCollectionViewCell.swift
//  HOPE
//
//  Created by Asma on 03/01/2022.
//

import UIKit

class MeasuresCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageMeasure: UIImageView!
    @IBOutlet weak var titleMeasure: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageMeasure.layer.cornerRadius = 12
        imageMeasure.layer.borderColor = UIColor.lightGray.cgColor
        imageMeasure.layer.borderWidth = 1.0
    }
    
    
    
}
