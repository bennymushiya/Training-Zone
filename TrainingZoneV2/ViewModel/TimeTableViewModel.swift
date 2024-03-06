//
//  TimeTableViewModel.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

struct TimeTableViewModel {
    
    var classess: Events
    
    var className: String {
        
        return classess.className
    }
    
    var duration: String {
        
        return classess.duration
    }
    
    var time: String {
        
        return classess.time
    }
    
    var tutorName: String {
        
        return classess.tutorName
    }
    
    var tutorImage: UIImage? {
        
        return classess.tutorImage
    }
    
    var classDescription: String {
        
        return classess.classDescription
        
    }
    
    init(classess: Events) {
        self.classess = classess
    }
    
    
}
