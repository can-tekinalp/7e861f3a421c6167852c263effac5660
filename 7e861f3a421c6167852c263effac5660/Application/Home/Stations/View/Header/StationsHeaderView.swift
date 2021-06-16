//
//  StationsHeaderView.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 13.06.2021.
//

import UIKit

final class StationsHeaderView: BaseXib {

    @IBOutlet weak var spaceShipNameLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var hitPointLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private lazy var totalSeconds = GameManager.shared.timerTotalSeconds
    private var timer: Timer?
    private var seconds: Int = 0
    
    var searchTextChanged: (String) -> Void = { _ in }
    
    override func initialConfiguration() {
        contentView.backgroundColor = ColorCompatibility.systemBackground
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        secondsLabel.text = " "
        setupTimer()
    }

    private func setupTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(countDown),
            userInfo: nil,
            repeats: true
        )
        RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
        seconds = totalSeconds
    }
    
    func refresh() {
        spaceShipNameLabel.text = GameManager.shared.player.name
        hitPointLabel.text = String(GameManager.shared.player.hitpoint)
    }
    
    @objc private func countDown() {
        seconds -= 1
        
        if seconds <= 0 {
            if GameManager.shared.player.hitpoint == 0 {
                // game over
                return
            }
            timer?.invalidate()
            secondsLabel.text = "0"
            GameManager.shared.player.takeHit()
            setupTimer()
            return
        }
        
        secondsLabel.text = String(seconds)
    }
}

extension StationsHeaderView: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTextChanged(searchText)
    }
}

