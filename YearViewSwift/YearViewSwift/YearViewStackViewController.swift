//
//  YearViewStackViewController.swift
//  YearViewSwift
//
//  Created by Akkharawat Chayapiwat on 10/8/18.
//  Copyright © 2018 Akkharawat Chayapiwat. All rights reserved.
//

import UIKit

class YearViewStackViewController: UIViewController {
    
    @IBOutlet var monthStackView: [UIStackView]!
    
    var controllers = [Int: CalendarViewController]()
    
    var year: Int = 2018 {
        didSet {
            self.reloadCalendar()
        }
    }
    
    func reloadCalendar() {
        topLabel.text = "\(self.year)"
        for i in (1...12) {
            let calendar = self.controllers[i]
            calendar?.dateMonthYear = (month: i, year: self.year)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topLabel.text = "\(self.year)"
        let bundle = Bundle(for: CalendarViewController.self)
        
        for i in (1...12) {
            let calendar = CalendarViewController(nibName: "CalendarViewController", bundle: bundle)
            calendar.dateMonthYear = (month: i, year: self.year)
            self.controllers[i] = calendar
            
            let tempIndex = Double((i-1) / 3)
            let stackIndex = floor(tempIndex)
            
            monthStackView[Int(stackIndex)].addArrangedSubview(calendar.view)
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLeftBtnTap(_ sender: Any) {
        self.year -= 1
    }
    
    @IBAction func onRightBtnTap(_ sender: Any) {
        self.year += 1
    }
    
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
