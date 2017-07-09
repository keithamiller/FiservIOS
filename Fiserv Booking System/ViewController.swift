//
//  ViewController.swift
//  Fiserv Booking System
//
//  Created by Keith Miller on 28/06/17.
//  Copyright © 2017 AUTR&D. All rights reserved.
//

import UIKit

//Global Variables - Make these local when refactoring
var id = ""
var bookedDateString = " "
var bookedTimeInSecondsSinceRef = 0.0
var device = UIDevice()

class ViewController: UIViewController {
    
    //MARK - Outlets
    @IBOutlet weak var employeeID: UITextField!
    @IBOutlet weak var employeePIN: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!

    //MARK - Variables
    var PIN = 0
    
    //MARK - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        let calander = Calendar.current
        let currentHour = calander.component(.hour, from: date)
        let currentMinutes = calander.component(.hour, from: date)
        setUpDatePickerConstraints()
    }

    @IBAction func tapGesture(_ sender: Any) {
        self.view.endEditing(true)
        
    }
    //MARK - Action Buttons
    @IBAction func bookButton(_ sender: AnyObject) {
        guard let tempID = employeeID.text, employeeID.text != "", let tempPIN = Int(employeePIN.text!)  else{
            print("ID or PIN not entered")
            createBookingAlert(title: "Booking Failed", message: "Please make sure you complete all text fields.")
            return
        }
    
        if(checkBookingInputs(id: tempID, pin: tempPIN)){
            id = tempID
            PIN = tempPIN
            storeSelectedDate()
            performSegue(withIdentifier: "segueToBooked", sender: self)

        }else{
            createBookingAlert(title: "Failed", message: "Please enter correct employee credentials.")
        }
    }
    
    @IBAction func deviceDetails(_ sender: Any) {
        
    }
    //MARK - Instance Methods
    func checkBookingInputs(id: String, pin: Int) -> Bool{
        //Use connection with DB to check employee details entered against the database and return true if they match
        if(id == "Rey Mysterio" && pin == 619){
            return true
        }else{
            return false
        }
    }
    
    func storeSelectedDate(){
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM @ HH:mm"
        bookedDateString = dateFormatter.string(from: datePicker.date)
        bookedTimeInSecondsSinceRef = datePicker.date.timeIntervalSinceReferenceDate
        print("Booked time in minutes",bookedTimeInSecondsSinceRef)
    }
    
    func setUpDatePickerConstraints(){
        datePicker.minuteInterval = 15
        let currentDate = Date()
        let maxDate = Calendar.current.date(byAdding: .day, value: 5, to: currentDate)
        datePicker.minimumDate = currentDate
        datePicker.maximumDate = maxDate
        datePicker.locale = NSLocale(localeIdentifier: "en_GB") as Locale
        let dataPickerDate = currentDate.addingTimeInterval(14400)
        datePicker.date = dataPickerDate
    }
    
    func createBookingAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert,animated:true, completion: nil)
    
    }
}


