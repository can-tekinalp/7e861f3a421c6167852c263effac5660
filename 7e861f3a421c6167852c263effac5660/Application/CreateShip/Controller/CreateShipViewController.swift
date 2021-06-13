//
//  CreateShipViewController.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 12.06.2021.
//

import UIKit

final class CreateShipViewController: UIViewController {
    
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
}
