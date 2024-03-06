//
//  TimeTableHeader.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit


protocol TimeTableHeaderDelegate: AnyObject {
    
    func userDidSelectDate(_ header: TimeTableHeader, selection: UICalendarSelectionSingleDate, dateComponents: DateComponents?)
    func setDecorations(_ header: TimeTableHeader, dateComponents: DateComponents) -> UICalendarView.Decoration?
}

class TimeTableHeader: UICollectionReusableView {
    
    //MARK: - PROPERTIES
    
    weak var delegate: TimeTableHeaderDelegate?

     let calenderView: UICalendarView = {
        let calender = UICalendarView()
        calender.calendar = .autoupdatingCurrent
        calender.locale = .autoupdatingCurrent
        calender.fontDesign = .rounded
        calender.layer.cornerRadius = 20
        calender.backgroundColor = .white
        calender.tintColor = .systemCyan
        calender.layer.shadowRadius = 5
        calender.layer.shadowOpacity = 0.5
        
        return calender
    }()
    
    
   
    
    //MARK: - LIFECYCLE
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        configureCalendarInteraction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - HELPERS

    func configureUI() {
        
        backgroundColor = .systemGroupedBackground
        
        addSubview(calenderView)
        calenderView.centerX(inView: self)
        calenderView.centerY(inView: self)
        calenderView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        
    }
    
    func configureCalendarInteraction() {
        
        let gregorianCalendar = Calendar(identifier: .gregorian)
        calenderView.calendar = gregorianCalendar
        calenderView.availableDateRange = DateInterval(start: .now, end: .distantFuture)
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calenderView.selectionBehavior = dateSelection
        
        calenderView.delegate = self
        
    }
  
    
    //MARK: - ACTION

    
}

//MARK: - UICalendarSelectionSingleDateDelegate

extension TimeTableHeader: UICalendarSelectionSingleDateDelegate {
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        
        delegate?.userDidSelectDate(self, selection: selection, dateComponents: dateComponents)
        
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
        
        return true
    }
    
}

//MARK: - UICalendarViewDelegate

extension TimeTableHeader: UICalendarViewDelegate {

    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {

       return delegate?.setDecorations(self, dateComponents: dateComponents)
    }
}






extension Date {
    
    func diff(numberOfDays: Int) -> Date {
        
        Calendar.current.date(byAdding: .day, value: numberOfDays, to: self)!
    }
    
    // when we compare two dates it will always compare the two start of days
    var startOfDay: Date {
        
        Calendar.current.startOfDay(for: self)
    }
    
}
