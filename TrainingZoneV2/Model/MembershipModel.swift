//
//  MembershipModel.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//


import UIKit

struct MembershipModel {
    
    var posterImage: UIImage?
    var membershipTitle: String
    var membershipDescription: String
    var price: Int
    
    init(posterImage: UIImage?, membershipTitle: String, membershipDescription: String, price: Int) {
        self.posterImage = posterImage
        self.membershipTitle = membershipTitle
        self.membershipDescription = membershipDescription
        self.price = price
        
    }
    
}
