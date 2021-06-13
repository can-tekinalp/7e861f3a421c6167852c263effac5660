//
//  StationsViewController.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 12.06.2021.
//

import UIKit

final class StationsViewController: BaseViewController {
    
    private let titleView = StationsTitleView(frame: .zero)
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.titleView = titleView
        tableView.register(
            UINib(nibName: StationsTableViewCell.reuseId, bundle: nil),
            forCellReuseIdentifier: StationsTableViewCell.reuseId
        )
        tableView.estimatedSectionHeaderHeight = 130
        tableView.estimatedSectionFooterHeight = 85
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
    }
}
extension StationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(
            withIdentifier: StationsTableViewCell.reuseId,
            for: indexPath
        )
    }
}

extension StationsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return StationsHeaderView(frame: .zero)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return StationsFooterView(frame: .zero)
    }
}
