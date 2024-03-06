//
//  AuthentificationViewModel.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

struct AuthentificationViewModel {
    
    var name = String()
    var email = String()
    var password = String()
    
    var formIsValid: Bool {
        
        name.isEmpty == false && email.isEmpty == false && password.isEmpty == false
        
    }
    
    
    var enableRegisterButton: Bool {
        
        return formIsValid ? true : false
        
    }
    
    var changeButtonOpacity: CGFloat {
        
        return formIsValid ? 1 : 0.5
    }
    
    
}
