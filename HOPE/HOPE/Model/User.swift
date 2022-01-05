//
//  User.swift
//  HOPE
//
//  Created by Asma on 09/12/2021.
//

import Foundation
import UIKit

class User {
    
    var name:String?
    var email: String?
    var isPsyco: Bool?
    var mySession: [String]?
}
extension User {
    
    static func getUser(dict: [String: Any]) -> User {
       
        let user = User()
        
        user.name = dict["name"] as? String
        user.email = dict["email"] as? String
        user.isPsyco = dict["isPsyco"] as? Bool
        user.mySession = dict["mySession"] as? [String]
       
        return user
    }
    static func CreateUser(name:String, email:String, isPsyco:Bool, mySession:[String]) -> [String: Any] {
       
        let newUser = ["name":name,
                       "email" :email,
                       "isPsyco": isPsyco,
                       "mySession": mySession
                    ] as [String : Any]
        return newUser
    }
}

