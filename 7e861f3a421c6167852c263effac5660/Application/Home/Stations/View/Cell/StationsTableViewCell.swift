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
    private static let favouriteImage = UIImage(named: "starFilled")
    private static let notFavouriteImage = UIImage(named: "star")
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var stockAndCapacityLabel: UILabel!
    @IBOutlet weak var eusLabel: UILabel!
    @IBOutlet weak var travelButton: PrimaryButton!
    
    var cellType: CellType = .stations {
        didSet {
            travelButton.isHidden = cellType == .favourites
        }
    }
    
    var stationCellViewModel: StationCellViewModel?
    
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
    
    func configure(stationCellViewModel: StationCellViewModel?) {
        guard let stationCellViewModel = stationCellViewModel else { return }
        self.stationCellViewModel = stationCellViewModel
        stationNameLabel.text = stationCellViewModel.stationName
        stockAndCapacityLabel.text = stationCellViewModel.stockAndCapacityText
        eusLabel.text = stationCellViewModel.eusText
        let image = stationCellViewModel.isFavourite ?
            StationsTableViewCell.favouriteImage :
            StationsTableViewCell.notFavouriteImage
        favouriteButton.setImage(image, for: .normal)
        travelButton.setButtonIsEnabled(!stationCellViewModel.isCurrentLocation)
    }
    
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        guard let stationCellViewModel = stationCellViewModel else { return }
        stationCellViewModel.setIsFavourite(!stationCellViewModel.isFavourite)
    }

    @IBAction func travelButtonTapped(_ sender: Any) {
        stationCellViewModel?.travelButtonTapped()
    }
}
