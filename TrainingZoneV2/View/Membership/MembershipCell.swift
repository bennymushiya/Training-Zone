//
//  MembershipCell.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

class MembershipCell: UICollectionViewCell {
    
    //MARK: - PROPERTIES
    
    var viewModel: MembershipViewModel? {
        didSet{configureViewModel()}
    }
    
    private let membershipImage: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .green
        iv.layer.cornerRadius = 20
        iv.layer.masksToBounds = true
        iv.setHeight(200)
        
        return iv
    }()
    
    private let titleLabel: ReusableLabel = {
        let label = ReusableLabel(title: "Class 1", size: 20, weight: .bold, textColors: .black, alignment: .left)
        
        return label
    }()
    
    private let descriptionLabel: ReusableLabel = {
        let label = ReusableLabel(title: "7 days class where you attend any classess for 7 days", size: 14, weight: .medium, textColors: .darkGray, alignment: .left)
        
        return label
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.setHeight(0.5)
        view.backgroundColor = .gray
        
        return view
    }()
    
    private let pricingLabel: ReusableLabel = {
        let label = ReusableLabel(title: "Price: £500", size: 16, weight: .semibold, textColors: .black, alignment: .center)
        
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
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
    
        addSubview(membershipImage)
        membershipImage.centerX(inView: self)
        membershipImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        let labelStack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        labelStack.axis = .vertical
        labelStack.spacing = 10
        
        addSubview(labelStack)
        labelStack.anchor(top: membershipImage.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        addSubview(divider)
        divider.anchor(top: labelStack.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        
        addSubview(pricingLabel)
        pricingLabel.anchor(top: divider.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        

    }
    
    
    
    //MARK: - ACTION

    private func configureViewModel() {
        
        guard let viewModels = viewModel else {return}
        
        membershipImage.image = viewModels.posterImage
        titleLabel.text = viewModels.membershipTitle
        descriptionLabel.text = viewModels.membershipDescription
        pricingLabel.text = viewModels.membershipPrice
        
    }
    
}
