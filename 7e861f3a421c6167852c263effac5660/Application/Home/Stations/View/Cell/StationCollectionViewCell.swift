//
//  StationCollectionViewCell.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 13.06.2021.
//

import UIKit

final class StationCollectionViewCell: UICollectionViewCell {

    static let reuseId = String(describing: type(of: StationCollectionViewCell.self))
    static let nib = UINib(nibName: reuseId, bundle: nil)
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    private func setup() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        containerView.layer.borderColor = ColorCompatibility.secondaryLabel.cgColor
        containerView.layer.borderWidth = 3
        containerView.layer.cornerRadius = 8
    }
}
