//
//  ExtendPopupVC.swift
//  Fiserv Booking System
//
//  Created by Keith Miller on 4/07/17.
//  Copyright © 2017 AUTR&D. All rights reserved.
//

import UIKit

class ExtendPopupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func cancelBooking(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
