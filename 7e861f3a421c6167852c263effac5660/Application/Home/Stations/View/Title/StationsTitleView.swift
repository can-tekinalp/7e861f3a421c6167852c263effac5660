//
//  StationsTitleView.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 13.06.2021.
//

import UIKit

final class StationsTitleView: BaseXib {
    
    @IBOutlet weak var ugsPointsLabel: UILabel!
    @IBOutlet weak var eusPointsLabel: UILabel!
    @IBOutlet weak var dsPointsLabel: UILabel!
    
    func refresh() {
        ugsPointsLabel.text = String(GameManager.shared.player.ugsPoints)
        eusPointsLabel.text = String(GameManager.shared.player.eusPoints)
        dsPointsLabel.text = String(GameManager.shared.player.dsPoints)
    }
}
