//
//  StatsTableViewCell.swift
//  FanDuel
//
//  Created by Daniel No on 3/21/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import UIKit

class StatsTableViewCell: UITableViewCell {
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var nerdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureCellForGame(data : BasketballData?, indexPath : IndexPath){
        guard let player = data?.players[indexPath.row] else{
            return
        }
        if let name = player.name, let teamID = player.team_id{
            if let teamName = data?.teamAbbrevForID(teamID){
                self.topLabel.text = "\(name) - \(teamName)"
            }
        }
        if let stats = data?.playerStatsForID(player.id){
            if let assists = stats.assists, let pts = stats.points, let rebs = stats.rebounds, let nerd = stats.nerd{
                let formattedString = NSMutableAttributedString()
                formattedString
                    .bold("\(pts) Pts", size: 20.0)
                    .normal(",  \(assists) Ast, \(rebs) Reb")
                self.bottomLabel.attributedText = formattedString
                self.nerdLabel.text = String(nerd)
            }
        }

    }
    
    
}
