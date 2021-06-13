//
//  CreateShipSliderView.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 13.06.2021.
//

import UIKit

final class CreateShipSliderView: BaseXib {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var viewModel: CreateShipSliderViewModel? {
        didSet {
            titleLabel.text = viewModel?.title
        }
    }
    
    override func initialConfiguration() {
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        guard let viewModel = viewModel else { return }
        let newValue = Int(roundf(sender.value))
        let nextValue = newValue <= viewModel.maxValue ? Float(newValue) : Float(viewModel.currentPoint)
        sender.setValue(nextValue, animated: false)
        viewModel.currentPoint = Int(nextValue)
        pointsLabel.text = String(viewModel.currentPoint)
    }
}
