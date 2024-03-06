//
//  BookingServices.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit
import Firebase


struct BookingServices {
    
    
    static func bookClass(className: String, tutor: String, time: String, day: String, completion: @escaping(FirestoreCompletion)) {
        
        guard let currentUser = Auth.auth().currentUser?.uid else { return }
        
        let data = ["title": className,
                   "tutor": tutor,
                   "time": time,
                   "timestamp": Timestamp(date: Date()),
                   "day": day,
                   "membersAttending": 0,
                   "membersAttended": 0] as [String: Any]
        
        COLLECTION_CLASSES.addDocument(data: data, completion: completion)
       
        
    }
    
    
    
    static func usersBookingClasses(completion: @escaping(FirestoreCompletion)) {
        
        
        
        
    }
    
    
}
