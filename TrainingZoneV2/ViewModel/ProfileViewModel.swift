//
//  ProfileViewModel.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit


struct ProfileHeaderViewModel {
    
    
    var user: User
    
    var fullname: String {
        
        return user.fullname
        
    }
    
    var membershipType: String {
        
        if user.membershipType != "" {
            
            return user.membershipType
            
        } else {
            
            return "Not a Member"
        }
    }
    
    
    init(user: User) {
        self.user = user
    }
    
}
