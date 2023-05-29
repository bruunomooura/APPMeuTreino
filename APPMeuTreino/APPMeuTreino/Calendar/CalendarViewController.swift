//
//  CalendarViewController.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 09/03/23.
//

import UIKit

class CalendarViewController: UIViewController {

    
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myCalendar: UICalendarView = UICalendarView()
        let gregorianCalendar = Calendar(identifier: .gregorian)
        myCalendar.calendar = gregorianCalendar
        
        myCalendar.backgroundColor = .white
        myCalendar.layer.cornerCurve = .continuous
        myCalendar.tintColor = UIColor.orange
        myCalendar.fontDesign = .rounded
        myCalendar.locale = Locale.init(identifier: "pt_BR")
    
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        myCalendar.selectionBehavior = dateSelection
        
        let pastDate = Calendar.current.date(byAdding: .year, value: -4, to: Date()) ?? Date()
        let endDate = Calendar.current.date(byAdding: .year, value: 4, to: Date()) ?? Date()
        myCalendar.availableDateRange = DateInterval.init(start: pastDate, end: endDate)
        self.calendarView.addSubview(myCalendar)
        myCalendar.frame = self.calendarView.bounds
        myCalendar.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
    }
}

extension CalendarViewController: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        
        if let selectedDate = dateComponents?.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            let formattedDate = dateFormatter.string(from: selectedDate)
            messageLabel.text = "Data selecionada: \(formattedDate)"
        }
    }
}
