//
//  ViewController.swift
//  dateTimeTester
//
//  Created by Brian D Keane on 5/30/18.
//  Copyright © 2018 Brian D Keane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var displayTimeButton: UIButton!
    
    @objc var dateProvider:DateProvider! = DateProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func displayTimeButtonPressed(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .long
        
        DispatchQueue.main.async {
            self.timeLabel.text = dateFormatter.string(from: self.dateProvider.now())
        }
    }
}

