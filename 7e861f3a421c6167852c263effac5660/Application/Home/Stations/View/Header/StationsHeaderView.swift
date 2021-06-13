//
//  StationsHeaderView.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 13.06.2021.
//

import UIKit

final class StationsHeaderView: BaseXib {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func initialConfiguration() {
        contentView.backgroundColor = ColorCompatibility.systemBackground
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
    }
}

extension StationsHeaderView: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

