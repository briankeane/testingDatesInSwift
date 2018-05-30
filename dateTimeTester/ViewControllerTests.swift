//
//  ViewControllerTests.swift
//  dateTimeTesterTests
//
//  Created by Brian D Keane on 5/30/18.
//  Copyright © 2018 Brian D Keane. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import dateTimeTester

class ViewControllerTests: QuickSpec {
    override func spec() {
        describe ("ViewController") {
            var vc:ViewController!
            var dateProviderMock:DateProviderMock!
            
            func setupViewController() {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                
                dateProviderMock = DateProviderMock(year: 2010, month: 5, day: 15, hour: 13, min: 5, second: 5)
                vc.setValuesForKeys([
                    "dateProvider": dateProviderMock
                    ])
                let _ = vc.view
            }
            
            beforeEach {
                setupViewController()
            }
            
            it ("displays the time") {
                vc.displayTimeButton.sendActions(for: .touchUpInside)
                let dateFormatter = DateFormatter()
                dateFormatter.timeStyle = .long
                expect(vc.timeLabel.text!).toEventually(equal("1:00:05 PM CDT"))  
            }
        }
    }
}
