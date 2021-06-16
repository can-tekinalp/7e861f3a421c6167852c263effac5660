//
//  PrimaryButton.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 13.06.2021.
//

import UIKit

class PrimaryButton: UIButton {
    
    private var _isEnabled: Bool = true {
        didSet {
            isUserInteractionEnabled  = _isEnabled
            configureButton()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        layer.cornerRadius = 8
        backgroundColor = ColorCompatibility.label
        setTitleColor(ColorCompatibility.systemBackground, for: .normal)
    }
    
    func setButtonIsEnabled(_ isEnabled: Bool) {
        _isEnabled = isEnabled
    }
    
    private func configureButton() {
        backgroundColor = _isEnabled ? ColorCompatibility.label : ColorCompatibility.systemGray2
        setTitleColor(_isEnabled ? ColorCompatibility.systemBackground : .white, for: .normal)
    }
}

// MARK: Dark Mode Configurations
extension PrimaryButton {
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        configureButton()
    }
}
