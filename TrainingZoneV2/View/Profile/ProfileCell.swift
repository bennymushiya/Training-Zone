//
//  ProfileCell.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    //MARK: - PROPERTIES

    private let typeOfClassLabel: ReusableLabel = {
        let label = ReusableLabel(title: "HIIT Training Class", size: 18, weight: .bold, textColors: .white, alignment: .left)
        
        return label
    }()
    
    private let startingTimeLabel: ReusableLabel = {
        let label = ReusableLabel(title: "9:30 until 10:20", size: 14, weight: .semibold, textColors: .white, alignment: .left)
        
        return label
    }()
    
    private let bookClassButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Book Now", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 20
        
        return button
    }()
    
    
    private let classIntensityLabel: ReusableLabel = {
        let label = ReusableLabel(title: "Hard", size: 14, weight: .semibold, textColors: .white, alignment: .center)
        label.backgroundColor = .systemCyan
        label.layer.cornerRadius = 10
        label.setDimensions(height: 24, width: 46)
        
        return label
    }()
    
    
    //MARK: - LIFECYCLE
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - HELPERS

    func configureUI() {
        
        backgroundColor = .red
        layer.cornerRadius = 20
        
        let tableStack = UIStackView(arrangedSubviews: [typeOfClassLabel, startingTimeLabel])
        tableStack.axis = .vertical
        tableStack.spacing = 10
        
        addSubview(tableStack)
        tableStack.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0)
        
        addSubview(bookClassButton)
        bookClassButton.anchor(top: tableStack.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 250)
        
        
        addSubview(classIntensityLabel)
        classIntensityLabel.centerY(inView: self)
        classIntensityLabel.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 20)
        
        
        
    }
    
    //MARK: - ACTION

    
}
