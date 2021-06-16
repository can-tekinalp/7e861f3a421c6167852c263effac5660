//
//  StationsViewController.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 12.06.2021.
//

import UIKit

final class StationsViewController: BaseViewController {
    
    private let titleView = StationsTitleView(frame: .zero)
    @IBOutlet weak var headerView: StationsHeaderView!
    @IBOutlet weak var footerView: StationsFooterView!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: StationsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        setupBindings()
    }
    
    private func setupUI() {
        navigationItem.titleView = titleView
        tableView.register(
            UINib(nibName: StationsTableViewCell.reuseId, bundle: nil),
            forCellReuseIdentifier: StationsTableViewCell.reuseId
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
    }
    
    private func setupViewModel() {
        let stations = GameManager.shared.allStations
        viewModel = StationsViewModel(stations: stations)
        titleView.refresh()
        headerView.refresh()
        footerView.refresh()
    }
    
    private func setupBindings() {
        GameManager.shared.reloadStationsPageHandler = { [weak self] in
            self?.titleView.refresh()
            self?.headerView?.refresh()
            self?.footerView.refresh()
            self?.tableView?.reloadData()
        }
        
        headerView.searchTextChanged = { [weak self] searchText in
            self?.viewModel?.filter(by: searchText)
            self?.tableView?.reloadData()
        }
    }
}
extension StationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rowCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: StationsTableViewCell.reuseId,
            for: indexPath
        ) as! StationsTableViewCell
        let cellViewModel = viewModel?.getCellViewModel(at: indexPath)
        cell.configure(stationCellViewModel: cellViewModel)
        return cell
    }
}
