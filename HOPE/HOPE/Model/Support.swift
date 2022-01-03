//
//  SupportRegion.swift
//  HOPE
//
//  Created by Asma on 01/01/2022.
//

import Foundation

struct Support {
  var facilityName: [String]
  var phoneNumber: PhoneNumber

  var localizedName: String {
    return facilityName
      .map(localizedDescription(forRegionCode:))
      .joined(separator: ", ")
  }
}

private func localizedDescription(forRegionCode code: String) -> String {
  return Locale.current.localizedString(forRegionCode: code) ?? code
}
