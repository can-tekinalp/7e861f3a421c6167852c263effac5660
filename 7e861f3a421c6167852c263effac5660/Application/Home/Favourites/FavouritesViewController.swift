//
//  FavouritesViewController.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 12.06.2021.
//

import UIKit

final class FavouritesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        tableView.register(
            UINib(nibName: StationsTableViewCell.reuseId, bundle: nil),
            forCellReuseIdentifier: StationsTableViewCell.reuseId
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
    }
}

extension FavouritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: StationsTableViewCell.reuseId,
            for: indexPath
        ) as! StationsTableViewCell
        
        cell.cellType = .favourites
        return cell
    }
}

extension FavouritesViewController: UITableViewDelegate { }
