//
//  CreateShipViewController.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 12.06.2021.
//

import UIKit

final class CreateShipViewController: UIViewController {
    
    private let titleView = CreateShipTitleView(frame: .zero)
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var durabilitySliderView: CreateShipSliderView!
    @IBOutlet weak var speedSliderView: CreateShipSliderView!
    @IBOutlet weak var capacitySliderView: CreateShipSliderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.titleView = titleView
        durabilitySliderView.title = "Dayanıklılık"
        speedSliderView.title = "Hız"
        capacitySliderView.title = "Kapasite"
    }
}
