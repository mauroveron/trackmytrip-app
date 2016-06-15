//
//  FirstViewController.swift
//  TrackMyTrip
//
//  Created by Mauro Verón on 11/06/16.
//  Copyright © 2016 Mauro Verón. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import RealmSwift

class FirstViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView?

    var locationManager: LocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager = LocationManager()
        map?.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleTracking(sender: UISwitch) {
        if sender.on {
            locationManager.startUpdatingLocation()
            NSLog("--- started tracking")
        } else {
            locationManager.stopUpdatingLocation()
            NSLog("--- stopped tracking")
            let locations = DBManager.realm.objects(Location.self)
            print(locations.count)
        }
    }

}

