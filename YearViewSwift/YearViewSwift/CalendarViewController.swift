//
//  CalendarViewController.swift
//  YearViewSwift
//
//  Created by Akkharawat Chayapiwat on 10/8/18.
//  Copyright © 2018 Akkharawat Chayapiwat. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    typealias DateMonthYear = (month: Int, year: Int)
    
    var dateMonthYear: DateMonthYear = (month: 10, year: 2018) {
        didSet {
            if(self.isLoaded) {
                self.renderCalendar()
            }
        }
    }
    
    var isLoaded: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        self.renderCalendar()
        isLoaded = true
        // Do any additional setup after loading the view.
    }
    
    static var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy'T'HH:mm:ss"
        return dateFormatter
    }()
    
    func renderCalendar() {
        topLabel.text  = "\(self.dateMonthYear.month)"
        let date = CalendarViewController.dateFormatter.date(from: String(format: "%2d-%2d-%2dT00:00:00", 1, dateMonthYear.month, dateMonthYear.year))!
        weekStackViews.forEach { (stackView) in
            stackView.arrangedSubviews.forEach({ (view) in
                view.removeFromSuperview()
            })
        }
        
        let startDay = Calendar.current.dateComponents([.weekday], from: date)
        
        let nOfDays = Calendar.current.range(of: Calendar.Component.day, in: Calendar.Component.month, for: date)!
        var stackIndex = 0
        var tempIndex = 0
        for i in -startDay.weekday!...nOfDays.count {
            let component: UIView
            if i > 0 {
                let label = UILabel(frame: CGRect.zero)
                label.font = UIFont.systemFont(ofSize: 8)
                label.text = "\(i)"
                component = label
            }else{
                component = UIView()
            }
            
            self.weekStackViews[stackIndex].addArrangedSubview(component)
            
            tempIndex += 1
            if(tempIndex == 7) {
                tempIndex = 0
                stackIndex += 1
            }
        }
        
    }

    @IBOutlet var weekStackViews: [UIStackView]!
    
    @IBOutlet var topLabel: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
