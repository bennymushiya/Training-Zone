//
//  ReusableLabel.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

class ReusableLabel: UILabel {
    
    
    init(title: String, size: Int, weight: UIFont.Weight, textColors: UIColor, alignment: NSTextAlignment) {
        super.init(frame: .zero)
        
        
        text = title
        font = UIFont.systemFont(ofSize: CGFloat(size), weight: weight)
        textColor = textColors
        numberOfLines = 0
        textAlignment = alignment
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
