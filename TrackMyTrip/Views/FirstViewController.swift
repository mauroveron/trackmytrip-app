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

    var manager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.distanceFilter = 200
        manager.requestAlwaysAuthorization()
        map?.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        NSLog("location update: \(newLocation.coordinate.latitude, newLocation.coordinate.longitude)")
        let location = Location()
        location.timestamp = NSDate().timeIntervalSince1970
        location.lat = newLocation.coordinate.latitude
        location.lon = newLocation.coordinate.longitude
        try! DBManager.realm.write {
            DBManager.realm.add(location)
        }
    }
    
    @IBAction func toggleTracking(sender: UISwitch) {
        if sender.on {
            manager.startUpdatingLocation()
            NSLog("--- started tracking")
        } else {
            manager.stopUpdatingLocation()
            NSLog("--- stopped tracking")
            let locations = DBManager.realm.objects(Location.self)
            print(locations.count)
        }
    }

}

