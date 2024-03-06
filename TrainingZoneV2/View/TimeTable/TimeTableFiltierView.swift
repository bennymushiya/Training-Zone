//
//  TimeTableFiltierView.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit

private let reuseIdentifier = "challenge cell"

protocol TimeTableFilterViewDelegate: AnyObject {
    
    func filterView(_ view: TimeTableFilterView, didSelect index: Int)
}

class TimeTableFilterView: UIView {
    
    //MARK: - PROPERTIES
    
    weak var delegate: TimeTableFilterViewDelegate?
    
    lazy var statusCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.backgroundColor = .systemGroupedBackground
        cv.dataSource = self
        cv.delegate = self
        
        return cv
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
                
        backgroundColor = .systemGroupedBackground
        statusCollectionView.register(TimeTableFilterCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        statusCollectionView.showsHorizontalScrollIndicator = false
        
        addSubview(statusCollectionView)
        statusCollectionView.fillSuperview()
        
        // automaticly selects the first item inside the indexPath
        let selectedIndexPath = IndexPath(row: 0, section: 0)
        statusCollectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .left)
        
    }
    
    //MARK: - ACTION
    
}


//MARK: - UICollectionViewDataSource


extension TimeTableFilterView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // automaticly updates the UI, if we modify our enum, rather than it being hard coded
        return TimeTableFilterOptions.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TimeTableFilterCell
        
        cell.viewModel = TimeTableFilterOptions(rawValue: indexPath.row)
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension TimeTableFilterView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.filterView(self, didSelect: indexPath.row)
        
    }

}

//MARK: - UICollectionViewDelegateFlowLayout

extension TimeTableFilterView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let count = CGFloat(TimeTableFilterOptions.allCases.count)
        
        // makes the cells one third of the views width
        return CGSize(width: frame.width / count, height: frame.height)
    }
    
    // defines the spacing between our cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return .init(top: 20, left: 20, bottom: 20, right: 20)
    }
    
}
