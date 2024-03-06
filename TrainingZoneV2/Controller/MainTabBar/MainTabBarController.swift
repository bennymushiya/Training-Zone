//
//  MainTabBarController.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController {
    
    //MARK: - PROPERTIES
    
    var user: User?
    
    
    //MARK: - LIFECYCLE
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        configureTabBar()
        //fetchUser()
    }
    
    
    //MARK: - HELPERS

    func configureTabBar() {
        
        let membership = configureNavigationTemplate(titles: "Membership", selectedImage: UIImage(systemName: "list.star"), unselectedImage: UIImage(systemName: "star.bubble"), controller: MembershipController())
        
        //let timeTable = configureNavigationTemplate(titles: "TimeTable", selectedImage: UIImage(systemName: "doc.on.clipboard.fill"), unselectedImage: UIImage(systemName: "doc.on.clipboard"), controller: TimeTableController())
        
        //let classBooked = configureNavigationTemplate(titles: "Classes", selectedImage: UIImage(systemName: "menucard.fill"), unselectedImage: UIImage(systemName: "menucard"), controller: BookedClassesController())
        
        let profile = configureNavigationTemplate(titles: "Profile", selectedImage: UIImage(systemName: "house.fill"), unselectedImage: UIImage(systemName: "house"), controller: ProfileController())
        
        
        viewControllers = [membership, profile ]
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemCyan
        tabBar.barTintColor = .white
        tabBarItem.badgeColor = .white
        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 40
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    
        
    }
    
    
    
    func configureNavigationTemplate(titles: String, selectedImage: UIImage?, unselectedImage: UIImage?, controller: UIViewController) -> UINavigationController {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .white
    
        let nav = UINavigationController(rootViewController: controller)
        nav.tabBarItem.selectedImage = selectedImage
        nav.tabBarItem.image = unselectedImage
        nav.title = titles
        nav.tabBarItem.badgeColor = .white
        nav.navigationBar.compactAppearance = appearance
        nav.navigationBar.compactScrollEdgeAppearance = appearance
        nav.navigationBar.scrollEdgeAppearance = appearance
        nav.navigationBar.setBackgroundImage(UIImage(), for:.default)
        nav.navigationBar.shadowImage = UIImage()
        nav.navigationBar.layoutIfNeeded()
    
        return nav
    }
    
    //MARK: - API
    
    func fetchUser()  {
        
        guard let currentUser = Auth.auth().currentUser?.uid else {return}
        
         UserServices.fetchUser(currentId: currentUser) { user in
            
            self.user = user
        }
        
    }


    //MARK: - ACTION

    
}
