//
//  CreateShipViewModel.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 13.06.2021.
//

import Foundation

final class CreateShipViewModel {
    
    private let totalPoint: Int = 15
    
    private lazy var availablePoint: Int = totalPoint {
        didSet {
            sliderViewModels.forEach { $0.availablePoint = availablePoint }
            availablePointsChanged(String(availablePoint))
        }
    }
    private var sliderViewModels: [CreateShipSliderViewModel] {
        return [
            durabilitySliderViewModel,
            speedSliderViewModel,
            capacitySliderViewModel,
        ]
    }
    
    lazy var durabilitySliderViewModel = CreateShipSliderViewModel(title: "Dayanıklılık", availablePoint: totalPoint)
    lazy var speedSliderViewModel = CreateShipSliderViewModel(title: "Hız", availablePoint: totalPoint)
    lazy var capacitySliderViewModel = CreateShipSliderViewModel(title: "Kapasite", availablePoint: totalPoint)
    
    var availablePointsChanged: (String) -> Void = { _ in }
    var didSpendAllPoints: Bool {
        return availablePoint == 0
    }
    
    init() {
        sliderViewModels.forEach {
            $0.currentPointChanged = { [weak self] in
                self?.handlePointChange()
            }
        }
    }
    
    private func handlePointChange() {
        let pointSpent = sliderViewModels.reduce(0) { $0 + $1.currentPoint }
        availablePoint = totalPoint - pointSpent
    }
}

final class CreateShipSliderViewModel {
    
    var title: String
    var availablePoint: Int
    var currentPoint: Int = 0 {
        didSet {
            currentPointChanged()
        }
    }
    var currentPointChanged: () -> Void =  { }
    
    var maxValue: Int {
        return currentPoint + availablePoint
    }
    
    init(title: String, availablePoint: Int) {
        self.title = title
        self.availablePoint = availablePoint
    }
}
