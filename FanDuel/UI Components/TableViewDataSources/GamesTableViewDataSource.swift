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
        return games.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gameStates = basketballData?.game_states
        let game = gameStates?[indexPath.row]
        if let status = game?.game_status{
            switch status {
            case .final:
                let cell = tableView.dequeueReusableCell(withIdentifier: gameCompletedCellID) as! GameCompletedTableViewCell
                cell.configureCellForGame(data: basketballData, indexPath: indexPath)
                return cell

            case .inProgress:
                let cell = tableView.dequeueReusableCell(withIdentifier: gameInProgressCellID) as! GameInProgressTableViewCell
                cell.configureCellForGame(data: basketballData, indexPath: indexPath)
                return cell

            case .scheduled:
                let cell = tableView.dequeueReusableCell(withIdentifier: gameScheduledCellID) as! GameScheduledTableViewCell
                cell.centerView.shape = ViewShape.box
                cell.centerView.fillColor = UIColor.GamesColors.scheduledGame
                cell.configureCellForGame(data: basketballData, indexPath: indexPath)
                return cell

            default:
                print("")
            }

        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
}
