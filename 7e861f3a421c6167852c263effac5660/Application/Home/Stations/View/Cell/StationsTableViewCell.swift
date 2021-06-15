//
//  StationsTableViewCell.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 13.06.2021.
//

import UIKit

final class StationsTableViewCell: UITableViewCell {

    enum CellType { case stations, favourites }
    
    static let reuseId = "StationsTableViewCell"
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var travelButton: PrimaryButton!
    
    var cellType: CellType = .stations {
        didSet {
            travelButton.isHidden = cellType == .favourites
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        containerView.layer.cornerRadius = 8
    }
    
}
