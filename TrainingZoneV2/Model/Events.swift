//
//  Events.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import Foundation
import UIKit

enum EventType: String, CaseIterable {
    
    case monday, tuesday, wednesday, thursday, friday
    
    var icons: String {
        
        switch self {
            
        case .monday: return "🏦"
            
        case .tuesday:  return "🏡"
            
        case .wednesday:  return "🎉"
            
        case .thursday:  return "🏟"
            
        case .friday:  return "📌"
            
        }
    }
}

struct Events {
    
    var className: String
    var time: String
    var duration: String
    var tutorImage: UIImage?
    var tutorName: String
    var classDescription: String
    var eventType: EventType
    var date: Date
    
    
    
    init(className: String, time: String, duration: String, tutorImage: UIImage? = nil, tutorName: String, classDescription: String, eventType: EventType = .monday, date: Date) {
        self.className = className
        self.time = time
        self.duration = duration
        self.tutorImage = tutorImage
        self.tutorName = tutorName
        self.classDescription = classDescription
        self.eventType = eventType
        self.date = date
    }
    
}
