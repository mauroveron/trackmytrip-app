//
//  LocationManager.swift
//  TrackMyTrip
//
//  Created by Mauro Verón on 15/06/16.
//  Copyright © 2016 Mauro Verón. All rights reserved.
//

import Foundation
import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate
{
    let standardManager: CLLocationManager

    override init() {
        standardManager = CLLocationManager()
        super.init()

        standardManager.desiredAccuracy = kCLLocationAccuracyBest
        standardManager.delegate = self
        standardManager.activityType = CLActivityType.Fitness
        standardManager.distanceFilter = 50
        standardManager.pausesLocationUpdatesAutomatically = true
        standardManager.allowsBackgroundLocationUpdates = true
        standardManager.requestAlwaysAuthorization()
    }

    /**
    Start updating location
    */
    func startUpdatingLocation() {
        self.standardManager.startUpdatingLocation()
    }

    /**
    Stop updating location
    */
    func stopUpdatingLocation() {
        self.standardManager.stopUpdatingLocation()
    }

    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print("newLocation: \(newLocation)")

        let location            = Location()
        location.timestamp      = newLocation.timestamp.timeIntervalSince1970
        location.lat            = newLocation.coordinate.latitude
        location.lon            = newLocation.coordinate.longitude
        location.speed          = newLocation.speed
        location.altitude       = newLocation.altitude
        location.course         = newLocation.course

        try! DBManager.realm.write {
            DBManager.realm.add(location)
        }
    }
}