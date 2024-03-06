//
//  MembershipViewModel.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

class MembershipViewModel {
    
    let model: MembershipModel
    
    var membershipTitle: String {
        
        return model.membershipTitle
    }
    
    var posterImage: UIImage? {
        
        return model.posterImage
    }
    
    var membershipDescription: String {
        
        return model.membershipDescription
        
    }
    
    var membershipPrice: String {
        
        return "£\(model.price)"
    }
    
    init(model: MembershipModel) {
        self.model = model
    }
    
}
