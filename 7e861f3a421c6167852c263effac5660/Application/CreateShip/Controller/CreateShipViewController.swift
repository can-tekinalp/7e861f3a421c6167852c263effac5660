//
//  CreateShipViewController.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 12.06.2021.
//

import UIKit

final class CreateShipViewController: BaseViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var durabilitySliderView: CreateShipSliderView!
    @IBOutlet weak var speedSliderView: CreateShipSliderView!
    @IBOutlet weak var capacitySliderView: CreateShipSliderView!
    
    private let titleView = CreateShipTitleView(frame: .zero)
    private let createShipViewModel = CreateShipViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.titleView = titleView
        textField.autocorrectionType = .no
        setViewModels()
    }
    
    private func setViewModels() {
        durabilitySliderView.viewModel = createShipViewModel.durabilitySliderViewModel
        speedSliderView.viewModel = createShipViewModel.speedSliderViewModel
        capacitySliderView.viewModel = createShipViewModel.capacitySliderViewModel
        
        createShipViewModel.availablePointsChanged = { [weak self] points in
            self?.titleView.pointsLabel.text = points
        }
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
        let textCount = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0
        guard textCount > 0 else {
            showOkAlert(title: "Uyarı", message: "Lütfen isim giriniz.")
            return
        }
        
        if case let CreateShipResult.failure(errorMessage) = createShipViewModel.result {
            showOkAlert(title: "Uyarı", message: errorMessage)
            return
        }
        
        ActivityIndicatorManager.shared.show()
        GetStationsService.fetchStations { [weak self] (result) in
            ActivityIndicatorManager.shared.hide()
            switch result {
            case .success(let stations):
                self?.startGame(stations: stations)
            case .failure(let error):
                self?.showOkAlert(title: "Hata", message: error)
            }
        }
    }
    
    private func startGame(stations: [StationInfo]) {
        let player = Player(
            name: self.textField.text!,
            durability: self.durabilitySliderView.viewModel!.currentPoint,
            speed: self.speedSliderView.viewModel!.currentPoint,
            capacity: self.capacitySliderView.viewModel!.currentPoint
        )
        GameManager.shared.initGame(player: player, stationModels: stations)
        AppDelegate.shared.routeToHomePage()
    }
}
