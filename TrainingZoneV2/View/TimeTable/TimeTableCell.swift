//
//  TimeTableCell.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

class TimeTableCell: UICollectionViewCell {
    
    //MARK: - PROPERTIES
    
    var viewaModel: TimeTableViewModel? {
        didSet{configureViewModel()}
        
    }

    private let typeOfClassLabel: ReusableLabel = {
        let label = ReusableLabel(title: "HIIT Training Class", size: 18, weight: .bold, textColors: .black, alignment: .left)
        
        return label
    }()
    
    private let startingTimeLabel: ReusableLabel = {
        let label = ReusableLabel(title: "9:30 until 10:20", size: 14, weight: .semibold, textColors: .black, alignment: .left)
        
        return label
    }()
    
    private let tutorDescriptionLabel: ReusableLabel = {
        let label = ReusableLabel(title: "Tutor", size: 14, weight: .black, textColors: .black, alignment: .center)
        
        return label
    }()
    
    private let tutorImage: ReusableImage = {
        let iv = ReusableImage(height: 54, width: 54)
        iv.backgroundColor = .green
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 20
        
        return iv
    }()
    
    private let tutorNameLabel: ReusableLabel = {
        let label = ReusableLabel(title: "Steven", size: 14, weight: .semibold, textColors: .black, alignment: .center)
        
        return label
    }()
    
    private let amountOfSpaceLabel: ReusableLabel = {
        let label = ReusableLabel(title: "Space: 0 out of 12", size: 16, weight: .semibold, textColors: .systemCyan, alignment: .left)
        
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
        
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 1
        
        let tableStack = UIStackView(arrangedSubviews: [typeOfClassLabel, startingTimeLabel])
        tableStack.axis = .vertical
        tableStack.spacing = 10
        
        addSubview(tableStack)
        tableStack.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0)
        
        let tutorInformationStack = UIStackView(arrangedSubviews: [tutorDescriptionLabel, tutorImage, tutorNameLabel])
        tutorInformationStack.axis = .vertical
        tutorInformationStack.spacing = 10
        
        addSubview(tutorInformationStack)
        tutorInformationStack.centerY(inView: self)
        tutorInformationStack.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 20)
        
        addSubview(amountOfSpaceLabel)
        amountOfSpaceLabel.anchor(top: tableStack.bottomAnchor, left: leftAnchor, bottom: nil, right: tutorInformationStack.leftAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 50)
        
    }
    
    //MARK: - ACTION

    private func configureViewModel() {
        
        guard let viewModels = viewaModel else {return}
        
        typeOfClassLabel.text = viewModels.className
        startingTimeLabel.text = viewModels.time
        tutorImage.image = viewModels.tutorImage
        tutorNameLabel.text = viewModels.tutorName
        
        
    }
    
}
