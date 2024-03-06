//
//  TimeTableFilterCell.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

class TimeTableFilterCell: UICollectionViewCell {
    
    //MARK: - LIFEYCLE
    
    var viewModel: TimeTableFilterOptions? {
        didSet{configureFilterModel()}
        
    }

    private let titleLabel: ReusableLabel = {
        let label = ReusableLabel(title: "", size: 16, weight: .bold, textColors: .black, alignment: .left)
        label.setHeight(66)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
    
        return label
    }()
    
    override var isSelected: Bool {
        
        didSet {
            
            titleLabel.textColor = isSelected ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : .black
            titleLabel.font = isSelected ? UIFont.systemFont(ofSize: 18, weight: .black) : UIFont.boldSystemFont(ofSize: 16)
            titleLabel.backgroundColor = isSelected ? .systemCyan : .clear
            titleLabel.layer.cornerRadius = isSelected ? 20 : 0
        }
    }
    
    //MARK: - LIFEYCLE
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LIFEYCLE

    func configureUI() {
        
        backgroundColor = .systemGroupedBackground

        addSubview(titleLabel)
        titleLabel.centerX(inView: self)
        titleLabel.centerY(inView: self)
        
    }
    
    
    //MARK: - ACTION
    
    func configureFilterModel() {
        
        guard let viewModels = viewModel else {return}
        
        titleLabel.text = viewModels.description
        
    }

    
    
    
}








