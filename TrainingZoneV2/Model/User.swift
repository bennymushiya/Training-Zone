//
//  User.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

struct User: Codable {
    
    var fullname: String
    var email: String
    var isMember: Bool
    var userId: String
    var membershipType: String
    
    init(dictionary: [String: Any]) {
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.isMember = dictionary["isMember"] as? Bool ?? false
        self.userId = dictionary["userId"] as? String ?? ""
        self.membershipType = ["membershipType"] as? String ?? ""

    }
}



struct SripeUser: Codable {
    
    var email: String
    var id: String
    var stripeId: String
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.stripeId = dictionary["stripeId"] as? String ?? ""

    }
       
}
