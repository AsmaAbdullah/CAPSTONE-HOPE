//
//  StructSession.swift
//  HOPE
//
//  Created by Asma on 09/12/2021.
//

import Foundation
import UIKit

// MARK: Struct for tableview

struct Session {
    var image: String
    var titleSessions: String
    var Content: String
}
// MARK: Struct for sessions

struct SessionDetile {
    var title: String
    var imageSession: UIImage
    var definition: String
    var firstSubHead: String
    var firstContent: String
    var secondSubhead: String
    var secondContent: String
    var thirdSubhead: String
    var thirdContent: String
}

struct SetDetile {
    var setTitle: String
    var setImageSession: UIImage
    var setDefinition: String
    var setFirstSubHead: String
    var setFirstContent: String
    var setSecondSubhead: String
    var setSecondContent: String
    var setThirdSubhead: String
    var setThirdContent: String
}

struct PhoneNumbers {
    var title: String
    var number: String
}

struct MeasuresInfo {
    var title: String
    var image: UIImage
}



