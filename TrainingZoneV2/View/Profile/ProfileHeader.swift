//
//  ProfileHeader.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

protocol ProfileHeaderDelegate: AnyObject {
    
    func editProfile(_ header: ProfileHeader)
    
}

class ProfileHeader: UIView {
    
    //MARK: - PROPERTIES
    
    weak var delegate: ProfileHeaderDelegate?
    
    var viewModel: ProfileHeaderViewModel? {
        didSet{configureViewModel()}
        
    }

    private let profileImage: ReusableImage = {
        let iv = ReusableImage(height: 76, width: 76)
        //iv.image = UIImage(systemName: "camera.fill.badge.ellipsis")
        //iv.tintColor = .black
        iv.backgroundColor = .systemGray6
        iv.layer.cornerRadius = 20
        
        return iv
    }()
    
    private let nameLabel: ReusableLabel = {
        let label = ReusableLabel(title: "rabi mushiya", size: 20, weight: .bold, textColors: .black, alignment: .center)
        
        return label
    }()
    
    
    private let typeOfMember: ReusableLabel = {
        let label = ReusableLabel(title: "", size: 14, weight: .bold, textColors: .systemGray, alignment: .center)
        
        return label
    }()
    
    private let editProfileButton: ReusableButtons = {
        let button = ReusableButtons(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.setHeight(30)
        button.layer.cornerRadius = 30 / 2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        button.addTarget(self, action: #selector(handleEditButton), for: .touchUpInside)
        
        return button
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
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        layer.cornerRadius = 50
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        
        addSubview(profileImage)
        profileImage.centerX(inView: self)
        profileImage.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        let profileStack = UIStackView(arrangedSubviews: [nameLabel, typeOfMember])
        profileStack.axis = .vertical
        profileStack.spacing = 10

        addSubview(profileStack)
        profileStack.centerX(inView: self)
        profileStack.anchor(top: profileImage.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
       
        addSubview(editProfileButton)
        editProfileButton.centerX(inView: self)
        editProfileButton.anchor(top: profileStack.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 80, paddingBottom: 0, paddingRight: 80)
        
        
        
    }
    
    
    //MARK: - ACTION

    private func configureViewModel() {
        
        guard let viewModels = viewModel else {return}
        
        nameLabel.text = viewModels.fullname
        typeOfMember.text = "Membership: \(viewModels.membershipType)"
        
    }
    
    
    @objc func handleEditButton() {
        
        delegate?.editProfile(self)
    }
    
}
