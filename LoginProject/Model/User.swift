//
//  User.swift
//  LoginProject
//
//  Created by Adi Amoyal on 16/02/2023.
//

import Foundation

class UserModel {
    var userId: String? = ""
    var fullName: String? = ""
    var email: String? = ""

    static func FromJson(json:[String:Any]) -> UserModel {
        let user = UserModel()
        user.userId = json["userId"] as? String
        user.fullName = json["fullName"] as? String
        user.email = json["email"] as? String
        return user
    }
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["userId"] = self.userId
        json["fullName"] = self.fullName
        json["email"] = self.email
       return json
    }
}
