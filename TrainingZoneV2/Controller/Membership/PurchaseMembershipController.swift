//
//  MembershipController.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

class PurchaseMembershipController: UIViewController {
    
    //MARK: - PROPERTIES
    
    var user: User?
    
    var membershipImage: ReusableImage = {
        let iv = ReusableImage(height: 270, width: 0)
        iv.backgroundColor = .green
        iv.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        iv.layer.cornerRadius = 40
        
        return iv
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 40
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 10
        
        return view
    }()
    
    var membershipTitleLabel: ReusableLabel = {
        let label = ReusableLabel(title: "", size: 25, weight: .black, textColors: .black, alignment: .left)
        
        return label
    }()
    
    var membershipDescription: ReusableLabel = {
        let label = ReusableLabel(title: "", size: 14, weight: .semibold, textColors: .darkGray, alignment: .left)
        
        return label
    }()
    
    var pricingLabel: ReusableLabel = {
        let label = ReusableLabel(title: "$ 100", size: 16, weight: .black, textColors: .black, alignment: .left)
        
        return label
    }()
    
    
    var durationLabel: ReusableLabel = {
        let label = ReusableLabel(title: "Monthly Payments", size: 14, weight: .semibold, textColors: .white, alignment: .center)
        label.backgroundColor = .systemCyan
        label.layer.cornerRadius = 20
        
        return label
    }()
    
    
    var buyMembershipButton: ReusableButtons = {
        let button = ReusableButtons(type: .system)
        button.setTitle("Buy Now", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        button.addTarget(self, action: #selector(handleBuyClass), for: .touchUpInside)
        
        return button
    }()
    
    
    //MARK: - LIFECYCLE
    
    init(image: UIImage?, title: String, price: Int) {
        super.init(nibName: nil, bundle: nil)
        self.membershipImage.image = image
        self.membershipTitleLabel.text = title
        self.pricingLabel.text = "£\(price)"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    //MARK: - HELPERS
    
    func configureUI() {
        
        view.backgroundColor = .systemGroupedBackground
        
        membershipDescription.text = configureDescriptionLabel(title: membershipTitleLabel.text ?? "")
        durationLabel.text = configurePricingLabel(price: pricingLabel.text ?? "")
        
        view.insertSubview(membershipImage, at: 0)
        membershipImage.centerX(inView: view)
        membershipImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
                
        view.addSubview(whiteView)
        whiteView.centerX(inView: view)
        whiteView.anchor(top: membershipImage.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        whiteView.addSubview(membershipTitleLabel)
        membershipTitleLabel.anchor(top: whiteView.topAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 30, paddingLeft: 40, paddingBottom: 0, paddingRight: 20)
        
        let purchaseStack = UIStackView(arrangedSubviews: [pricingLabel, durationLabel])
        purchaseStack.axis = .horizontal
        purchaseStack.spacing = 10
        
        whiteView.addSubview(purchaseStack)
        purchaseStack.anchor(top: membershipTitleLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 10, paddingLeft: 40, paddingBottom: 0, paddingRight: 40)
        
        
        whiteView.addSubview(membershipDescription)
        membershipDescription.anchor(top: purchaseStack.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 20, paddingLeft: 40, paddingBottom: 0, paddingRight: 20)
        
        whiteView.addSubview(buyMembershipButton)
        buyMembershipButton.centerX(inView: whiteView)
        buyMembershipButton.anchor(top: membershipDescription.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 50, paddingLeft: 40, paddingBottom: 0, paddingRight: 50)
        
    }
    
    
    //MARK: - SELECTORS

    @objc func handleBuyClass() {
        
        purchaseMembership()
        
    }
    
    
    //MARK: - ACTION
    
    func purchaseMembership() {
        
        if user != nil {
            
            print("DEBUGG: your allowed to buy this membership")
            
        } else {
            
            let controller = RegistrationController()
            
            multipleOptionAlerts(title: "Unregistered User", message: "In order to buy this membership you need to sign up click below to register", buttonTitle1: "Sign Up", controller: controller)

        }
        
    }

    
}
