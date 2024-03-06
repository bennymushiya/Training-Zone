//
//  ProfileController.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit
import Firebase

private let headerIdentifier = "profile id"
private let reuseIdentifier = "profile cell"

class ProfileController: UITableViewController {

    //MARK: - PROPERTIES
    
    var user: User?
    
    private lazy var profileHeader = ProfileHeader(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 250))
    
    private let qrCodeTitle: ReusableLabel = {
        let label = ReusableLabel(title: "Scan The QR Code When You've Attended a class to show youve attended", size: 18, weight: .bold, textColors: .black, alignment: .left)
        
        return label
    }()
        
    private lazy var qrCodeGenerator: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.setHeight(300)

        return view
    }()
    
    
    
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchUser()
        
    }
    
    //MARK: - HELPERS
    
    func configureUI() {
        
        tableView.backgroundColor = .systemGroupedBackground
        navigationItem.title = "Profile"
        tableView.tableHeaderView = profileHeader
        tableView.separatorStyle = .none
        profileHeader.delegate = self
        
        let qrcodeStack = UIStackView(arrangedSubviews: [qrCodeTitle, qrCodeGenerator])
        qrcodeStack.axis = .vertical
        qrcodeStack.spacing = 30
        
        tableView.addSubview(qrcodeStack)
        qrcodeStack.centerX(inView: tableView)
        qrcodeStack.anchor(top: profileHeader.bottomAnchor, left: tableView.leftAnchor, bottom: nil, right: tableView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        qrCodeGenerator.layer.masksToBounds = true
        qrCodeGenerator.layer.cornerRadius = 20
        qrCodeGenerator.layer.shadowRadius = 1
        qrCodeGenerator.layer.shadowOpacity = 0.5
        
    }

    
    //MARK: - API
    
    func fetchUser() {
        
        guard let currentUser = Auth.auth().currentUser?.uid else {return}
        
        UserServices.fetchUser(currentId: currentUser) { user in
            
            self.user = user
            self.profileHeader.viewModel = ProfileHeaderViewModel(user: user)
            self.qrCodeGenerator.image = UIImage(data: self.getQRCodeData(text: user.fullname)!)
            
            print("DEBUGG: THE USER INSIDE THIS PLACE IS \(user)")
            
            self.tableView.reloadData()
            
        }
    }
    
    
    //MARK: - ACTION

    func getQRCodeData(text: String) -> Data? {
        
        // this is the filter were going to use to create qr codes/ we convert the data/string into an image.
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else {return nil }
        
        // converts the text/string property into data
        let data = text.data(using: .ascii, allowLossyConversion: false)
        
        //we are attaching the data variable into the filter var with the key inputMessage
        filter.setValue(data, forKey: "inputMessage")
        
        //Here we are fetching the CIImage object from the filter. normally this CIImage will be small in size and will be blurred if we increase the frame. So, we need to scale up the ciimage variable
        guard let ciImage = filter.outputImage else {return nil}
        
        // Now we have scaled up the ciimage with the help of CGAffineTransform.
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        
        let scaledCIImage = ciImage.transformed(by: transform)
        
        // Now, we have converted the scaledCIImage into UIImage.
        let uiImage = UIImage(ciImage: scaledCIImage)
        
        // Here, we have converted the UIImage into Data using .pngData() method
        return uiImage.pngData()
        
    }
    
}

//MARK: - ProfileHeaderDelegate

extension ProfileController: ProfileHeaderDelegate {
    
    func editProfile(_ header: ProfileHeader) {
        
        print("DEBUGG: ITS HAPPENING BROO")
    }
    
}


