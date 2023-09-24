//
//  ViewController.swift
//  CareFish
//
//  Created by Michelle Xu on 2023-09-23.
//

import HorizonCalendar
import UIKit
import SwiftUI

final class ViewController: UIViewController {
    @IBOutlet weak var headerBar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Image View
//        let headerStackView = UIStackView()
//        headerStackView.backgroundColor = UIColor(red: 0.62, green: 0.76, blue: 0.76, alpha: 1)
//        headerStackView.heightAnchor.constraint(equalToConstant: 390).isActive = true
//        headerStackView.widthAnchor.constraint(equalToConstant: 159.0).isActive = true
//
//        //Text Label
//        let textLabel = UILabel()
//        textLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
//        textLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
//        textLabel.text  = "You can do anything!"
//        textLabel.textAlignment = .center
//
//        //Stack View
//        let mainStackView   = UIStackView()
//        mainStackView.axis  = NSLayoutConstraint.Axis.vertical
//        mainStackView.distribution  = UIStackView.Distribution.equalSpacing
//        mainStackView.alignment = UIStackView.Alignment.center
//        mainStackView.spacing   = 16.0
//
//        
//        headerStackView.addArrangedSubview(textLabel)
//        headerStackView.translatesAutoresizingMaskIntoConstraints = false
//        mainStackView.addArrangedSubview(headerStackView)
//        mainStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        self.view.addSubview(mainStackView)
//
//        //Constraints
//        mainStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        mainStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        createCalendar(mainStackView: mainStackView)
        createCalendar()
        
    }
    
    private func createCalendar() {
        
        let calendar = Calendar.current
        let startDate = calendar.date(from: DateComponents(year: 2023, month: 01, day: 01))!
        let endDate = calendar.date(from: DateComponents(year: 2024, month: 12, day: 31))!
        let content = CalendarViewContent(calendar: calendar,
                                          visibleDateRange: startDate...endDate,
                                          monthsLayout: .horizontal(
                                            options: HorizontalMonthsLayoutOptions(
                                            scrollingBehavior: .paginatedScrolling(
                                              .init(
                                                restingPosition: .atLeadingEdgeOfEachMonth,
                                                restingAffinity: .atPositionsClosestToTargetOffset)))))
        let calendarView = CalendarView(initialContent: content)
        calendarView.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        calendarView.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(calendarView)
//        NSLayoutConstraint.activate([
//            calendarView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 8),
//            calendarView.leftAnchor.constraint(equalTo: mainStackView.leftAnchor),
//            calendarView.rightAnchor.constraint(equalTo: mainStackView.rightAnchor),
//            calendarView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor)
//        ])
    }



}

