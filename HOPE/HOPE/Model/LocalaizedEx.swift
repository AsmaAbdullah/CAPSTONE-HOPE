//
//  LocalaizedEx.swift
//  HOPE
//
//  Created by Asma on 11/01/2022.
//

import Foundation

extension String {
    var localaized: String {
        return NSLocalizedString(self, comment: "")
    }
}
