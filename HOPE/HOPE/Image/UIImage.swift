//
//  UIImage.swift
//  HOPE
//
//  Created by Asma on 09/12/2021.
//

import Foundation
import UIKit

enum UIImageResource: String {
    case One = "One"
    case Two = "Two"
    case Three = "Three"
    case Four = "Four"
    
    case Session1 = "Session1"
    case Session2 = "Session2"
    case Session3 = "Session3"
    
}


extension UIImage {
    convenience init?(resource: UIImageResource){
        self.init(named: resource.rawValue)
    }
}
