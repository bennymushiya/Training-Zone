//
//  BookingController.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

class BookingController: UIViewController {
    
    //MARK: - PROPERTIES
    
    lazy var classDay = String()
    
    var classDescriptionLabel: ReusableLabel = {
        let label = ReusableLabel(title: "this clas is this and that etcbcjscjbcccbdcbsjcsjbdjsdbcbcjdc", size: 16, weight: .bold, textColors: .black, alignment: .left)
        
        return label
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setHeight(450)
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 40
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 1
        
        return view
    }()
    
    
    private let tutorDescriptionLabel: ReusableLabel = {
        let label = ReusableLabel(title: "Tutor:", size: 20, weight: .black, textColors: .black, alignment: .left)
        
        return label
    }()
    
    var tutorImage: ReusableImage = {
        let iv = ReusableImage(height: 400, width: 0)
        iv.backgroundColor = .green
        iv.setHeight(400)
        iv.layer.cornerRadius = 0

        
        return iv
    }()
    
    var tutorNameLabel: ReusableLabel = {
        let label = ReusableLabel(title: "Steven Mushiya", size: 18, weight: .bold, textColors: .black, alignment: .center)
        
        return label
    }()
    
    var classTitleLabel: ReusableLabel = {
        let label = ReusableLabel(title: "HIIT: TRAINING CLASS", size: 18, weight: .bold, textColors: .black, alignment: .left)
        
        return label
    }()
    
    var classTimeLabel: ReusableLabel = {
        let label = ReusableLabel(title: "9:30AM until 10:20AM", size: 18, weight: .bold, textColors: .black, alignment: .left)
        
        return label
    }()
    
    
    private let membersAttendingLabel: ReusableLabel = {
        let label = ReusableLabel(title: "Members Attending 5 out 12", size: 16, weight: .semibold, textColors: .systemCyan, alignment: .left)
        
        return label
    }()
    
    private let bookClassButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Book Now", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 20
        button.setHeight(40)
        
        button.addTarget(self, action: #selector(handleBookClass), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    
    //MARK: - HELPERS

    func configureUI() {
        
        view.backgroundColor = .systemGroupedBackground
        navigationItem.title = "Book Class"
        
        view.addSubview(tutorImage)
        tutorImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        view.addSubview(whiteView)
        whiteView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        let tutorInfoStack = UIStackView(arrangedSubviews: [tutorDescriptionLabel, tutorNameLabel])
        tutorInfoStack.axis = .horizontal
        tutorInfoStack.spacing = 10
        
        whiteView.addSubview(tutorInfoStack)
        tutorInfoStack.anchor(top: whiteView.topAnchor, left: whiteView.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0)
        
        
        let classInfoStack = UIStackView(arrangedSubviews: [classTitleLabel, classTimeLabel, membersAttendingLabel, classDescriptionLabel])
        classInfoStack.axis = .vertical
        classInfoStack.spacing = 20
        
        whiteView.addSubview(classInfoStack)
        classInfoStack.anchor(top: tutorInfoStack.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        whiteView.addSubview(bookClassButton)
        bookClassButton.anchor(top: classInfoStack.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 30, paddingLeft: 40, paddingBottom: 0, paddingRight: 40)
        
        
    }
    
    //MARK: - ACTION

    @objc private func handleBookClass() {
        
        
        BookingServices.bookClass(className: classTitleLabel.text ?? "", tutor: tutorNameLabel.text ?? "", time: classTimeLabel.text ?? "", day: classDay) { error in
            
            if let error = error {
                
                print("DEBUGG: FAILED TO UPLOAD CLASS \(error)")
                
            }
            
            print("DEBUGG: SUCCESSFULLY UPLOADED THE CLASS")
            
        }
        
    }
}
