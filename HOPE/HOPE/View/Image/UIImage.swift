//
//  UIImage.swift
//  HOPE
//
//  Created by Asma on 09/12/2021.
//

import Foundation
import UIKit

enum UIImageResource: String {
    case ads1 = "ads1"
    case ads2 = "ads2"
    case ads3 = "ads3"
    case ads4 = "ads4"
    case ads5 = "ads5"
    case ads6 = "ads6"

    case Session1 = "Session1"
    case Session2 = "Session2"
    case Session3 = "Session3"
    case Session4 = "Session4"
    case Session5 = "Session5"
    case Session6 = "Session6"
    case Session7 = "Session7"
    case Session8 = "Session8"
    case Session9 = "Session9"
    
    
}


extension UIImage {
    convenience init?(resource: UIImageResource){
        self.init(named: resource.rawValue)
    }
}
