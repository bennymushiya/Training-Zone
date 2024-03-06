//
//  TimeTableFiltierOptions.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

enum TimeTableFilterOptions: Int, CaseIterable {
    
    case monday, tuesday, wednesday, thursday, friday, saturday
    
    var description: String {
        
        switch self {
            
        case .monday: return "Monday"
            
        case .tuesday: return "Tuesday"
            
        case .wednesday: return "Wednesday"
            
        case .thursday: return "Thursday"
            
        case .friday: return "Friday"
            
        case .saturday: return "Saturday"
            
        }
    }
    
}
