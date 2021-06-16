//
//  Player.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 15.06.2021.
//

import Foundation

final class Player: Codable {
    
    let name: String
    var ugsPoints: Int
    var eusPoints: Int
    let dsPoints: Int
    
    var currentStation: Station! {
        didSet {
            sync()
        }
    }
    
    var hitpoint = 100 {
        didSet {
            sync()
            playerDataChangedHandler()
        }
    }
    
    var playerDataChangedHandler: () -> Void = { }
    
    init(name: String, durability: Int, speed: Int, capacity: Int) {
        self.name = name
        self.dsPoints = durability * 10000
        self.eusPoints = speed * 20
        self.ugsPoints = capacity * 10000
    }
    
    func sync() {
        UserDefaults.player = self
    }
    
    func distance(to station: Station) -> Int {
        return currentStation.distance(to: station)
    }
    
    func travel(to station: Station) {
        let distance = currentStation.distance(to: station)
        guard eusPoints >= distance else { return }
        eusPoints -= distance
        let deliveryAmount = ugsPoints.clamped(to: 0...station.need)
        station.stock += deliveryAmount
        ugsPoints -= deliveryAmount
        currentStation.isCurrent = false
        station.isCurrent = true
        currentStation = station
    }
    
    func takeHit() {
        hitpoint -= 1
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case ugsPoints
        case eusPoints
        case dsPoints
        case currentStation
        case hitpoint
    }
}
