//
//  Station.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 16.06.2021.
//

import UIKit

final class Station: Codable {
    
    let stationInfo: StationInfo
    var isCurrent: Bool = false
    var isFavourite: Bool = false
    
    var name: String {
        get { return stationInfo.name }
    }
    
    var coordinateX: Int {
        get { return stationInfo.coordinateX }
    }
    
    var coordinateY: Int {
        get { return stationInfo.coordinateY }
    }
    
    var capacity: Int {
        get { return stationInfo.capacity }
    }
    
    var stock: Int {
        get { return stationInfo.stock }
        set { stationInfo.stock = newValue }
    }
    
    var need: Int {
        get { return capacity - stock }
    }
    
    init(stationInfo: StationInfo) {
        self.stationInfo = stationInfo
    }
    
    func distance(to station: Station) -> Int {
        let current = CGPoint(x: stationInfo.coordinateX, y: stationInfo.coordinateY)
        let target = CGPoint(x: station.stationInfo.coordinateX, y: station.stationInfo.coordinateY)
        return Int(current.distance(to: target))
    }
}
