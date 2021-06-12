//
//  CreateShipSliderView.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 13.06.2021.
//

import UIKit

final class CreateShipSliderView: BaseXib {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var sliderValue: Int {
        return Int(roundf(slider.value))
    }
    
    override func initialConfiguration() {
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        let rounded = roundf(sender.value)
        sender.setValue(rounded, animated: false)
    }
}
