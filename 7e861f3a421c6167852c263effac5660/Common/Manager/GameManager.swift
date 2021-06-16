//
//  GameManager.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 15.06.2021.
//

import Foundation

final class GameManager {
    
    static var shared = GameManager()
    
    private var stations: [Station]!
    var player: Player!
    
    var allStations: [Station] {
        return stations ?? []
    }
    
    var currentStation: Station? {
        return stations.first(where: { $0.isCurrent} )
    }
    
    var timerTotalSeconds: Int {
        return player.dsPoints / 1000
    }
    
    var reloadStationsPageHandler: () -> Void = { }
    var relaodFavouritePageHandler: () -> Void = { }

    private init() { }
    
    func loadFromCache() {
        player = UserDefaults.player
        stations = UserDefaults.stations
        bindPlayer()
    }
    
    func initGame(player: Player, stationModels: [StationInfo]) {
        self.player = player
        let stations = stationModels.map { Station(stationInfo: $0) }
        let currentStation = stations.first { $0.name == "Dünya" }
        currentStation?.isCurrent = true
        self.player.currentStation = currentStation
        self.stations = stations
        self.player.sync()
        syncStations()
        bindPlayer()
    }
    
    func bindPlayer() {
        player.playerDataChangedHandler = { [weak self] in
            self?.callHandlers()
        }
    }
    
    func syncStations() {
        UserDefaults.stations = stations
    }
    
    func travel(to newStation: Station) {
        player.travel(to: newStation)
        syncStations()
        if player.ugsPoints == 0 || player.eusPoints == 0 {
            //
        }
        callHandlers()
    }
    
    func setStationIsFavourite(_ station: Station, isFavourite: Bool) {
        station.isFavourite = isFavourite
        syncStations()
        callHandlers()
    }
    
    private func callHandlers() {
        reloadStationsPageHandler()
        relaodFavouritePageHandler()
    }
}
