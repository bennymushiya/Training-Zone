//
//  TimeTableController.swift
//  TrainingZoneV2
//
//  Created by Benny Mushiya on 27/12/2022.
//

import UIKit
import Firebase


class TimeTableController: UIViewController {
    
    //MARK: - PROPERTIES
    
    var time = Date()
    
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
    
    private let descriptionLabel: ReusableLabel = {
        let label = ReusableLabel(title: "Sign in and become a member in order to view the weekly classes", size: 20, weight: .black, textColors: .black, alignment: .center)
        label.alpha = 0
        
        return label
    }()
    
    var currentDataSource = [
   
           Events(className: "HIIT Class: High Intensity", time: "9:30AM until 10:20AM", duration: "50 minutes", tutorImage: UIImage(named: "Steven"), tutorName: "Steven", classDescription: "High-intensity interval training (HIIT) workouts are a popular kind of exercise that involve exerting your maximum energy during short periods of time. 50 minute", date: Date().diff(numberOfDays: -3)),
   
           Events(className: "HIIT Class: High Intensity", time: "7PM until 8PM", duration: "50 minutes", tutorImage: UIImage(named: "Georgia"), tutorName: "Georgia", classDescription: "High-intensity interval training (HIIT) workouts are a popular kind of exercise that involve exerting your maximum energy during short periods of time. 50 minute", date: Date().diff(numberOfDays: -3)),
           
           Events(className: "Hell Camp", time: "9:30AM until 10:20AM", duration: "50 minutes", tutorImage: UIImage(named: "Rabi"), tutorName: "Rabi", classDescription: "s a combination of weight training and cardio training without any rest for 10 minute straight repeated 3 times with one 2 minute rest", date: Date()),
   
           Events(className: "Bootcamp", time: "7PM until 8PM", duration: "50 minutes", tutorImage: UIImage(named: "Georgia"), tutorName: "Georgia", classDescription: "Boost your strength, power and endurance at our Bootcamp class which involves a combination of bodyweight and freeweight exercises", date: Date().diff(numberOfDays: -1)),
           
           Events(className: "Hell Camp", time: "7PM until 8PM", duration: "50 minutes", tutorImage: UIImage(named: "Georgia"), tutorName: "Georgia", classDescription: "Hell camp is a combination of weight training and cardio traning without any rest for 10 minutes straight, repeated 3 times with one 2 minute rest", date: Date().diff(numberOfDays: -1)),
           
           Events(className: "Circuit Training", time: "9:30AM until 10:20AM", duration: "50 minutes", tutorImage: UIImage(named: "Rabi"), tutorName: "Rabi", classDescription: "Circuit training is a form of body conditioning that involves endurance traning, resistance training, high intensity aerobics and exercise performed in a circuit. Which is similar to high intensity interval training. it targets strength building and muscular endurance ", date: Date().diff(numberOfDays: 0)),
   
           Events(className: "Bootycamp", time: "6:15PM until 7PM", duration: "45 minutes", tutorImage: UIImage(named: "Rabi"), tutorName: "Rabi", classDescription: "Booty camps, are you ready for a booty heavy workout? Sculpt, tone and tighten those buns in this high energy booty building class. You will combine cardio, weight training and partner excercises focusing on the legs and butt. To keep your booty in check all year round. Bring your runnners and a water bottle and get ready to sweat!", date: Date().diff(numberOfDays: 0)),
           
           Events(className: "Step Class", time: "9:30AM until 10:20AM", duration: "50 minutes", tutorImage: UIImage(named: "Rabi"), tutorName: "Rabi", classDescription: "For both beginners and advanced steppers this great cardio workout is choreographed. As you progress, so will the movements, always giving you something new and fun to experience in the class. You’ll have a fantastic athletic workout that helps to burn fat and tone up to some great music! Great if your goal is weight loss, toning or general fitness.", date: Date().diff(numberOfDays: 1)),
           
           Events(className: "If You Die, You Die", time: "11AM until 12AM", duration: "1 hour", tutorImage: UIImage(named: "Rabi"), tutorName: "Rabi and Georgia", classDescription: "If you die you die- it's consistent of 12 different stations and 1 minute on each station before moving to the next, a without any resting period mixed of cardio and weight training.", date: Date().diff(numberOfDays: 2))
   
       ]
   

    var user: User?
    var dateSelected: DateComponents?
    
    
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureCalendarInteraction()
        fetchUser()
        
    }
    
    
    //MARK: - HELPERS
    
    func configureUI() {
        
        view.backgroundColor = .systemGroupedBackground
        navigationItem.title = "Book Classes"
        
        view.addSubview(calenderView)
        calenderView.centerX(inView: view)
        calenderView.centerY(inView: view)
        calenderView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20)
        
        view.addSubview(descriptionLabel)
        descriptionLabel.centerX(inView: view)
        descriptionLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 300, paddingLeft: 20, paddingRight: 20)
        
        
    }
    
    
    func configureCalendarInteraction() {
        
        let gregorianCalendar = Calendar(identifier: .gregorian)
        calenderView.calendar = gregorianCalendar
        calenderView.availableDateRange = DateInterval(start: .now, end: .distantFuture)
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calenderView.selectionBehavior = dateSelection
        
        calenderView.delegate = self
        
    }
    
    //MARK: - API
    
    func fetchUser() {
        
        guard let currentUser = Auth.auth().currentUser?.uid else {return}
        
        UserServices.fetchUser(currentId: currentUser) { user in
            self.user = user
            
        }
        
        showLabelIfUserNotSignedIn()
    }
    
    
    //MARK: - ACTION
    
    func showLabelIfUserNotSignedIn() {
        
        guard let users = user else {return}
        
        if users.fullname == "" {
            
            descriptionLabel.alpha = 1
            
        } else {
            
            descriptionLabel.alpha = 0
            
        }
        
    }
    
}

//MARK: - UICalendarSelectionSingleDateDelegate

extension TimeTableController: UICalendarSelectionSingleDateDelegate {
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        
        print("DEBUGG: THE NUMBER IS \(Date().diff(numberOfDays: -2))")

        dateSelected = dateComponents
        
        guard let dateComponents else {return}
        let foundEvent = currentDataSource.filter({ $0.date.startOfDay == dateComponents.date?.startOfDay})

        if !foundEvent.isEmpty {
            
            // show events/classes here
            print("DEBUGG: ITS SHOWING THE EVENTS")
            let controller = ClassesController()
            navigationController?.pushViewController(controller, animated: true)

        }
        
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
        
        return true
    }
    
}

//MARK: - UICalendarViewDelegate

extension TimeTableController: UICalendarViewDelegate {

    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {

        let foundEvent = currentDataSource.filter({$0.date.startOfDay == dateComponents.date?.startOfDay})
        
        if foundEvent.isEmpty { return nil }
        
        if foundEvent.count > 1 {
            
            return UICalendarView.Decoration.image( UIImage(systemName: "doc.on.doc.fill"), color: .red, size: .large)
        }
        
        let singleEvent = foundEvent.first!
        return .customView {
            let icon = UILabel()
            icon.text = singleEvent.eventType.icons
            
            return icon
        }
    }
}


