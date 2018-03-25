//
//  GameScheduledTableViewCell.swift
//  FanDuel
//
//  Created by Daniel No on 3/23/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import UIKit

class GameScheduledTableViewCell: UITableViewCell {
    let cornerRadius : CGFloat = 10.0
    @IBOutlet weak var centerView: TriangleView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    
    @IBOutlet weak var homeTeamStats: UILabel!
    @IBOutlet weak var awayTeamStats: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var broadcastLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.roundCorners()
    }
    
    func roundCorners(){
        self.containerView.layer.cornerRadius = cornerRadius
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public func configureCellForGame(data : BasketballData?, indexPath : IndexPath){
        let gameStates = data?.game_states
        let game = gameStates?[indexPath.row]
        
        let gameID = game?.game_id
        if let homeID = data?.gameIDDict[gameID!]?.home_team_id, let awayID = data?.gameIDDict[gameID!]?.away_team_id{
            self.homeTeamName.text = data?.teamIDDict[homeID]?.name
            self.homeTeamStats.text = data?.teamIDDict[homeID]?.record
            self.awayTeamName.text = data?.teamIDDict[awayID]?.name
            self.awayTeamStats.text = data?.teamIDDict[awayID]?.record
        }
        
        self.broadcastLabel.text = game?.broadcast
        self.timeLabel.text = ""
    }



    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
