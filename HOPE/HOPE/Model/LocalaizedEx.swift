//
//  LocalaizedEx.swift
//  HOPE
//
//  Created by Asma on 11/01/2022.
//

import Foundation

//MARK: Extension String to translate the application into another language

extension String {
    var localaized: String {
        return NSLocalizedString(self, comment: "")
    }
}
