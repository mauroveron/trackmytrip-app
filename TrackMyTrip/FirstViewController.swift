//
//  FirstViewController.swift
//  TrackMyTrip
//
//  Created by Mauro Verón on 11/06/16.
//  Copyright © 2016 Mauro Verón. All rights reserved.
//

import UIKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestAlwaysAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        NSLog("location update: \(newLocation.coordinate.latitude, newLocation.coordinate.longitude)")
    }
    
    @IBAction func toggleTracking(sender: UISwitch) {
        if sender.on {
            manager.startUpdatingLocation()
            NSLog("--- started tracking")
        } else {
            manager.stopUpdatingLocation()
            NSLog("--- stopped tracking")
        }
    }

}

