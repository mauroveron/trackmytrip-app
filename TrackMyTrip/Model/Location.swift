//
//  Location.swift
//  TrackMyTrip
//
//  Created by Mauro Verón on 12/06/16.
//  Copyright © 2016 Mauro Verón. All rights reserved.
//

import Foundation
import RealmSwift


class Location: Object {

    dynamic var timestamp: Double = 0
    dynamic var lat: Double = 0.0
    dynamic var lon: Double = 0.0
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
