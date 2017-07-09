//
//  DetailsViewController.swift
//  Fiserv Booking System
//
//  Created by michele Miller on 3/07/17.
//  Copyright © 2017 AUTR&D. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    let device = UIDevice()
    
    //MARK: Outlets
    @IBOutlet weak var deviceOwner: UILabel!
    @IBOutlet weak var deviceName: UILabel!
    @IBOutlet weak var systemName: UILabel!
    @IBOutlet weak var systemVersion: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var localisedModel: UILabel!
    @IBOutlet weak var uuid: UILabel!
    
    
    
    override func viewDidLoad() {
        printDeviceDetailsToScreen()
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printDeviceDetailsToScreen() {
        deviceOwner.text = "Device Owner: Shane-o"
        deviceName.text = "Device Name: \(device.name)"
        systemName.text = "System Name: \(device.systemName)"
        systemVersion.text = "System Version: \(device.systemVersion)"
        model.text = "Model: \(device.model)"
        localisedModel.text = "Localised Model: \(device.localizedModel)"
        uuid.text = "UUID: \(device.identifierForVendor!)"
        
    }

    @IBAction func returnButton(_ sender: Any) {
        performSegue(withIdentifier: "segueReturn", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
