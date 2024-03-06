//
//  ReusableImage.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

class ReusableImage: UIImageView {
    
    
    init(height: CGFloat, width: CGFloat) {
        super.init(frame: .zero)
        
        layer.cornerRadius = height / 2
        setDimensions(height: height, width: width)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
