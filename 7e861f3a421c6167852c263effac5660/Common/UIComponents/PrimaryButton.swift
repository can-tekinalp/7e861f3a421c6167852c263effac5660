//
//  PrimaryButton.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 13.06.2021.
//

import UIKit

class PrimaryButton: UIButton {
    
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
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        backgroundColor = ColorCompatibility.label
        setTitleColor(ColorCompatibility.systemBackground, for: .normal)
    }
}
