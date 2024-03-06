//
//  ReusableButtons.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

class ReusableButtons: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemCyan
        setHeight(50)
        layer.cornerRadius = 50 / 2
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)


        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
