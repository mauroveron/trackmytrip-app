//
//  DBManager.swift
//  TrackMyTrip
//
//  Created by Mauro Verón on 12/06/16.
//  Copyright © 2016 Mauro Verón. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager
{
    private static var _realm: Realm?

    static var realm: Realm {
        if (self._realm == nil) {
            self._realm = try! Realm()
        }
        return self._realm!
    }

    init() {

    }

    /**
    Delete Realm database files
    */
    static func deleteDatabase() {
        let realmURL = Realm.Configuration.defaultConfiguration.fileURL!
        let realmURLs = [
            realmURL,
            realmURL.URLByAppendingPathExtension("lock"),
            realmURL.URLByAppendingPathExtension("log_a"),
            realmURL.URLByAppendingPathExtension("log_b"),
            realmURL.URLByAppendingPathExtension("note")
        ]
        let manager = NSFileManager.defaultManager()
        for URL in realmURLs {
            do {
                try manager.removeItemAtURL(URL)
            } catch {
                // handle error
            }
        }
    }

}