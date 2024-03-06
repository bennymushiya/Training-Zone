//
//  ClassesController.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit
import Firebase

private let reuseIdentifier =  "cells"

class ClassesController: UICollectionViewController {
    
    //MARK: - PROPERTIES
    
    var time = Date()
    
    var user: User?
    
    var classes = [Events]()
    
    
    //MARK: - LIFECYCLE
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
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
        
        collectionView.backgroundColor = .systemGroupedBackground
        navigationItem.title = "Book Classes"
        
        collectionView.register(TimeTableCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    //MARK: - API

    
    
    //MARK: - ACTION
   
    
    
}

//MARK: - UIColllectionViewDataSource

extension ClassesController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return classes.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TimeTableCell
        cell.viewaModel = TimeTableViewModel(classess: classes[indexPath.row])
        
       // dateSelected = currentDataSource[indexPath.row].date
        
        return cell
    }
    
}

//MARK: - UIColllectionViewDelegate

extension ClassesController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = BookingController()
        controller.classDescriptionLabel.text = classes[indexPath.row].classDescription
        controller.tutorImage.image = classes[indexPath.row].tutorImage
        controller.classTimeLabel.text = classes[indexPath.row].time
        controller.tutorNameLabel.text = classes[indexPath.row].tutorName
        controller.classTitleLabel.text = classes[indexPath.row].className
       // controller.classDay = currentDataSource[indexPath.row].day
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout

extension ClassesController: UICollectionViewDelegateFlowLayout {
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return .init(top: 20, left: 20, bottom: 20, right: 20)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 20
    }
    
}
