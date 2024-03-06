//
//  Classes.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit


struct Classes {
    
    var className: String
    var time: String
    var duration: String
    var tutorImage: UIImage?
    var tutorName: String
    var classDescription: String
    
    
    init(className: String, time: String, duration: String, tutorImage: UIImage? = nil, tutorName: String, classDescription: String) {
        self.className = className
        self.time = time
        self.duration = duration
        self.tutorImage = tutorImage
        self.tutorName = tutorName
        self.classDescription = classDescription
    }
    
    
}
