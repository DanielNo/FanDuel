//
//  GamesTableViewDataSource.swift
//  FanDuel
//
//  Created by Daniel No on 3/21/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import Foundation
import UIKit

class GamesTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate
{
    var basketballData : BasketballData?
    let gameInProgressCellID = "inProgressCell"
    let gameCompletedCellID = "completedCell"
    let gameScheduledCellID = "scheduledCell"

    init(_ basketballData : BasketballData) {
        self.basketballData = basketballData
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let games = basketballData?.game_states else{
         return 0
        }
//        print("game rows : \(games)")
        return games.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let status = basketballData?.game_states[indexPath.row].game_status{
            switch status {
            case .final:
                cell = tableView.dequeueReusableCell(withIdentifier: gameCompletedCellID) as! GameCompletedTableViewCell

            case .inProgress:
                cell = tableView.dequeueReusableCell(withIdentifier: gameInProgressCellID) as! GameInProgressTableViewCell

            case .scheduled:
                cell = tableView.dequeueReusableCell(withIdentifier: gameScheduledCellID) as! GameScheduledTableViewCell

            default:
                print("")
            }

        }
        
        
        return cell
    }
    
}
