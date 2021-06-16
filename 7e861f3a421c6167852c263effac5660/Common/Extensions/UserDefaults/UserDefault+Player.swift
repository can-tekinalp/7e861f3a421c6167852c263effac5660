//
//  UserDefault+Player.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 16.06.2021.
//

import Foundation

extension UserDefaults {
    
    fileprivate static let playerLockQueue = DispatchQueue(label: "com.can.userdefaults.player", attributes: .concurrent)
    fileprivate static let key = "player"
    
    static var player: Player? {
        get {
            playerLockQueue.sync {
                guard let data = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
                return try? JSONDecoder().decode(Player.self, from: data)
            }
        }
        set {
            playerLockQueue.sync {
                let data = try? JSONEncoder().encode(newValue)
                UserDefaults.standard.setValue(data, forKey: key)
                UserDefaults.standard.synchronize()
            }
        }
    }
}
