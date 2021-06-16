//
//  StationsViewModel.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 15.06.2021.
//

import Foundation

final class StationsViewModel {

    private let stationCellViewModels: [StationCellViewModel]
    private var filteredCellViewModels: [StationCellViewModel] = []

    var dataChanged: () -> Void = { }
    
    var rowCount: Int {
        return filteredCellViewModels.count
    }
    
    var currentStation: Station? {
        return GameManager.shared.currentStation
    }
    
    var playerHitpoint: String {
        return String(GameManager.shared.player.hitpoint)
    }
    
    var playerName: String {
        return GameManager.shared.player.name
    }
    
    init(stations: [Station]) {
        stationCellViewModels = stations.map { StationCellViewModel(station: $0) }
        filteredCellViewModels = stationCellViewModels
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> StationCellViewModel {
        return filteredCellViewModels[indexPath.row]
    }
    
    func filter(by text: String) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty {
            filteredCellViewModels = stationCellViewModels
            return
        }
        filteredCellViewModels = stationCellViewModels.filter {
            $0.stationName.localizedCaseInsensitiveContains(trimmed)
        }
    }
}

final class StationCellViewModel {
    
    private let station: Station
    
    var stationName: String {
        return station.name
    }
    
    var stockAndCapacityText: String {
        return "\(station.stock) / \(station.capacity)"
    }
    
    var eusText: String {
        let distance = GameManager.shared.player.distance(to: station)
        return "\(distance) EUS"
    }
    
    var isFavourite: Bool {
        return station.isFavourite
    }
    
    var isCurrentLocation: Bool {
        return station.isCurrent
    }
    
    init(station: Station) {
        self.station = station
    }
    
    func setIsFavourite(_ isFavourite: Bool) {
        GameManager.shared.setStationIsFavourite(station, isFavourite: isFavourite)
    }
    
    func travelButtonTapped() {
        GameManager.shared.travel(to: station)
    }
}
