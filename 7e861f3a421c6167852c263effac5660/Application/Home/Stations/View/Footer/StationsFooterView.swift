//
//  StationsFooterView.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 13.06.2021.
//

import UIKit

final class StationsFooterView: BaseXib {
    
    @IBOutlet weak var currentStationLabel: UILabel!
    
    override func initialConfiguration() {
        contentView.backgroundColor = ColorCompatibility.systemBackground
    }
    
    func refresh() {
        currentStationLabel.text = GameManager.shared.currentStation?.name
    }
}
