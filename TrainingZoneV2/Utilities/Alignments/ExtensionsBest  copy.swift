//
//  Extensions.swift
//  TinderTutorial
//
//  Created by Stephen Dowless on 4/30/20.
//  Copyright © 2020 Stephan Dowless. All rights reserved.
//

import UIKit
//import JGProgressHUD


extension UIViewController {
    
    // MARK: - NAVIGATION
    
    func configureNavigation(title: String) {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0.25, alpha: 1)
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // covers the edge of the navigation bar.
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = title
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }
    
    func configureNavigationRightButton(title: String, selector: Selector) {
        
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        
    }
    
    func configureNavigationLeftButton(title: String, selector: Selector) {
        
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
    }
    
    func designNavigation(title: String) {
        
        navigationItem.title = title
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0.25, alpha: 1)
        
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0.25, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        //navigationController?.navigationBar.navigationItem.hidesBackButton = true
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0.25, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .blue
        
    }
    
    func configureControllerModally(controller: UIViewController) {
        
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
        
    }
    
    // MARK: - ALERTS
    
    func destinationAlert(userlocation: String, chosenDestination: String, button: UIButton, doneButton: UIButton) {
        
        let alert = UIAlertController(title: "Select Destination", message: "Please select your destination", preferredStyle: .alert)
        
        if userlocation == "Haydock" {
            
            alert.addAction(UIAlertAction(title: "Leeds", style: .default, handler: { action in
                
                //chosenDestination == "Leeds"
                button.setTitle("Leeds", for: .normal)
                button.backgroundColor = .cyan
                button.setTitleColor(.white, for: .normal)
                doneButton.alpha = 1
                doneButton.isEnabled = true

                print("chose leeds")
            }))
            
            alert.addAction(UIAlertAction(title: "Trafford", style: .default, handler: { action in
                
               // chosenDestination == "Trafford"
                //button.setTitle("Trafford", for: .normal)
                button.backgroundColor = .cyan
                button.setTitleColor(.white, for: .normal)
                doneButton.alpha = 1
                doneButton.isEnabled = true

                print("chose traffird")
            }))
            
            alert.addAction(UIAlertAction(title: "Tyne & Wear", style: .default, handler: { action in
                
                //chosenDestination == "Tyne & Wear"
                //button.setTitle("Tyne & Wear", for: .normal)
                button.backgroundColor = .cyan
                button.setTitleColor(.white, for: .normal)
                doneButton.alpha = 1
                doneButton.isEnabled = true
                print("chose tybe")
            }))
            
        } else if userlocation == "Leeds" {
            
            alert.addAction(UIAlertAction(title: "Haydock", style: .default, handler: { action in
                
                //chosenDestination == "Haydock"
                //button.setTitle("Haydock", for: .normal)
                button.backgroundColor = .cyan
                button.setTitleColor(.white, for: .normal)
                doneButton.alpha = 1
                doneButton.isEnabled = true

                print("chose haydock")
            }))
            
            alert.addAction(UIAlertAction(title: "Trafford", style: .default, handler: { action in
                
                //chosenDestination == "Trafford"
                //button.setTitle("Trafford", for: .normal)
                button.backgroundColor = .cyan
                button.setTitleColor(.white, for: .normal)
                doneButton.alpha = 1
                doneButton.isEnabled = true

                print("chose traffird")
            }))
            
            alert.addAction(UIAlertAction(title: "Tyne & Wear", style: .default, handler: { action in
                
                //chosenDestination == "Tyne & Wear"
                //button.setTitle("Tyne & Wear", for: .normal)
                button.backgroundColor = .cyan
                button.setTitleColor(.white, for: .normal)
                doneButton.alpha = 1
                doneButton.isEnabled = true
                print("chose tybe")
            }))
            
            
        } else if userlocation == "Trafford" {
            
            alert.addAction(UIAlertAction(title: "Haydock", style: .default, handler: { action in
                
                //chosenDestination == "Haydock"
                //button.setTitle("Haydock", for: .normal)
                button.backgroundColor = .cyan
                button.setTitleColor(.white, for: .normal)
                doneButton.alpha = 1
                doneButton.isEnabled = true

                print("chose haydock")
            }))
            
            alert.addAction(UIAlertAction(title: "Leeds", style: .default, handler: { action in
                
                //chosenDestination == "Leeds"
                //button.setTitle("Leeds", for: .normal)
                button.backgroundColor = .cyan
                button.setTitleColor(.white, for: .normal)
                doneButton.alpha = 1
                doneButton.isEnabled = true

                print("chose leeds")
            }))
            
            alert.addAction(UIAlertAction(title: "Tyne & Wear", style: .default, handler: { action in
                
                //chosenDestination == "Tyne & Wear"
                button.setTitle("Tyne & Wear", for: .normal)
                button.backgroundColor = .cyan
                button.setTitleColor(.white, for: .normal)
                doneButton.alpha = 1
                doneButton.isEnabled = true
                print("chose tybe")
            }))
            
            
        } else if userlocation == "Tyne & Wear" {
            
            alert.addAction(UIAlertAction(title: "Haydock", style: .default, handler: { action in
                
                //chosenDestination == "Haydock"
                //button.setTitle("Haydock", for: .normal)
                button.backgroundColor = .cyan
                button.setTitleColor(.white, for: .normal)
                doneButton.alpha = 1
                doneButton.isEnabled = true


                print("chose haydock")
            }))
            
            alert.addAction(UIAlertAction(title: "Leeds", style: .default, handler: { action in
                
                //chosenDestination == "Leeds"
               // button.setTitle("Leeds", for: .normal)
                button.backgroundColor = .cyan
                button.setTitleColor(.white, for: .normal)
                doneButton.alpha = 1
                doneButton.isEnabled = true

                print("chose leeds")
            }))
            
            alert.addAction(UIAlertAction(title: "Trafford", style: .default, handler: { action in
                
                //chosenDestination == "Trafford"
                //button.setTitle("Trafford", for: .normal)
                button.backgroundColor = .cyan
                button.setTitleColor(.white, for: .normal)
                doneButton.alpha = 1
                doneButton.isEnabled = true

                print("chose traffird")
            }))
        }
    
        present(alert, animated: true, completion: nil)
        
    }

    func showMultiOptionAlerts(controller: UIViewController) {
        
        let alert = UIAlertController(title: "Are you sure you want to leave this page", message: "All your information will be lost", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Leave", style: .default) { action in
            
            let controller = controller
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "Stay", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func multipleOptionAlerts(title: String, message: String, buttonTitle1: String, controller: UIViewController) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: buttonTitle1, style: .default) { action in
            
            let controller = controller
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // creates an alert with textfield
    func showTextFieldAlert(stockline: Int) {
        
        let alert = UIAlertController(title: "enter stockline amount", message: "Enter the amount Tyres inside this transfer Note", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Submit", style: .default) { action in
            
            guard let mileage = Int(alert.textFields?.first?.text ?? "0"), mileage >= 0 else {return}
            
            
        }
        
        alert.addTextField { textField in
            
            // makes the keyboard with decimals and numbers
            textField.keyboardType = .decimalPad
            textField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            
            // auto makes the first letter a capital
            textField.autocapitalizationType = .words
            print("DEBUGG: ITS THE TEXT \(textField.text)")
            
        }
        
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func showActionsheet(viewController: UIViewController, title: String, message: String, actions: [(String, UIAlertAction.Style)], completion: @escaping (_ index: Int) -> Void) {
        
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        for (index, (title, style)) in actions.enumerated() {
            let alertAction = UIAlertAction(title: title, style: style) { (_) in
                completion(index)
            }
            alertViewController.addAction(alertAction)
        }
        viewController.present(alertViewController, animated: true, completion: nil)
        
    }
    
    func showMessage(withTitle title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    func popBackToRootViewAlert(withTitle title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            
            self.navigationController?.popToRootViewController(animated: true)
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func postRequestAlert(buttonTitle1: String, buttonTitle2: String, postRequest: Any) {
        
        let alert = UIAlertController(title: "Are you sure you want submit", message: "once submited you cannot make any more changes", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: buttonTitle1, style: .cancel))
        
        alert.addAction(UIAlertAction(title: buttonTitle2, style: .default, handler: { action in
            
            //postRequest
            
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - ACTIVITY INDICATOR
    
//    func showActivityIndicator(message: String) {
//        
//        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//
//        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
//        loadingIndicator.hidesWhenStopped = true
//        loadingIndicator.style = UIActivityIndicatorView.Style.gray
//        loadingIndicator.startAnimating();
//
//        alert.view.addSubview(loadingIndicator)
//        present(alert, animated: true, completion: nil)
//        
//    }
//    
//    func dismissActivityIndicator() {
//        
//        DispatchQueue.main.async {
//            self.dismiss(animated: true, completion: nil)
//
//        }
//    }

    
    // MARK: - SWITCH DATA TYPES
    
    func setVehicleType(number: Int) -> String {
        
        switch number {
            
        case 4: return "Cargo"
            
        case 10: return "Truck"
            
        case 1: return "Other"
            
        default: return ""
            
        }
    }
    

    func changeUserLocationToInteger(location: String) -> Int {
        
        switch location {
            
        case "Leeds Operations": return 3
            
        case "Haydock Operations": return 1
            
        case "Trafford Operations": return 7
            
        case "Tyre Outlet": return 10
            
        case "Saint Helens Operations": return 4
            
        default: return 1
            
        }
        
    }
    
    func changeDepotToInteger(depot: String) -> Int {
        
        switch depot {
            
        case "Haydock": return 1
            
        case "Leeds": return 3
            
        case "Trafford": return 7
            
        case "Tyne & Wear": return 9
            
        case "Saint Helens": return 4
            
        case "New Haydock": return 10
            
        default: return 1
            
        }
        
    }
    
    
    func changeTransferTypeToString(type: Int) -> String {
        
        switch type {
            
        case  0: return "SLS"
            
        case 1: return "Stock"
            
        default: return ""
            
        }
    }
    
    func changeTransferTypeToInteger(type: String) -> Int {
        
        switch type {
            
        case  "SLS": return 0
            
        case "Stock": return 1
            
        default: return 0
            
        }
    }
    
    func changeTransferTypeToIntegerPopulateSlots(type: String) -> Int {
        
        switch type {
            
        case  "SLS": return 0
            
        case "stock": return 1
            
        default: return 0
            
        }
    }
    
    func changeDepotTypeToString(depot: Int) -> String {
          
          switch depot {
              
          case 1: return "Haydock"
              
          case 3: return "Leeds"
              
          case 7: return "Trafford"
              
          case 9: return "Tyne & Wear"
              
          case 4: return "Saint Helens"
              
          case 10: return "Haydock 2"
              
          default: return "Haydock"

          }
      }
    
     func changeUserLocation(location: String) -> String {
         
         switch location {
             
         case "Leeds Operations": return "Leeds"
             
         case "Haydock Operations": return "Haydock"
             
         case "Trafford Operations": return "Trafford"
             
         case "Tyre Outlet": return "Tyne & Wear"
             
         case "Saint Helens Operations": return "Saint Helens"
             
         default: return "Haydock"
             
         }
         
     }
     
}


extension UIViewController {
    
    //MARK: - PROGRESS HUD
    
    //static let hud = JGProgressHUD(style: .dark)
    
//    func configureGradientLayer() {
//        let gradient = CAGradientLayer()
//        gradient.colors = [UIColor.systemPink.cgColor, UIColor.systemPurple.cgColor]
//        gradient.locations = [0, 1]
//        view.layer.addSublayer(gradient)
//        gradient.frame = view.frame
//    }
//    
//    func showLoader(_ show: Bool) {
//    
//        DispatchQueue.main.async {
//            self.view.endEditing(true)
//
//        }
//
//        if show {
//            UIViewController.hud.show(in: view)
//        } else {
//            UIViewController.hud.dismiss()
//        }
//    }
    
    
    //MARK: - SHARE SHEET

    func presentShareSheet() {
        
        guard let image = UIImage(systemName: "bell"), let url = URL(string: "https://www.google.com") else {return}
        
        let shareSheetVC = UIActivityViewController(activityItems: [image, url], applicationActivities: nil)
        
        shareSheetVC.popoverPresentationController?.sourceView
        present(shareSheetVC, animated: true)
    }
    
}

//MARK: - ATTRIBUTED BUTTONS

extension UIButton {
    
    func attributedTitle(firstPart: String, secondPart: String) {
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(ciColor: .white ), .font: UIFont.systemFont(ofSize: 16)]
        
        let attributedTitle = NSMutableAttributedString(string: "\(firstPart) ", attributes: atts)
        
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(#colorLiteral(red: 0.1598605525, green: 0.9373220266, blue: 0.7734893539, alpha: 1)), .font: UIFont.boldSystemFont(ofSize: 16)]
        
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: boldAtts))
        
        setAttributedTitle(attributedTitle, for: .normal)
    }
}



//MARK: - ALIGNMENTS

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        guard let view = superview else { return }
        anchor(top: view.topAnchor, left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}
