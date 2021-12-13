//
//  User.swift
//  HOPE
//
//  Created by Asma on 09/12/2021.
//

import Foundation


class User {
    
    var name:String?
    var email: String?
    var isPsyco: Bool?
}
extension User {
    
    static func getUser(dict: [String: Any]) -> User {
       
        let user = User()
        
        user.name = dict["name"] as? String
        user.email = dict["email"] as? String
        user.isPsyco = dict["isPsyco"] as? Bool
       
        return user
    }
    static func CreateUser(name:String,email:String, isPsyco:Bool) -> [String: Any] {
       
        let newUser = ["name":name,
                       "email" :email,
                       "isPsyco": isPsyco
                    ] as [String : Any]
        return newUser
    }
}

