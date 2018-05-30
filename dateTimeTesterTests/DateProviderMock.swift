//
//  DateProviderMock.swift
//  dateTimeTesterTests
//
//  Created by Brian D Keane on 5/30/18.
//  Copyright © 2018 Brian D Keane. All rights reserved.
//

import UIKit
@testable import dateTimeTester

class DateProviderMock: DateProvider {
    var mockDate:Date!
    
    convenience init(year:Int, month:Int, day:Int, hour:Int, min:Int, second:Int) {
        self.init()
        var dc = DateComponents()
        dc.year = year
        dc.month = month
        dc.day = day
        dc.hour = hour
        dc.second = second
        self.mockDate = Calendar.current.date(from: dc)
    }
    
    override init() {
        super.init()
    }
    
    override func now() -> Date {
        return mockDate!
    }
}
