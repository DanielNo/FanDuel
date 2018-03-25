//
//  StatsTableViewDataSource.swift
//  FanDuel
//
//  Created by Daniel No on 3/21/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import Foundation
import UIKit

class StatsTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate
{
    var basketballData : BasketballData?
    let statsCellReuseID = "statsCell"

    
    init(_ basketballData : BasketballData) {
        self.basketballData = basketballData
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let players = basketballData?.players.count else{
            return 0
        }
//        print("player rows : \(players)")
        return players
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: statsCellReuseID) as! StatsTableViewCell
        cell.configureCellForGame(data: basketballData, indexPath: indexPath)
        return cell
    }
    
}

