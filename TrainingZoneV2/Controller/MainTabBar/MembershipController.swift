//
//  MembershipController.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit
import Firebase

private let reuseIdentifier = "membership cell"

class MembershipController: UICollectionViewController {

    //MARK: - PROPERTIES
    
    var user: User?
    
    var membershipArray = [
    
        MembershipModel(posterImage: UIImage(named: "classes"), membershipTitle: "7 Day Pass", membershipDescription: "Access to all of our morning or evening classes for the next 7 days", price: 10),
        
        MembershipModel(posterImage: UIImage(named: "courses"), membershipTitle: "Unlimited Classes Pass", membershipDescription: "Access to all of our morning or evening classes and a nutrient plan to help you reach your goals", price: 50),
        
        MembershipModel(posterImage: UIImage(named: "trainers"), membershipTitle: "1 Day Pass", membershipDescription: "Access to both our morning or evening classes for a single day", price: 5)
        
    ]
    
    
    //MARK: - LIFECYCLE
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.shadowImage = nil

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchUser()
        self.navigationController?.navigationBar.shadowImage = UIImage()

    }
    
    
    //MARK: - HELPERS
    
    func configureUI() {
        
        collectionView.backgroundColor = .systemGroupedBackground
        navigationItem.title = "Memberships"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
        collectionView.register(MembershipCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    //MARK: - ACTION
    
    func fetchUser() {
        
        guard let currentUser = Auth.auth().currentUser?.uid else {return}
        
        UserServices.fetchUser(currentId: currentUser) { user in
            
            self.user = user
            self.collectionView.reloadData()
            
        }
    }
    
    
    func fetchHelloWorld() {
        
        UserServices.fetchUserData { result in
            
            switch result {
                
            case .success(let success):
                
                print("the results are \(success)")
                
            case .failure(let failure):
                
                print("failed because  are \(failure)")

                
            }
            
        }
        
    }
    
}

//MARK: - UIColllectionViewDataSource

extension MembershipController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return membershipArray.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MembershipCell
        cell.viewModel = MembershipViewModel(model: membershipArray[indexPath.row])
        
        return cell
    }
    
}

//MARK: - UIColllectionViewDelegate

extension MembershipController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = PurchaseMembershipController(image: membershipArray[indexPath.row].posterImage, title: membershipArray[indexPath.row].membershipTitle, price: membershipArray[indexPath.row].price)
        controller.user = user
        navigationController?.pushViewController(controller, animated: true)
        
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MembershipController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 300, height: 450)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return .init(top: 20, left: 20, bottom: 20, right: 20)
        
    }
    
    
}
