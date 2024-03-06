//
//  CustomTextField.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

class CustomTextField: UITextField {
    
    
    init(placeHolder: String) {
        super.init(frame: .zero)
        
        // puts a space between the leftView and placeholder
        let spacer = UIView()
        spacer.setDimensions(height: 12, width: 40)
        leftView = spacer
        leftViewMode = .always
        
        textColor = .black
        keyboardAppearance = .dark
        font = UIFont.systemFont(ofSize: 15, weight: .bold)
        setHeight(60)
        layer.cornerRadius = 10
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0.25, alpha: 0.2535342262)
        backgroundColor = .white
        attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [.foregroundColor: UIColor.gray])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
