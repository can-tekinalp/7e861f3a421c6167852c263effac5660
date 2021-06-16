//
//  UserDefaults+Stations.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 16.06.2021.
//

import Foundation

extension UserDefaults {
    
    fileprivate static let stationsLockQueue = DispatchQueue(label: "com.can.userdefaults.station", attributes: .concurrent)
    fileprivate static let key = "stations"
    
    static var stations: [Station]? {
        get {
            stationsLockQueue.sync {
                guard let data = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
                return try? JSONDecoder().decode([Station].self, from: data)
            }
        }
        set {
            stationsLockQueue.sync {
                let data = try? JSONEncoder().encode(newValue)
                UserDefaults.standard.setValue(data, forKey: key)
                UserDefaults.standard.synchronize()
            }
        }
    }
}
