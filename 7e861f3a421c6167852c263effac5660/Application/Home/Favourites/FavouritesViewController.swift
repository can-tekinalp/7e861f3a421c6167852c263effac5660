//
//  FavouritesViewController.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 12.06.2021.
//

import UIKit

final class FavouritesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var favouritesViewModel: FavouritesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        
        GameManager.shared.relaodFavouritePageHandler = { [weak self] in
            self?.favouritesViewModel?.refresh()
            if self?.tabBarController?.selectedIndex == 1 {
                self?.tableView?.reloadSections([0], with: .automatic)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView?.reloadData()
    }
    
    private func setupUI() {
        tableView.register(
            UINib(nibName: StationsTableViewCell.reuseId, bundle: nil),
            forCellReuseIdentifier: StationsTableViewCell.reuseId
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
    }
    
    private func setupViewModel() {
        let stations = GameManager.shared.allStations
        favouritesViewModel = FavouritesViewModel(stations: stations)
    }
}

extension FavouritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouritesViewModel?.rowCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: StationsTableViewCell.reuseId,
            for: indexPath
        ) as! StationsTableViewCell
        let cellViewModel = favouritesViewModel?.getCellViewModel(at: indexPath)
        cell.cellType = .favourites
        cell.configure(stationCellViewModel: cellViewModel)
        return cell
    }
}

extension FavouritesViewController: UITableViewDelegate { }


final class FavouritesViewModel {

    private let stations: [Station]
    private var stationCellViewModels: [StationCellViewModel] = []
    
    var rowCount: Int {
        return stationCellViewModels.count
    }
    
    init(stations: [Station]) {
        self.stations = stations
        resetCellViewModels()
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> StationCellViewModel {
        return stationCellViewModels[indexPath.row]
    }
    
    func refresh() {
        resetCellViewModels()
    }
    
    private func resetCellViewModels() {
        self.stationCellViewModels = stations
            .filter { $0.isFavourite }
            .map { StationCellViewModel(station: $0) }
    }
}
