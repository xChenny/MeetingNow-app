//
//  DayPickerViewController.swift
//  MeetingNow
//
//  Created by Andrew Chen on 3/21/19.
//  Copyright © 2019 Andrew Chen. All rights reserved.
//

import UIKit
import JTAppleCalendar

class DayPickerViewController: UIViewController {
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    
    let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DayPickerViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    
    public func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!

        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let dayCell = cell as! DayCell
        configureCell(dayCell: dayCell, cellState: cellState, date: date)
    }

    public func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableCell(withReuseIdentifier: "DayCell", for: indexPath) as! DayCell
        configureCell(dayCell: cell, cellState: cellState, date: date)
        return cell
    }
    
    func configureCell(dayCell: DayCell, cellState: CellState, date: Date) {
        dayCell.dayLabel.text = cellState.text
        dayCell.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0)
    }

}

extension Date {
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
}
