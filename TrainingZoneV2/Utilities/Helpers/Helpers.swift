//
//  Helpers.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit


extension UIViewController {
    
    //MARK: - SWITCH STATEMENTS
    
    func configureDescriptionLabel(title: String) -> String {
        
        switch title {
            
        case "7 Day Pass": return "• Access to all of our morning or evening classes for the next 7 days\n\n• Direct Communication with our PT'S regarding any issues or advice"
            
        case "Unlimited Classes Pass": return "• Access to all of our morning or evening classes for the next 7 days\n\n• Direct Communication with our PT'S regarding any issues or advice\n\n• A Nutrient Plan that caters to your body goals to help you accomplish your fitness goal."
            
        case "1 Day Pass": return "• Access to both our morning or evening classes for a single day"
            
        default: return ""
            
        }
        
    }
    
    
    func configurePricingLabel(price: String) -> String {
        
        switch price {
            
        case "£10": return "One of payment"
            
        case "£50": return "Monthly payments"
            
        case "£5": return "One of payments"

        default: return ""
            
        }
        
    }
    
    
    // MARK: - ACTIVITY INDICATOR
    
    func showActivityIndicator(message: String) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
    }
    
    func dismissActivityIndicator() {
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)

        }
    }
    
    
}
