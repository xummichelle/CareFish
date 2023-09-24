//
//  ViewController.swift
//  CareFish
//
//  Created by Michelle Xu on 2023-09-23.
//

import HorizonCalendar
import UIKit


final class ViewController: UIViewController {
    @IBOutlet weak var headerBar: UIImageView!
    private lazy var calendarView = CalendarView(initialContent: makeContent())
    private lazy var calendar = Calendar.current
    private lazy var dayDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.locale = calendar.locale
        dateFormatter.dateFormat = DateFormatter.dateFormat(
          fromTemplate: "EEEE, MMM d, yyyy",
          options: 0,
          locale: calendar.locale ?? Locale.current)
        return dateFormatter
      }()
    
    private lazy var selectedDate = calendar.date(from: DateComponents(year: 2023, month: 01, day: 19))!
//    private lazy var selectedDates: [Date] = [calendar.date(from: DateComponents(year: 2023, month: 01, day: 19))!]
    private lazy var selectedDates: [Date] = []



    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(calendarView)
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: headerBar.bottomAnchor),
            calendarView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            calendarView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            calendarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        calendarView.daySelectionHandler = { [weak self] day in
              guard let self else { return }
//            selectedDate = calendar.date(from: day.components)!
            let selected = calendar.date(from: day.components)!
            if selectedDates.contains(selected) {
                let index = selectedDates.firstIndex(of: selected)
                selectedDates.remove(at: index!)
            } else {
                selectedDates.append(selected)
                      
            }
            calendarView.setContent(makeContent())
            
        }
    }
    
    private func makeContent() ->  CalendarViewContent {
        
        let startDate = calendar.date(from: DateComponents(year: 2023, month: 01, day: 01))!
        let endDate = calendar.date(from: DateComponents(year: 2023, month: 12, day: 31))!
        let selectedDates = selectedDates
        let content = CalendarViewContent(calendar: calendar,
                                          visibleDateRange: startDate...endDate,
                                          monthsLayout: .vertical(
                                            options: VerticalMonthsLayoutOptions(
                                              pinDaysOfWeekToTop: false,
                                              alwaysShowCompleteBoundaryMonths: false,
                                              scrollsToFirstMonthOnStatusBarTap: false)))
            .interMonthSpacing(24)
            .verticalDayMargin(8)
            .horizontalDayMargin(8)
            .monthDayInsets(NSDirectionalEdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 0))
            .dayItemProvider { [calendar, dayDateFormatter] day in
                    var invariantViewProperties = DayView.InvariantViewProperties.baseInteractive

                    let date = calendar.date(from: day.components)
                if selectedDates.contains(date!) {
                        invariantViewProperties.backgroundShapeDrawingConfig.fillColor = UIColor(red:0.4, green:0.65, blue:0.73, alpha:1)
                    }

                    return DayView.calendarItemModel(
                      invariantViewProperties: invariantViewProperties,
                      content: .init(
                        dayText: "\(day.day)",
                        accessibilityLabel: date.map { dayDateFormatter.string(from: $0) },
                        accessibilityHint: nil))
                  }
        return(content)
        
        
       
        
    }
    


}

