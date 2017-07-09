//
//  BookedScreenViewController.swift
//  Fiserv Booking System
//
//  Created by Keith Miller on 29/06/17.
//  Copyright © 2017 AUTR&D. All rights reserved.
//

import UIKit

class BookedScreenViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var deviceOwner: UILabel!
    @IBOutlet weak var bookingTimer: UILabel!
    @IBOutlet weak var returnTimeLabel: UILabel!
    @IBOutlet weak var pinInputLabel: UILabel!
    
    //MARK: - Variables
    var timer = Timer()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        deviceOwner.text = "Device User: \(id)"
        returnTimeLabel.text = "Return Time: \(bookedDateString)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(BookedScreenViewController.counter), userInfo: nil, repeats: true)
        
        
    }
    
    //Buttons
    @IBAction func extendDevice(_ sender: Any) {
        //Use a datePicker for the extend date, then run the checkAndGetPinInput to check the pin.
    }
    
    @IBAction func returnDevice(_ sender: Any) {
        //Send SQL that device has been returned, remove core data of booking
        //Create a thankyou popup for using the system
        //Require PIN on return
        print("Returning Device")
        createAlert(title: "Returning Device", message: "Please Enter PIN Below")
    }
    
    
    //MARK: - Instance Methods
    func counter(){
        let currentDate = Date()
        let returnDate = Date(timeIntervalSinceReferenceDate: bookedTimeInSecondsSinceRef)
        let timeDifference = Int(returnDate.timeIntervalSince(currentDate))
        guard timeDifference > 0 else{
            //create alert for booking finished
            print("Running Guard")
            return
        }
        //Format string using division and modulous for days, hours and minutes
        let days = timeDifference/86400
        let hours = (timeDifference%86400) / 3600
        let mins = ((timeDifference%86400) % 3600) / 60
        
        var hoursText = String(hours)
        if(hours < 10){hoursText = "0" + hoursText}
        
        var minsText = String(mins)
        if(mins < 10){minsText = "0" + minsText}
        
        bookingTimer.text = "0\(days):\(hoursText):\(minsText)"
    }
    
    func CheckPinInput(pin: Int)  -> Bool{
        if(pin == 619){
            pinInputLabel.text = "Correct Pin"
            return true
        }else{
            pinInputLabel.text = "Incorrect Pin"
            return false
        }
    }
    
    func createAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: {(_ textField: UITextField) -> Void in
            textField.placeholder = "PIN"
            textField.isSecureTextEntry = true
            textField.keyboardType = .numberPad
        })
        let confirmAction = UIAlertAction(title: "Confirm PIN", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            print("PIN  = \(String(describing: alertController.textFields?[0].text))")
            //compare pin data here
            guard let pincode = Int((alertController.textFields?[0].text)!) else{
                print("nil input")
                return
                }
            if(self.CheckPinInput(pin: pincode)){
                //Change to main view controller
            }else{
            print("Back in the alerts yo")
            
            }
        })
        alertController.addAction(confirmAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            print("Cancelled Pin Input")
        })
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: { _ in })
    }
    
}


