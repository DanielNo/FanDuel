//
//  GameCompletedTableViewCell.swift
//  FanDuel
//
//  Created by Daniel No on 3/23/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import UIKit

class GameCompletedTableViewCell: UITableViewCell {
    @IBOutlet weak var centerView: TriangleView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var awayTeamView: UIView!
    @IBOutlet weak var homeTeamView: UIView!
    let cornerRadius : CGFloat = 10.0

    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var awayTeamScore: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    
    
    
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
            self.awayTeamName.text = data?.teamIDDict[awayID]?.name
            if let awayScore = game?.away_team_score, let homeScore = game?.home_team_score{
                self.centerView.shape = awayScore > homeScore ? ViewShape.leftTriangle : ViewShape.rightTriangle
                let winningTeamID = awayScore > homeScore ? awayID : homeID
                if let colorString = data?.teamIDDict[winningTeamID]?.color{
                    let winningColor = UIColor.colorFromHex(hex: colorString)
                    self.centerView.fillColor = winningColor
                }
            }

        }
        self.awayTeamScore.text = DisplayUnwrapper.displayValue(variable: game?.away_team_score)
        self.homeTeamScore.text = DisplayUnwrapper.displayValue(variable: game?.home_team_score)
    }



    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
